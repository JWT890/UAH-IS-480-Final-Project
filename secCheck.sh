#!/bin/bash

### Name: Jon William Taylor
### Date: November 9, 2023
### IS 480 KB
###
# This script checks to see if the following is true:
# if GUI screen lock is enabled
###

# STIG UBTU-20-010004

# runs the check command and stores the result in variable
checkScreenLock=$(sudo gsettings get org.gnome.desktop.screensaver lock-enabled)

# statement that checks to determine is ran command is true
if [[ "$checkScreenLock" == *true* ]]; then
	# tells if compliant
	echo "System has screen lock enabled and is compliant"
else
	# tells if not compliant
	echo "System does not have screen lock enabled and is not compliant"
fi

if [[ "$checkScreenLock" != *true* ]]; then
	read -p "Would you like to enable screen lock? y/n: " confirm 
	if [[ $confirm == [yY] || $confirm == [yY][eE][sS] ]]; then
		sudo gsettings set org.gnome.desktop.screensaver lock-enabled true
		echo "screen lock enabled" 
	else exit 1 && echo "screen lock not enabled"
	fi
fi
