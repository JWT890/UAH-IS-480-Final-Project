#!/bin/bash

### Name: Jon William Taylor
### Date: November 19, 2023
### IS 480 KB
###
# this scripts checks the following:
# if telnet is installed on the system
###

# STIG UBTU-20-010405 CAT 1

if dpkg -l | grep telnet; then
	echo "Telnet is installed"
	read -p "Do you want to uninstall telnet? (y/n): " uninstall_prompt

	if [[ $uninstall_prompt == "y" ]]; then
		sudo apt-get remove telnet
		echo "Telnet has been uninstalled"
	else
		echo "Telnet will be uninstalled"
	fi
else
	echo "Telnet is not installed"
fi

