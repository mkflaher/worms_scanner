#tasks
#label each device with temperature
#label fan speed
#label/set frequency of imaging
#label/set length of test
#file managing menu

from tkinter import *
from tkinter import messagebox
import time
import os, sys
from os import path
import PIL
from PIL import Image
import logging
import datetime

def time_now():
    now = datetime.datetime.now()
    return "{}/{}/{} {}:{}:{}".format(now.month, now.day, now.year, now.hour, now.minute, now.second)

#File handling - ensure directories exist
if not os.path.exists('images'):
        os.mkdir('images')
        
if not os.path.exists('logs'):
        os.mkdir('logs')

if not os.path.exists('tests'):
        os.mkdir('tests')

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

A1_temp = IntVar()
A3_temp = IntVar()
D1_temp = IntVar()
D3_temp = IntVar()

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

test_perHour = IntVar()
test_length = IntVar()
test_time = IntVar()
test_state = StringVar()



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

    test_perHour.set(0)
    test_length.set(0)
    test_time.set(0)
    test_state.set("No")

    logging.info("Data cleared to zero.")
    


def set_test():
    def ask():
        if (messagebox.askyesno("Set Test Title", "Confirm test?") is True):
            clear_data()
            StartTestButton.config(state="disabled")
            StopTestButton.config(state="active")
            ClearButton.config(state="disabled")
            test_state.set("Yes")

            test_perHour.set(frequency.get())
            test_length.set(hours.get())
            test_time.set(hours.get())
            app.update_idletasks
            set_test_window.destroy()
            logging.info("Test begun.")

    
    set_test_window = Toplevel(app)
    set_test_window.geometry("{0}x{1}+0+0".format(set_test_window.winfo_screenwidth()-3, set_test_window.winfo_screenheight()-3))
    set_test_window.option_add("*Label.Width", 30)

    Label(set_test_window, text="Imaging Frequency (per Hour)").grid(row=0, column=0)
    frequency = Scale(set_test_window, from_=1, to=60, orient="horizontal")
    frequency.grid(row=0, column=1)

    Label(set_test_window, text="Length of Test (Hours)").grid(row=1, column=0)
    hours = Scale(set_test_window, from_=1, to=24, orient="horizontal")
    hours.grid(row=1, column=1)
    
    Button(set_test_window, text="Confirm", command=ask).grid(row=2, column=0)



    

    


def stop_test():
    if (messagebox.askyesno("Stop Test Tilte", "Stop test?") is True):
            StartTestButton.config(state="active")
            StopTestButton.config(state="disabled")
            ClearButton.config(state="active")
            test_state.set("No")
            logging.info("Test stopped.")


def ask_clear_data():
    if (messagebox.askyesno("Stop Test Tilte", "Are you sure you want to clear current data?") is True):
        clear_data()

    


    
#Set original values to zero
clear_data()

menubar = Menu(app)

# create a pulldown menu, and add it to the menu bar
filemenu = Menu(menubar, tearoff=0)
filemenu.add_command(label="Save Images")
filemenu.add_separator()
filemenu.add_command(label="Exit", command=app.destroy)
menubar.add_cascade(label="File", menu=filemenu)

helpmenu = Menu(menubar, tearoff=0)
helpmenu.add_command(label="About")
menubar.add_cascade(label="Help", menu=helpmenu)

# display the menu
app.config(menu=menubar)



Label(app, width=1).grid(row=0,column=0)

Label(app, text="A", anchor="w", width=4).grid(row=1, column=4)
Label(app, textvariable=A1_worms, bg="lightblue", relief="sunken").grid(row=1,column=1)
Label(app, textvariable=A2_worms, bg="lightblue", relief="sunken").grid(row=1,column=2)
Label(app, textvariable=A3_worms, bg="lightblue", relief="sunken").grid(row=1,column=3)

Label(app, text="B", anchor="w", width=4).grid(row=2, column=4)
Label(app, textvariable=B1_worms, bg="lightblue", relief="sunken").grid(row=2,column=1)
Label(app, textvariable=B2_worms, bg="lightblue", relief="sunken").grid(row=2,column=2)
Label(app, textvariable=B3_worms, bg="lightblue", relief="sunken").grid(row=2,column=3)

Label(app, text="C", anchor="w", width=4).grid(row=3, column=4)
Label(app, textvariable=C1_worms, bg="lightblue", relief="sunken").grid(row=3,column=1)
Label(app, textvariable=C2_worms, bg="lightblue", relief="sunken").grid(row=3,column=2)
Label(app, textvariable=C3_worms, bg="lightblue", relief="sunken").grid(row=3,column=3)

Label(app, text="D", anchor="w", width=4).grid(row=4, column=4)
Label(app, textvariable=D1_worms, bg="lightblue", relief="sunken").grid(row=4,column=1)
Label(app, textvariable=D2_worms, bg="lightblue", relief="sunken").grid(row=4,column=2)
Label(app, textvariable=D3_worms, bg="lightblue", relief="sunken").grid(row=4,column=3)

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

Label(app, text="Speed (rpm):", width=11, anchor="e").grid(row=2, column=5)
Label(app, textvariable=fanspeed, anchor="w").grid(row=2, column=6)



StartTestButton = Button(app, text="Set Test", command=set_test)
StartTestButton.grid(row=3, column=5, rowspan=2)
StopTestButton = Button(app, text="Stop Test", state="disabled", command=stop_test)
StopTestButton.grid(row=3, column=6, rowspan=2)

Label(app, text="Testing:", anchor="e").grid(row=5, column=5)
Label(app, textvariable=test_state, anchor="w").grid(row=5, column=6)

Label(app, text="Total Hrs:", anchor="e").grid(row=6, column=5)
Label(app, textvariable=test_length, anchor="w").grid(row=6, column=6)

Label(app, text="Per Hr:", anchor="e").grid(row=7, column=5)
Label(app, textvariable=test_perHour, anchor="w").grid(row=7,column=6)

Label(app, text="Hrs left:", anchor="e").grid(row=8, column=5)
Label(app, textvariable=test_time, anchor="w").grid(row=8, column=6)

ClearButton = Button(app, text="Clear Data", command=ask_clear_data)
ClearButton.grid(row=9, column=2)

#run GUI continuously
app.mainloop()

#Close logging file

if (test_state.get() == "Yes"):
    logging.warning("SESSION CLOSED WHILE TEST WAS RUNNING. TEST ENDED UNEXPECTEDLY.")

logging.info("Session ended.")
logger_file.close()

