execute_process(COMMAND "/home/bp/tutorial_ws/build/yujin_ocs/yocs_ar_pair_approach/catkin_generated/python_distutils_install.sh" RESULT_VARIABLE res)

if(NOT res EQUAL 0)
  message(FATAL_ERROR "execute_process(/home/bp/tutorial_ws/build/yujin_ocs/yocs_ar_pair_approach/catkin_generated/python_distutils_install.sh) returned error code ")
endif()
