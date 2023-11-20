#!/bin/bash

### Name: Jon William Taylor
### Date: November 19, 2023
### IS 480 KB
###
# checks to see if INACTIVE is set to 35
###
# STIG UBTU-20-010409 CAT 2

# Checks to see if INACTIVE is set to 35 in the filepath
if sudo grep -q "^INACTIVE=35" /etc/default/useradd; then
	# prints is set to 35 in the filepath if successful
	echo "INACTIVE is set to 35 in /etc/default/useradd"
else
	# prints is not set to 35 in the filepath
	echo "INACTIVE is not set to 35 in /etc/default/useradd"
	# asks the user for input if they want to change it to 35
	read -p "Do you want to change it to 35? (y/n): " choice
	# if the choice is yes or y
	if [ "$choice" == "y" ]; then
		# changes the INACTIVE to 35 if yes
		sudo useradd -D -f 35
		# prints now set to 35
		echo "INACTIVE set to 35 in /etc/default/useradd"
	else
		# prints if user says no
		echo "INACTIVE remains unchanged"
	fi
fi 

