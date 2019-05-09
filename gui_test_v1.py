#tasks
#label each device with temperature
#label fan speed
#label/set frequency of imaging
#label/set length of test
#file managing menu
from tkinter import *
from tkinter import messagebox
from tkinter import ttk
import time
import os, sys
from os import path
import PIL
from PIL import Image
import logging
import datetime
import threading
from queue import Queue
import subprocess
import cv2
import numpy as np
import worm_util
from watchdog.observers import Observer
from watchdog.events import FileSystemEventHandler
import serial #NOTE: serial requires sudo
import re #regexes for sanitizing serial inputs


def time_now():
    now = datetime.datetime.now()
    return "{}/{}/{} {}:{}:{}".format(now.month, now.day, now.year, now.hour, now.minute, now.second)

#File handling - ensure directories exist

if not os.path.exists('scans'):
    os.mkdir('scans')

if not os.path.exists('images'):
    os.mkdir('images')
        
if not os.path.exists('logs'):
    os.mkdir('logs')

if not os.path.exists('tests'):
    os.mkdir('tests')

#serial for temp sensor/fan control


#start by removing all files from scans folder
for f in os.listdir('scans'):
    try:
        os.remove('scans/' + f)
    except:
        pass

ser = ''
try:

    ser = serial.Serial('/dev/ttyACM0',9600)
except: 
    print('Could not open serial port /dev/ttyACM0')

#Create logging file
now = datetime.datetime.now()
loggername = "LOG-{}_{}_{}-{}_{}_{}.log".format(now.month, now.day, now.year, now.hour, now.minute, now.second)
logger_file = open('logs/'+loggername, 'w')

#Set up logger
logging.basicConfig(level=logging.DEBUG, filename='logs/'+loggername, format='%(asctime)s:%(levelname)s:%(message)s')
logging.info("Session begun.")


app=Tk()

pad=3
app.geometry("{0}x{1}+0+0".format(app.winfo_screenwidth()-3, app.winfo_screenheight()-3))

app.winfo_toplevel().title("Nematode Imaging GUI")
app.option_add("*Label.Width", 7)

stop_threads = False

A1_temp = DoubleVar()
A3_temp = DoubleVar()
D1_temp = DoubleVar()
D3_temp = DoubleVar()

A1_worms = IntVar()
A2_worms = IntVar()
A3_worms = IntVar()
B1_worms = IntVar()
B2_worms = IntVar()
B3_worms = IntVar()
C1_worms = IntVar()
C2_worms = IntVar()
C3_worms = IntVar()
D1_worms = IntVar()
D2_worms = IntVar()
D3_worms = IntVar()

fanspeed = IntVar()
fan_state = StringVar()
fan_state.set("Off")

test_scanDelay = IntVar()
test_time_remaining = StringVar()
test_length = IntVar()
test_time = IntVar()
test_state = StringVar()
first = True
resolution = 1200 #implement this later
crops = []
roi_seg = [[[]]]*12 #array of 12 empty 2d arrays
kp_last = [[]]*12
kp_dead = {} #array of 12 empty arrays

for i in range(12):
    kp_dead[str(i)]=[]

class Watcher:
    DIRECTORY_TO_WATCH = '/home/meryl/worms_counter/scans'
    def __init__(self):
        self.observer = Observer()

    def run(self):
        print('Watcher running')
        event_handler = Handler()
        self.observer.schedule(event_handler, self.DIRECTORY_TO_WATCH, recursive=True)
        self.observer.start()
        try:
            while True:
                if stop_threads:
                    break
                time.sleep(1)
        except:
            self.observer.stop()
            print('Stopping watcher.')
        self.observer.join()

#This is where image processing happens
class Handler(FileSystemEventHandler):
    @staticmethod
    def on_any_event(event):
        global crops, first, roi_seg, kp_dead, kp_last
        global A1_worms
        global A2_worms
        global A3_worms
        global B1_worms
        global B2_worms
        global B3_worms
        global C1_worms
        global C2_worms
        global C3_worms
        global D1_worms
        global D2_worms
        global D3_worms

        if event.is_directory:
            return None
        elif event.event_type == 'created':
            print('File created: %s' % event.src_path)
            #want to watch to make sure file creation is done before image processing happens

            size_old = 0
            while True:
                if stop_threads:
                    break
                size_new = os.path.getsize(event.src_path)

                if (size_new == size_old) and (size_new > 0):
                    #print('file complete')
                    break
                time.sleep(5)
                #print('new size: %d' % size_new)
                #print('old size: %d' % size_old)
                size_old = size_new

            #when broken out of file size loop, start the image processing

            raw = cv2.imread(event.src_path, cv2.IMREAD_GRAYSCALE)
            regions = worm_util.segment(raw)
            raw = [] #clear raw for less memory usage
            os.remove(event.src_path) #don't want to keep it in file system either

            if first:
                for region in regions:
                    crop = worm_util.acquire_ROI(region)
                    crops += [crop]
                first = False
            
            for i,region in enumerate(regions):
                x = crops[i][0]
                y = crops[i][1]
                w = crops[i][2]
                h = crops[i][3]

                roi = region[y:y+h,x:x+h]
                roi_seg[i] = roi

                localtime = time.localtime(time.time())
                datename = str(localtime.tm_year) + str(localtime.tm_mon).zfill(2) + str(localtime.tm_mday).zfill(2)

                if not os.path.exists('images/'+ datename):
                    os.mkdir('images/' + datename) # make directory for date

                for i in range(1,13):
                    if not os.path.exists('images/' + datename + '/%d' % i):
                        os.mkdir('images/' + datename + '/%d' % i)

               # ret = cv2.imwrite('images/crop%d' % i + '.png', roi)

            for i,roi in enumerate(roi_seg):

                keypoints = worm_util.blobdetect(roi)
                im_with_kp = cv2.drawKeypoints((255 - roi),keypoints,np.array([]),(0,255,0),cv2.DRAW_MATCHES_FLAGS_DRAW_RICH_KEYPOINTS)

                filename = 'kp_' + str(localtime.tm_hour*100 + localtime.tm_min).zfill(4) + '.png'
                ret = cv2.imwrite('images/' + datename + '/' +  str(i+1) + '/' + filename, im_with_kp)
                
                #print(kp_last[i])

                kps_to_add = []

                for kp1 in keypoints:
                    for kp2 in kp_last[i]:
                        if np.sqrt((kp1.pt[0] - kp2.pt[0])**2 + (kp1.pt[1] - kp2.pt[1])**2) < 10:
                            kps_to_add += [kp1]

                            #now find which ones to remove to avoid duplicates

                    for kp3 in kp_dead[str(i)]: #want to avoid duplicates
                        if np.sqrt((kp1.pt[0] - kp3.pt[0])**2 + (kp1.pt[1] - kp3.pt[1])**2) < 10:
                            kps_to_add = kps_to_add.remove(kp1)


                #print('KEYPOINTS FOR CURRENT FRAME') 
                #print([kp1.pt for kp1 in keypoints])
                #print('KEYPOINTS FOR PREVIOUS FRAME')
                #print([kp2.pt for kp2 in kp_last[i]])
                #print('DEAD KEYPOINTS')
                #print([kp3.pt for kp3 in kp_dead[i]])

                #print('NEW DEAD KEYPOINTS:')
                #print([kp4.pt for kp4 in kps_to_add])

                #problem occurs here

                kp_dead[str(i)] += kps_to_add
                kp_last[i] = keypoints

                #print('Dead Keypoints: ', len(kp_dead[str(i)]))
            #update dead worm counts
            
            #print('DEAD KEYPOINT LIST')
            #print(kp_dead)


            A1_worms.set(len(kp_dead[str(0)]))
            A2_worms.set(len(kp_dead[str(1)]))
            A3_worms.set(len(kp_dead[str(2)]))
            B1_worms.set(len(kp_dead[str(3)]))
            B2_worms.set(len(kp_dead[str(4)]))
            B3_worms.set(len(kp_dead[str(5)]))
            C1_worms.set(len(kp_dead[str(6)]))
            C2_worms.set(len(kp_dead[str(7)]))
            C3_worms.set(len(kp_dead[str(8)]))
            D1_worms.set(len(kp_dead[str(9)]))
            D2_worms.set(len(kp_dead[str(10)]))
            D3_worms.set(len(kp_dead[str(11)]))

        try:
            os.remove(event.src_path)
        except:
            pass


def timer(length):
    time_start = time.time()
    seconds = 0
        
    while (seconds < length):
        global stop_threads 
        if stop_threads: 
            break
        time.sleep(1)
        seconds = int(time.time() - time_start)

        t = length - seconds
        hr = t//3600
        m =  (t-3600*hr)//60
        s =  t%60

        test_time_remaining.set(str(hr)+" : "+str(m).zfill(2)+" : "+str(s).zfill(2))

    return

def read_serial():
    val = 0
    fan = 0
    warning = 0 #flag to determine whether warning appears. 1 = no warning, 0 = show warning

    while True:
        if stop_threads:
            break

        line = ''
        split = []
        try:
            line = ser.readline()
            split = line.decode().split(':') #split lines with colon delimeter

        except:
            pass

        if len(split) > 1:

            val = float(re.sub("[^0-9.]","",split[1]))
            if 'Sensor 1' in split[0]:
                A1_temp.set(val)
            if 'Sensor 2' in split[0]:
                A3_temp.set(val)
            if 'Sensor 3' in split[0]:
                D1_temp.set(val)
            if 'Sensor 4' in split[0]:
                D3_temp.set(val)

            if 'Fan' in split[0]:
                fan = 1
            if fan:
                fan_state.set('On')
                warning = 0
            else:
                fan_state.set('Off')
                warning = 1

        #print(val) #test output
        if fan == 0 and val > 20 and warning == 1:
            messagebox.showwarning("Temperature Warning", "Fan is not running!")
            warning = 1

def scan():
    subprocess.call('./scan.sh')

def scan_timer():
    scanned = 0
    global stop_threads
    while (scanned < test_length.get()):
        if stop_threads:
            break

        scan_thread = threading.Thread(target = scan)
        scan_thread.daemon = True
        scan_thread.start()

        seconds = 0
        while (seconds < test_scanDelay.get()*60):
            if stop_threads:
                break
            time.sleep(1)
            seconds += 1

        scanned += 1

def perform_test():
    global stop_threads
    stop_threads = False

    w = Watcher()
    watch_thread = threading.Thread(target = w.run)
    watch_thread.daemon = True
    watch_thread.start()
    
    scan_thread = threading.Thread(target = scan_timer)
    scan_thread.daemon = True
    scan_thread.start()

    serial_thread = threading.Thread(target = read_serial)
    serial_thread.daemon = True
    serial_thread.start()

    #def test_functions():
        #loop - this entire thing needs a thread - perform after popping one timer(), run as many times as scans will occur
        #   push a scan
        #   file handle
        #   crop all 12 images
        #   if sufficient number of scans has been completed to count worms (2? 3? 4?), update dead worm count per device

    timer_thread = threading.Thread(target = lambda: timer(test_scanDelay.get()*60*test_length.get()))
    timer_thread.daemon = True
    timer_thread.start()

def clear_data():
    A1_temp.set(0)
    A3_temp.set(0)
    D1_temp.set(0)
    D3_temp.set(0)

    A1_worms.set(0)
    A2_worms.set(0)
    A3_worms.set(0)
    B1_worms.set(0)
    B2_worms.set(0)
    B3_worms.set(0)
    C1_worms.set(0)
    C2_worms.set(0)
    C3_worms.set(0)
    D1_worms.set(0)
    D2_worms.set(0)
    D3_worms.set(0)

    fanspeed.set(0)
    fan_state.set("Off")

    test_scanDelay.set(0)
    test_length.set(0)
    test_time.set(0)
    test_time_remaining.set("-")
    test_state.set("No")

    kp_dead = {}

    logging.info("Data cleared to zero.")
    global stop_threads
    stop_threads = True
    


def set_test():
    def ask():
        if (messagebox.askyesno("Set Test Title", "Confirm test?") is True):
            clear_data()
            StartTestButton.config(state="disabled")
            StopTestButton.config(state="active")
            ClearButton.config(state="disabled")
            test_state.set("Yes")

            test_scanDelay.set(scan_delay.get())
            test_length.set(scan_num.get())
            
            app.update_idletasks
            set_test_window.destroy()
            logging.info("Test begun.")
            
            t = test_scanDelay.get()*60*test_length.get()
            hr = t//3600
            m =  (t-3600*hr)//60
            s =  t%60

            test_time_remaining.set(str(hr)+" : "+str(m)+" : "+str(s))
            
            perform_test()

    
    set_test_window = Toplevel(app)
    set_test_window.geometry("{0}x{1}+0+0".format(set_test_window.winfo_screenwidth()-3, set_test_window.winfo_screenheight()-3))
    set_test_window.option_add("*Label.Width", 30)

    Label(set_test_window, text="Scan every X minutes").grid(row=0, column=0)
    scan_delay = Scale(set_test_window, from_=5, to=60, orient="horizontal")
    scan_delay.grid(row=0, column=1)

    Label(set_test_window, text="Number of Scans").grid(row=1, column=0)
    scan_num = Scale(set_test_window, from_=1, to=60, orient="horizontal")
    scan_num.grid(row=1, column=1)
    
    Button(set_test_window, text="Confirm", command=ask).grid(row=2, column=0)

def stop_test():
    if (messagebox.askyesno("Stop Test Tilte", "Stop test?") is True):
            StartTestButton.config(state="active")
            StopTestButton.config(state="disabled")
            ClearButton.config(state="active")
            test_state.set("No")
            logging.info("Test stopped.")
            global stop_threads

            subprocess.call('killall scanimage', shell=True)
            for f in os.listdir('scans'):
                try:
                    os.remove('scans/' + f)
                except:
                    pass
            stop_threads = True


def ask_clear_data():
    if (messagebox.askyesno("Stop Test Tilte", "Are you sure you want to clear current data?") is True):
        clear_data()

#account for deleting window
def _delete_window():
    global stop_threads
    if (test_state.get() == "Yes"):
        messagebox.showwarning(" ","Cannot close while test is running")
    else:
        stop_threads = True
        app.destroy()
        
app.protocol("WM_DELETE_WINDOW", _delete_window)

    
#Set original values to zero
clear_data()

#menubar = Menu(app)

# create a pulldown menu, and add it to the menu bar
#filemenu = Menu(menubar, tearoff=0)
#filemenu.add_command(label="Save Images")
#filemenu.add_separator()
#filemenu.add_command(label="Exit", command=app.destroy)
#menubar.add_cascade(label="File", menu=filemenu)
#
#helpmenu = Menu(menubar, tearoff=0)
#helpmenu.add_command(label="About")
#menubar.add_cascade(label="Help", menu=helpmenu)
#
## display the menu
#app.config(menu=menubar)



Label(app, width=1).grid(row=0,column=0)

Label(app, text="A", anchor="w", width=4).grid(row=1, column=4)
Label(app, textvariable=A1_worms, bg="lightblue", fg="black", relief="sunken").grid(row=1,column=1)
Label(app, textvariable=A2_worms, bg="lightblue", fg="black", relief="sunken").grid(row=1,column=2)
Label(app, textvariable=A3_worms, bg="lightblue", fg="black", relief="sunken").grid(row=1,column=3)

Label(app, text="B", anchor="w", width=4).grid(row=2, column=4)
Label(app, textvariable=B1_worms, bg="lightblue", fg="black", relief="sunken").grid(row=2,column=1)
Label(app, textvariable=B2_worms, bg="lightblue", fg="black", relief="sunken").grid(row=2,column=2)
Label(app, textvariable=B3_worms, bg="lightblue", fg="black", relief="sunken").grid(row=2,column=3)

Label(app, text="C", anchor="w", width=4).grid(row=3, column=4)
Label(app, textvariable=C1_worms, bg="lightblue", fg="black", relief="sunken").grid(row=3,column=1)
Label(app, textvariable=C2_worms, bg="lightblue", fg="black", relief="sunken").grid(row=3,column=2)
Label(app, textvariable=C3_worms, bg="lightblue", fg="black", relief="sunken").grid(row=3,column=3)

Label(app, text="D", anchor="w", width=4).grid(row=4, column=4)
Label(app, textvariable=D1_worms, bg="lightblue", fg="black", relief="sunken").grid(row=4,column=1)
Label(app, textvariable=D2_worms, bg="lightblue", fg="black", relief="sunken").grid(row=4,column=2)
Label(app, textvariable=D3_worms, bg="lightblue", fg="black", relief="sunken").grid(row=4,column=3)

Label(app, text="3").grid(row=0, column=1)
Label(app, text="2").grid(row=0, column=2)
Label(app, text="1").grid(row=0, column=3)

Label(app, text="Above: # of dead found", width=30).grid(row=5, column=1, columnspan=4, sticky="w")

Label(app, text="Device Temp (C)", width=15).grid(row=6, column=1, columnspan=4)
Label(app, text="TA3:", anchor="e").grid(row=7, column=1)
Label(app, textvariable=A3_temp, anchor="w").grid(row=7, column=2)
Label(app, text="TA1:", anchor="e").grid(row=7, column=3)
Label(app, textvariable=A1_temp, anchor="w").grid(row=7, column=4)
Label(app, text="TD3:", anchor="e").grid(row=8, column=1)
Label(app, textvariable=D3_temp, anchor="w").grid(row=8, column=2)
Label(app, text="TD1:", anchor="e").grid(row=8, column=3)
Label(app, textvariable=D1_temp, anchor="w").grid(row=8, column=4)


Label(app, text="Fan State:", anchor="e", width=10).grid(row=1,column=5)
Label(app, textvariable=fan_state, anchor="w").grid(row=1, column=6)

#Label(app, text="Speed (rpm):", width=11, anchor="e").grid(row=2, column=5)
#Label(app, textvariable=fanspeed, anchor="w").grid(row=2, column=6)

StartTestButton = Button(app, text="Set Test", command=set_test)
StartTestButton.grid(row=3, column=5, rowspan=2)
StopTestButton = Button(app, text="Stop Test", state="disabled", command=stop_test)
StopTestButton.grid(row=3, column=6, rowspan=2)

Label(app, text="Testing:", anchor="e",width=25).grid(row=5, column=5)
Label(app, textvariable=test_state, anchor="w").grid(row=5, column=6)

Label(app, text="Minutes between scans:", anchor="e",width=25).grid(row=6, column=5)
Label(app, textvariable=test_scanDelay, anchor="w").grid(row=6, column=6)

Label(app, text="Number of scans:", anchor="e",width=25).grid(row=7, column=5)
Label(app, textvariable=test_length, anchor="w").grid(row=7,column=6)

Label(app, text="Time left:", anchor="e",width=25).grid(row=8, column=5)
Label(app, textvariable=test_time_remaining, anchor="w",width=10).grid(row=8, column=6, columnspan=5, sticky="w")

ClearButton = Button(app, text="Clear Data", command=ask_clear_data)
ClearButton.grid(row=9, column=2)

#run GUI continuously
app.mainloop()

#Close logging file

if (test_state.get() == "Yes"):
    logging.warning("SESSION CLOSED WHILE TEST WAS RUNNING. TEST ENDED UNEXPECTEDLY.")

logging.info("Session ended.")
logger_file.close()

#remove all files from scans upon closing
subprocess.call('killall scanimage', shell=True) #soft-kills scan process
for f in os.listdir('scans'):
    try:
        os.remove('scans/' + f)
    except:
        pass

stop_threads = True

