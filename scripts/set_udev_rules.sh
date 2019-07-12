#!/bin/bash

sudo cp /PATH/TO/SRC/ps4-ros/udev/50-ds4drv.rules /etc/udev/rules.d/
sudo service udev restart
sudo udevadm control --reload-rules && sudo service udev restart && sudo udevadm trigger
exit
$SHELL 
