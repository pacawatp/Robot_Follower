#!/usr/bin/env python
import rospy
import smach
import smach_ros  #install in workshop
import cv2
from cv_bridge import CvBridge
from sensor_msgs.msg import Image
import mediapipe as mp   #install --> python3 -m pip install mediapipe
import threading
import speech_recognition as sr
import time
import os
import numpy as np
from geometry_msgs.msg import Twist
import sys, select, termios, tty

#Setting
# roscore
# roslaunch your_package usb_cam.launch
# roslaunch turtlebot_bringup minimal.launch
# save this file in ../your_package/scripe/

mpHands = mp.solutions.hands
hands = mpHands.Hands()
mpDraw = mp.solutions.drawing_utils

mp_face_detection = mp.solutions.face_detection
face_detection = mp_face_detection.FaceDetection(model_selection=0, min_detection_confidence=0.5)
mp_drawing = mp.solutions.drawing_utils

class OpenCVROS(object):
    def __init__(self)->None:
        self.img_sub = rospy.Subscriber("/usb_cam/image_raw", Image, callback = self.image_callback)  #camera
        #self.img_sub = rospy.Subscriber("/camera/rgb/image_raw", Image, callback = self.image_callback) #rgb kinect
        self.bridge = CvBridge()
        self.image = None
    
    def image_callback(self, data):
        self.image = self.bridge.imgmsg_to_cv2(data, desired_encoding="bgr8")

    def main(self):
        L = False
        R = False
        cx_old = None
        while not rospy.is_shutdown():
            if self.image is None:
            	continue
            imageRGB = cv2.cvtColor(self.image, cv2.COLOR_BGR2RGB)
            results = hands.process(imageRGB)
            gap = self.image.shape[0] // 50
            #time.sleep(0.1)
            if results.multi_hand_landmarks:
                for handLms in results.multi_hand_landmarks: # working with each hand
                    for id, lm in enumerate(handLms.landmark):
                            h, w, c = self.image.shape
                            cx, cy = int(lm.x * w), int(lm.y * h)
                            if id == 5 :
                                cv2.circle(self.image, (cx, cy), 25, (255, 0, 255), cv2.FILLED)

                                if cx_old is None :
                                    cx_old = cx
                                    continue
                                if cx - cx_old < -gap :
                                    L = True
                                if cx - cx_old > gap :
                                    R = True
            if R == True and L == True :
                return 'outcome2'
            else :
                cv2.putText(self.image, 'Gesticulate for tracking', (50,50), cv2.FONT_HERSHEY_SIMPLEX, 1, (255, 0, 0), 1, cv2.LINE_AA)
                cv2.imshow("image", self.image)
                if cv2.waitKey(100) == ord('q'):
                    return 'outcome1'

class Hand_Wave(smach.State):
    def __init__(self):
        smach.State.__init__(self, outcomes=['outcome1','outcome2'])

    def execute(self, userdata):
        rospy.loginfo('Executing state Hand_Wave')
        opencv_ros = OpenCVROS()
        return opencv_ros.main()

class OpenCVROS_2(object):
    def __init__(self)->None:
        self.img_sub = rospy.Subscriber("/usb_cam/image_raw", Image, callback = self.image_callback) #camera
        #self.img_sub = rospy.Subscriber("/camera/rgb/image_raw", Image, callback = self.image_callback) #rgb kinect
        self.bridge = CvBridge()
        self.image = None
    
    def image_callback(self, data):
        self.image = self.bridge.imgmsg_to_cv2(data, desired_encoding="bgr8")

    def stop(self ,stop_event):
        r = sr.Recognizer()

        while(1):

            try:
                with sr.Microphone() as source2:
                    print(">>>>>>>>>>>>>> Initializing .....")
                    r.adjust_for_ambient_noise(source2, duration=0.2)
        
                    print(">>>>>>>>>>>>>> Listing .....")

                    # listens for the user's input
                    audio2 = r.listen(source2)

                    # Using google to recognize audio
                    MyText = r.recognize_google(audio2)
                    MyText = MyText.lower()

                    print(MyText)
                    
                    if MyText == 'stop' :
                        stop_event.set()
                        self.text = 'success'
                        return 0

            except sr.RequestError as e:
                print("Could not request results; {0}".format(e))

            except sr.UnknownValueError:
                print("unknown error occurred")
    
    def main(self):
        stop_event = threading.Event()
        t2 = threading.Thread(target=OpenCVROS_2.stop, args=(self,stop_event,))
        t2.start()
        
        pub = rospy.Publisher('~cmd_vel', Twist, queue_size=5)
        
        speed = .2
        turn = 1

        x = 0
        th = 0
        status = 0
        count = 0
        acc = 0.1
        target_speed = 0
        target_turn = 0
        control_speed = 0
        control_turn = 0
        
        while not rospy.is_shutdown():
            if self.image is None:
                continue
            self.text = 'fail'
            face_detection_results = face_detection.process(self.image[:,:,::-1])
            if face_detection_results.detections:
                for detection in face_detection_results.detections:
                    bbox = detection.location_data.relative_bounding_box
                    x, y, w, h = int(bbox.xmin * self.image.shape[1]), int(bbox.ymin * self.image.shape[0]), int(bbox.width * self.image.shape[1]), int(bbox.height * self.image.shape[0])
                    cx, cy = x + w // 2, y + h // 2
                    cv2.circle(self.image, (cx, cy), 5, (255, 0, 255), cv2.FILLED)
            
            
            ### set key ###
            
            center_x = self.image.shape[1]//2
            center_gab = self.image.shape[1]//10
            
            near = 20
            far = 15
            
            cv2.putText(self.image, str((w*100)//self.image.shape[1]) , (50,150), cv2.FONT_HERSHEY_SIMPLEX, 1, (255, 0, 0), 1, cv2.LINE_AA)
            
            if (w*100)//self.image.shape[1] > near  : #back
                cv2.putText(self.image, 'The target is very close', (50,100), cv2.FONT_HERSHEY_SIMPLEX, 1, (255, 0, 0), 1, cv2.LINE_AA)
                x = -1
                th = 0
                count = 0
            
            elif abs(center_x - cx) <= center_gab and (w*100)//self.image.shape[1] < near and (w*100)//self.image.shape[1] > far : #stationary
                cv2.putText(self.image, 'Stationary', (50,100), cv2.FONT_HERSHEY_SIMPLEX, 1, (255, 0, 0), 1, cv2.LINE_AA)
                x = 0
                th = 0
                control_speed = 0
                control_turn = 0
                count = 0
            
            elif abs(center_x - cx) <= center_gab  and (w*100)//self.image.shape[1] < far : #gogogo
                cv2.putText(self.image, 'The target in front', (50,100), cv2.FONT_HERSHEY_SIMPLEX, 1, (255, 0, 0), 1, cv2.LINE_AA)
                x = 1
                th = 0
                count = 0
            
            elif cx - center_x > center_gab : #rotate right
                cv2.putText(self.image, 'The target is on the left', (50,100), cv2.FONT_HERSHEY_SIMPLEX, 1, (255, 0, 0), 1, cv2.LINE_AA)
                x = 0
                th = -1
                count = 0
            
            elif center_x - cx > center_gab : #rotate left
                cv2.putText(self.image, 'The target is on the right', (50,100), cv2.FONT_HERSHEY_SIMPLEX, 1, (255, 0, 0), 1, cv2.LINE_AA)
                x = 0
                th = 1
                count = 0
            
            cv2.putText(self.image, 'Following, say stop to interrupt', (50,50), cv2.FONT_HERSHEY_SIMPLEX, 1, (255, 0, 0), 1, cv2.LINE_AA)
            cv2.imshow("image", self.image)
                
            ####### Move #######
            
            target_speed = speed * x
            target_turn = turn * th

            if target_speed > control_speed:
                control_speed = min( target_speed, control_speed + 0.02 )
            elif target_speed < control_speed:
                control_speed = max( target_speed, control_speed - 0.02 )
            else:
                control_speed = target_speed

            if target_turn > control_turn:
                control_turn = min( target_turn, control_turn + 0.1 )
            elif target_turn < control_turn:
                control_turn = max( target_turn, control_turn - 0.1 )
            else:
                control_turn = target_turn
            
            twist = Twist()
            twist.linear.x = control_speed; twist.linear.y = 0; twist.linear.z = 0
            twist.angular.x = 0; twist.angular.y = 0; twist.angular.z = control_turn
            pub.publish(twist)
            

            if  cv2.waitKey(100) == ord('q'):
                cv2.destroyAllWindows()
                return self.text
            if stop_event.is_set():
                return self.text
        
		    
class track(smach.State):
    def __init__(self):
        smach.State.__init__(self, outcomes=['success','fail'])

    def execute(self, userdata):
        rospy.loginfo('Executing state track')
        #opencv_ros2 = OpenCVROS_2()
        return OpenCVROS_2().main()#opencv_ros2.main()
                    
def main():
    rospy.init_node('robot_state', anonymous=True)

    # Create a SMACH state machine
    sm = smach.StateMachine(outcomes=['---finish---'])

    # Open the container
    with sm:
        # Add states to the container
        smach.StateMachine.add('Hand_Wave', Hand_Wave(), 
                               transitions={'outcome1':'---finish---', 'outcome2':'track'})
        smach.StateMachine.add('track', track(), 
                               transitions={'success':'Hand_Wave','fail':'---finish---'})

    # Execute SMACH plan
    outcome = sm.execute()



if __name__ == '__main__':
    main()

