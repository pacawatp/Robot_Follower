# generated from catkin/cmake/template/pkg.context.pc.in
CATKIN_PACKAGE_PREFIX = ""
PROJECT_PKG_CONFIG_INCLUDE_DIRS = "${prefix}/include;/usr/include".split(';') if "${prefix}/include;/usr/include" != "" else []
PROJECT_CATKIN_DEPENDS = "roscpp;ar_track_alvar_msgs;std_msgs;geometry_msgs;yocs_math_toolkit;yocs_ar_marker_tracking;yocs_msgs".replace(';', ' ')
PKG_CONFIG_LIBRARIES_WITH_PREFIX = "-lyocs_ar_pair_tracking;/usr/lib/x86_64-linux-gnu/libboost_system.so.1.71.0".split(';') if "-lyocs_ar_pair_tracking;/usr/lib/x86_64-linux-gnu/libboost_system.so.1.71.0" != "" else []
PROJECT_NAME = "yocs_ar_pair_tracking"
PROJECT_SPACE_DIR = "/home/bp/tutorial_ws/install"
PROJECT_VERSION = "0.12.1"
