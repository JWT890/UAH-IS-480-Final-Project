#!/bin/bash

### Name: Jon William Taylor
### Date: November 19, 2023
### IS 480 KB
###
# This script checks to see if the following is true:
# if x11forwarding is set to yes or no
###
# STIG UBTU-20-010048 CAT 1

# checks to see if X11Forwarding is enabled
x11_forwarding_status=$(grep -q 'X11Forwarding yes' /etc/ssh/sshd_config*)

# statement that checks to if it is enabled, change it to no
if [[ $x11_forwarding_status == "1" ]]; then
	# command adds or replaces yes with no in the files
	sudo sed -i 's/X11Forwarding yes/X11Forwarding no/g' /etc/ssh/sshd_config*
	# prints has been disabled
	echo "X11 forwarding has been disabled"
else
	# prints already is disabled
	echo "X11 forwarding is already disabled"
fi

# restarts sshd
service sshd restart

# prints check with the command previously used
echo "Check to see using the relevant command to check"
