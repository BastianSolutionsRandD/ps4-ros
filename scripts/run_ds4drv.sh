#!/bin/sh

# sudo chmod 666 /dev/uinput
# sudo rm /dev/input/js0;
# sudo rm /dev/input/js1;
# source smws;

# This uses ds4drv --hidraw which allows connecting to an already paired remote, thus removing the need to sync every time.
ds4drv --hidraw
