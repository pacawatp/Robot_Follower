#!/usr/bin/env python3
import roslaunch
import rospy
#import time
from std_srvs.srv import Empty, EmptyResponse

def server_callback(req):
    print("Doing something..")
    uuid = roslaunch.rlutil.get_or_generate_uuid(None, False)
    roslaunch.configure_logging(uuid)
    launch_file = '/home/bp/Project_package/src/hand_pose/launch/usb_cam.launch'

    # Create a launch object and launch the file
    launch = roslaunch.parent.ROSLaunchParent(uuid, [launch_file])
    launch.start()
    #rospy.spin()
    #return EmptyResponse()
    
def trigger_server():
    rospy.init_node('follower_server')
    s = rospy.Service('trigger', Empty, server_callback)
    print("Ready to do something.")
    rospy.spin()


trigger_server()
