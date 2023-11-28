#!/bin/bash

### Name: Jon William Taylor
### Date: November 27, 2023
### IS 480 KB
###
# This script checks to see the following: 
# if loading the USB storage kernel module is disabled
###

# STIG UBTU-20-010461 CAT 2

# checks if /bin/true is present
usbcheck=$(grep usb-storage /etc/modprobe.d/* | grep "/bin/true")

# statement checks if the status is true
if [[ "$usbcheck" == *true* ]]; then
	# already installed
	echo "It is already here"
else
	# its is not installed
	echo "It is not"
fi

# statement check if the status is false
if [[ "$usbcheck" != *true* ]]; then
	# adds the usb-storage and /bin/true lines to the file
	sudo su -c "echo install usb-storage /bin/true >> /etc/modprobe.d/DISASTIG.conf"
	# prints added
	echo "Added"
fi
