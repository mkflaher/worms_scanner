import cv2
import numpy as np

params = cv2.SimpleBlobDetector_Params()
params.minThreshold = 1
params.maxThreshold = 255

params.filterByColor = False
params.filterByArea = True
params.filterByConvexity = False
params.filterByCircularity = False
params.filterByInertia = True

params.minArea = 75
params.maxArea = 400

params.minInertiaRatio = 0
params.maxInertiaRatio = 0.5

detector = cv2.SimpleBlobDetector_create(params)

def segment(image):
    #TODO: implement for varying resolutions
    y_offset = 2400
    x_offset = 300
    y_size = 2400
    x_size = 1350
    y_inc = 4200
    x_inc = 2700

    regions = []

    for i in range(3):
        for j in range(4):
            region = image[y_offset+i*y_inc:y_offset+i*y_inc+y_size, x_offset+j*x_inc:x_offset+j*x_inc+x_size]
            regions += [region]

    return regions


#this function should only need to be done once, for the first scan
def acquire_ROI(image):
    #image: our scanned image cropped to the slot for one device
    #want to output image cropped to chamber using visual indications on the device

   edges = cv2.Canny(image,250,255) #TODO: find optimal thresholds
   edges = cv2.dilate(edges,None,iterations=3)
   edges = cv2.erode(edges,None,iterations=3)
   edges = cv2.dilate(edges,None,iterations=3)
   edges = cv2.erode(edges,None,iterations=3)
   edges = cv2.dilate(edges,None,iterations=3)
   ret = cv2.imwrite('canny.png',edges)
   _,contours,_ = cv2.findContours(edges, cv2.RETR_TREE,cv2.CHAIN_APPROX_NONE)
   c = max(contours, key=cv2.contourArea)
   (x,y,w,h) = cv2.boundingRect(c)
   #crop = image[y:y+h,x:x+w]

   return (x,y,w,h)

def blobdetect(image):
    #image: chamber of microfluidic device segmented from acquire_ROI
    #want to output keypoints of blobs for differencing between frames

    image = (255 - image) #invert for easier detection

    ret,thresh = cv2.threshold(image,15,255,cv2.THRESH_BINARY)
    keypoints = detector.detect(thresh)

    return keypoints



