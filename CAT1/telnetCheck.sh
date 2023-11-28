#!/bin/bash

### Name: Jon William Taylor
### Date: November 19, 2023
### IS 480 KB
###
# this scripts checks the following:
# if telnet is installed on the system
###

# STIG UBTU-20-010405 CAT 1

# checks to see if telnet is installed
if dpkg -l | grep telnet; then
	# prints Telnet is installed
	echo "Telnet is installed"
 	# asks the user if they want to uninstall telnet
	read -p "Do you want to uninstall telnet? (y/n): " uninstall_prompt

	# if user says yes it will remove telnet
	if [[ $uninstall_prompt == "y" ]]; then
 		# command for removing telnet
		sudo apt-get remove telnet
  		# prints telnet has been uninstalled
		echo "Telnet has been uninstalled"
	else
 		# prints Telnet will not be uninstalled
		echo "Telnet will be not uninstalled"
	fi
else
	# prints Telnet is not installed
	echo "Telnet is not installed"
fi

