#!/bin/bash
## pm.sh a script by handy. ;)
## This file is an attempt to make it a bit quicker to manually mount
## external storage devices (usually USB these days).
## You use the "pumount /media/<device.name> command to unmount them -
## I have a button setup in Worker to do just that. This script could
## be modified to quickly run pumount the same as it runs pmount &
## you just have to add the two characters & hit Return to unmount device.
## I don't need to as Worker makes the pumount happen with a button. :)
## There is separate script called pum.sh that uses pumount to undo
## what this script does = unmounts the pmounted /media/sd??

#-----------------------------------------------------------
# A little python FUNCTION - picked up from Joshua follows:
#----------------------------------------------------------

function input {
   python2 -c 'import sys,readline;readline.set_startup_hook(lambda: readline.insert_text(sys.argv[2]));sys.stderr.write(raw_input(sys.argv[1]))' "$@" 3>&1 1>&2 2>&3
}

clear # Clear the screen.

echo -e "\e[0;33m"

## The next line lists all of the available filesystems on the system:

lsblk -f

## Where the action is:

echo
echo
echo -e "Use the \e[0;31mCtrl c\e[0;33m key combination to exit this script."
echo
echo -e "\e[0;33mTo mount an external device (usually USB), input the missing"
echo -e "parts directly after the \e[0;32md\e[0;32m\e[0;33m in the following command."
echo -e "(Like I have with the red \e[0;31me1\e[0;33m in this example -> \e[0;32mpmount /dev/sd\e[0;31me1 \e[0;33m)\e[0;32m"
echo
deviceName=$( input 'pmount /dev/sd')
echo
printf "pmount /dev/sd$deviceName\n"
echo -e "\e[0;31m"
pmount /dev/sd$deviceName
echo -e "\e[0m"

exit 0
