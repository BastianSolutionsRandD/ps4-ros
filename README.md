# ps4_ros
Sony PlayStation 4 DualShock®4 node joy_msg to twist_msg.
#### This uses `ds4drv --hidraw` which allows connecting to an already paired remote, thus removing the need to sync every time.

## Installation
**1. Clone this repo**
```bash
git clone https://github.com/BastianSolutionsRandD/ps4-ros.git
catkin build
sws
```
**2. Install `ds4dr`:**
```bash
sudo pip install ds4drv
```
**3. Install `joy` http://wiki.ros.org/joy**
```bash
sudo apt install ros-$ROS_DISTRO-joy
```
**4. Edit the `WORKSPACE` variable in `ps4-ros/scripts/set_udev_rules.sh` to provide the name of the workspace containing `ps4-ros`.**
```bash
# Default is 'catkin_ws. Replace with the name of your workspace
WORKSPACE='catkin_ws'
```
**5. Run `set_udev_rules.sh` , which copies `ps4-ros/udev/50-ds4drv.rules` to `/etc/udev/rules.d/`  giving R/W permissions to `ds4drv` for all users.**
```bash
roscd ps4-ros/scripts
chmod +x set_udev_rules.sh
sudo ./set_udev_rules.sh
```
**6. Pair PS4 controller over Bluetooth**


## roslaunch
```
roslaunch ps4_ros ps4.launch
```
## One by one
1. `ds4drv --hidraw` if it is not running already.
2. `rosparam set joy_node/dev "/dev/input/jsX"`
3. `rosrun joy joy_node`
4. `rosrun ps4_ros ps4_ros`

 You can adjust the scaling parameters inside the launch file or via rosparam while running. The default scaling is 1.0
```xml
<!-- In Launch File -->
<param name="scale_angular" value="1.0"/>
<param name="scale_linear" value="1.0"/>
```
```bash
# While node is running
rosparam set /ps4/scale_linear 1.0
rosparam set /ps4/scale_angular 1.0
```
# Troubleshooting
* If nothing is being published to `/cmd_vel` check the `js*` port of the controller using `ls /dev/input/ | grep js`, and try changing to another `js*` in the launch file.

* Display raw _ds4drv_ data
 ```
 sudo jstest /dev/input/jsX
 ```

* For `ds4drv` problems, check https://github.com/chrippa/ds4drv/blob/master/README.rst
