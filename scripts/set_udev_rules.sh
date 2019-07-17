#!/bin/bash

# Replace WORKSPACE with the name of the workspace that ps4-ros resides
WORKSPACE='mappy_ws'
sudo cp $HOME/$WORKSPACE/src/ps4-ros/udev/50-ds4drv.rules /etc/udev/rules.d/

sudo service udev restart
sudo udevadm control --reload-rules && sudo service udev restart && sudo udevadm trigger
exit
$SHELL
