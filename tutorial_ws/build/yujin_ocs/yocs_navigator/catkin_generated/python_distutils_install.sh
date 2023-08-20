#!/bin/sh

if [ -n "$DESTDIR" ] ; then
    case $DESTDIR in
        /*) # ok
            ;;
        *)
            /bin/echo "DESTDIR argument must be absolute... "
            /bin/echo "otherwise python's distutils will bork things."
            exit 1
    esac
fi

echo_and_run() { echo "+ $@" ; "$@" ; }

echo_and_run cd "/home/bp/tutorial_ws/src/yujin_ocs/yocs_navigator"

# ensure that Python install destination exists
echo_and_run mkdir -p "$DESTDIR/home/bp/tutorial_ws/install/lib/python3/dist-packages"

# Note that PYTHONPATH is pulled from the environment to support installing
# into one location when some dependencies were installed in another
# location, #123.
echo_and_run /usr/bin/env \
    PYTHONPATH="/home/bp/tutorial_ws/install/lib/python3/dist-packages:/home/bp/tutorial_ws/build/lib/python3/dist-packages:$PYTHONPATH" \
    CATKIN_BINARY_DIR="/home/bp/tutorial_ws/build" \
    "/usr/bin/python3" \
    "/home/bp/tutorial_ws/src/yujin_ocs/yocs_navigator/setup.py" \
     \
    build --build-base "/home/bp/tutorial_ws/build/yujin_ocs/yocs_navigator" \
    install \
    --root="${DESTDIR-/}" \
    --install-layout=deb --prefix="/home/bp/tutorial_ws/install" --install-scripts="/home/bp/tutorial_ws/install/bin"
