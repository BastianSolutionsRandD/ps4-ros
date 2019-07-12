#!/bin/sh


# sudo chmod a+rw /dev/input/js*
sudo chmod 666 /dev/uinput
sudo rm /dev/input/js*;
smws;
chmod a+rw /dev/input/js*
ds4drv --hidraw
