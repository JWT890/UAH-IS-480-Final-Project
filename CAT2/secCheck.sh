#!/bin/bash

### Name: Jon William Taylor
### Date: November 9, 2023
### IS 480 KB
###
# This script checks to see if the following is true:
# if GUI screen lock is enabled
###

# STIG UBTU-20-010004 Cat 2

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

# statement that checks to determine if command is false
if [[ "$checkScreenLock" != *true* ]]; then
	# asks the user if the want to enable screen look
	read -p "Would you like to enable screen lock? y/n: " confirm
 	# statement takes either yes or no for answer
	if [[ $confirm == [yY] || $confirm == [yY][eE][sS] ]]; then
 		# command sets condition to true
		sudo gsettings set org.gnome.desktop.screensaver lock-enabled true
  		# prints screen lock enabled
		echo "screen lock enabled" 
  	# prints screen lock not enabled
	else exit 1 && echo "screen lock not enabled"
	fi
fi
