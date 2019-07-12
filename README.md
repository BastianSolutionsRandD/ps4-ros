# ps4_ros
Sony PlayStation 4 DualShock®4 node joy_msg to twist_msg

# Installation
1. Install __ds4dr__: `sudo pip install ds4drv`
2. Install __ros-joy__: http://wiki.ros.org/joy
3. Edit `set_udev_rules.sh` to provide the path to the location of `ps4-ros/udev/50-ds4drv.rules` in order to give R/W permissions to `ds4drv`
4. Pair PS4 controller

## roslaunch
```
roslaunch ps4_ros ps4
```

# Starting
## One by one
1. `$ds4drv --hidraw` if it is not running already.
2. `rosparam set joy_node/dev "/dev/input/jsX"`
3. `rosrun joy joy_node`
4. `rosrun ps4_ros ps4_ros`



* One can adjust the following parameter inside the launch file or use rosparam by using the _one by one_ start procedure

  * ``<param name="scale_angular" value="1.5"/>``

  * ``<param name="scale_linear" value="0.5"/>``

# Troubleshooting
* For `ds4drv` problems, check https://github.com/chrippa/ds4drv/blob/master/README.rst
* Display raw _ds4drv_ data
  * `sudo jstest /dev/input/jsX`

# To Do (v.2.0)
* [ ] Pan-and-Tilt on second joystick
