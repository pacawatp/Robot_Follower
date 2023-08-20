# Robot_Follower
Run in terminal :\
roscore\
roslaunch hand_pose usb_cam.launch # open camera\
roslaunch turtlebot_bringup minimal.launch # activate Kobuki\
python .../Project/Robot_Follower/Project_package/src/hand_pose/script/main.py

rostopic echo usbcam/camera_info # watch image input\
rostopic echo robot_state_155116_1692537575606/cmd_vel # watch output of the command that the robot will follow
