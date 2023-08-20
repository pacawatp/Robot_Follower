#!/usr/bin/env python3
import cv2
import rospy
from cv_bridge import CvBridge
from sensor_msgs.msg import Image
import mediapipe as mp

mpHands = mp.solutions.hands
hands = mpHands.Hands()
mpDraw = mp.solutions.drawing_utils


class OpenCVROS(object):
    def __init__(self) -> None:
        rospy.init_node("opencv_ros", anonymous=True)
        #self.img_sub = rospy.Subscriber("/usb_cam/image_raw", Image, callback = self.image_callback)  #webcam
        #self.img_sub = rospy.Subscriber("/camera/rgb/image_raw", Image, callback = self.image_callback) #rgb kinect
        self.img_sub = rospy.Subscriber("/camera/depth_registered/image_raw", Image, callback = self.image_callback)
        self.bridge = CvBridge()
        self.image = None
    
    def image_callback(self, data):
        self.image = self.bridge.imgmsg_to_cv2(data, desired_encoding="")
    
    def image_callback_depth(self, data):
        self.image = self.bridge.imgmsg_to_cv2(data)

    
    def main(self):
    	count = 0
    	L = False
    	R = False
    	cx_old = None
    	while not rospy.is_shutdown():
            if self.image is None:
                print( self.image.shape )
                continue
            	
            cv2.imshow("image", self.image)
            #print( self.image_depth.shape )
            #print( self.image )
            #break
            if cv2.waitKey(100) == ord('q'):
            		exit()

if __name__ == "__main__":
    opencv_ros = OpenCVROS()
    opencv_ros.main()
