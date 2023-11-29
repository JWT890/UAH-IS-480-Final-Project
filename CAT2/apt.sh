#!/bin/bash

### Name: Jon William Taylor
### Date: November 27, 2023
### IS 480 KB
###
# this script checks the following:
# if two ::Remove-Unused parameters are set to true
###
# STIG UBTU-20-010449 CAT2

# path to the target file
path="/etc/apt/apt.conf.d/50unattended-upgrades"

# statement that looks for if the file exists
if [ -e "$path" ]; then
	# if it does exit, it will add/change the condition from false to true if applicable on the path
	sudo sed -i '/Unattended-Upgrade::Remove-Unused-Dependencies/c\Unattended-Upgrade::Remove-Unused-Dependencies "true";' "$path"
	sudo sed -i '/Unattended-Upgrade::Remove-Unused-Kernel-Packages/c\Unattended-Upgrade::Remove-Unused-Kernel-Packages "true";' "$path"

	# prints the option for true has been updated in the path variable
	echo "Options added or updated in $path:"
	# uses the grep command to check to see if the relevant option/condition is set to true or false
	grep -E "Unattended-Upgrade::Remove-Unused-Dependencies|Unattended-Upgrade::Remove-Unused-Kernel-Packages" "$path"
else
	# prints if it fails
	echo "Error: File $path does not exit"
fi
