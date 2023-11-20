#!/bin/bash

### Name: Jon William Taylor
### Date: November 18, 2023
### IS 480 KB
###
# This script checks to see the following:
# if reboot.target is masked or not
###

# STIG UBTU-20-010460 CAT 1

# runs the check command and stores the result in a variable
checkRebootTarget=$(sudo systemctl status reboot.target)

# statement checks to determine if the command is true
if [[ "$checkRebootTarget" == *true* ]]; then
	# tells if it is masked
	echo "It is masked"
else
	# tells it is not masked
	echo "It is not masked"
fi

# statement checks to determine if the command is false
if [[ "checkRebootTarget" != *true* ]]; then
	# takes input from user in form of yes or no and confirms it
	read -p "Would you like to mask it? y/n: " confirm
	# statement to confirm if yes
	if [[ $confirm == [yY] || $confirm == [yY][eE][sS] ]]; then
		# runs the command to mask reboot.target
		sudo systemctl mask reboot.target
		# prints now masked
		echo "Now masked"
	# if no prints out not masked
	else exit 1 && echo "Not masked"
	fi
fi
