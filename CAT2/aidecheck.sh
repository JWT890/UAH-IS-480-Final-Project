#!/bin/bash

### Name: Jon William Taylor
### Date: November 19, 2023
### IS 480 KB
###
# This script checks to see if the following is true:
# if aide is installed in the system
###

# STIG UBTU-010450 CAT 2

# checks to see if ade is installed in the system
if sudo dpkg -l | grep aide; then

	# prints already installed
	echo "Aide is already installed"
else
	# asks the user if they want to install aide or not
	read -p "Aide is not installed. Do you want to install it? (y/n): " choice
	# takes the input as either y or Y
	if [ "$choice" == "y" ] || [ "$choice" == "Y" ]; then
		# if either aide is installed in the system
		sudo apt install aide
		# prints now installed
		echo "Now installed"
	else
		# prints out not elected to install
		echo "Elected to not install"

		# asks the user if they want to initalize Aide or not
		read -p "Do you want to initialize Aide? (y/n): " init_choice
		# takes the input as either y or Y
		if [ "$init_choice" == "y" ] || [ "$init_choice" == "Y" ]; then
			# if either aide is initalized
			sudo aideinit
			# prints initialization complete
			echo "Aide initialization complete"

			# renames the database
			sudo cp -p /var/lib/aide/aide.db.new /var/lib/aide/aide.db
			# prints database copied
			echo "Aide database copied"
		else
			# prints intilization not checked
			echo "Aide initialization skipped"
		fi
	fi
fi
