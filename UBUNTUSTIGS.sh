#!/bin/bash

### Name: Jon William Taylor
### Date: December 1, 2023
### IS 480 KB
###
# This is the CAT1 and CAT2 scripts I have done
###

#UBTU-20-010460 CAT 1

checkRebootTarget=$(sudo systemctl status reboot.target)

# statement checks to determine if the command is >
if [[ "$checkRebootTarget" == *true* ]]; then
        # tells if it is masked
        echo "It is masked"
else
        # tells it is not masked
        echo "It is not masked"
fi

# statement checks to determine if the command is true
if [[ "checkRebootTarget" != *true* ]]; then
        # takes input from user in form of yes or no
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

# STIG UBTU-20-010048 CAT 1

# checks to see if X11Forwarding is enabled
x11_forwarding_status=$(grep -q 'X11Forwarding yes' /etc/ssh/sshd_config*)

# statement that checks to if it is enabled, chang>
if [[ $x11_forwarding_status == "1" ]]; then
        # command adds or replaces yes with no in >
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

# STIG UBTU-20-010450 CAT 2

# checks to see if aide is installed in the system
if sudo dpkg -l | grep aide; then
	# prints already installed
	echo "Aide is already installed"
else
	# asks the user if they want to install aide or not
	read -p "Aide is not installed. Do you want to install it (y/n): " choice
	if [ "$choice" == "y" ] || [ "$choice" == "Y" ]; then
		# if either aide is installed in the system
		sudo apt install aide
		# prints now installed
		echo "Now installed"
	else
		# prints out not elected to install
		echo "Elected to not install"

		# asks the user if they want to initialize Aide or not
		read =p "Do you want to initialize Aide? (y/n): " init_choice
		if [ "$init_choice" == "y" ] || [ "$init_choice" == "Y" ]; then
			# if either is initialized
			sudo aideinit
			# prints initialization complete
			echo "Aide initialized complete"

			# renames the database
			sudo cp -p /var/lib/aide/aide.db.new /var/lib/aide/aide.db
			# prints database copied
			echo "Aide database copied"
		else
			# prints initlization not checked
			echo "Aide initialization skipped"
		fi
	fi
fi

# STIG UBTU-20-010449 CAT2

# path to the target file
path="/etc/apt/apt.conf.d/50unattended-upgrades"

# statment that looks for if the file exists
if [ -e "$path" ]; then
	# if it does exist, it will add/change the condition from false to true if applicable on the path
	sudo sed -i '/Unattended-Upgrade::Remove-Unused-Dependencies/c\Unattended-Upgrade::Remove-Unused-Dependencies "true";' "$path"
	sudo sed -i '/Unattended-Upgrade::Remove-Unused-Kernel-Packages/c\Unattended-Upgrade::Remove-Unused-Kernel-Packages "true";' "$path"

	# prints the option for true has been updated in the path variable
	echo "Options added or updated in $path:"
	# uses the grep command to check to see if the relevant option/condition is set to true or false
	grep -E "Unattended-Upgrade::Remove-Unused-Dependencies|Unattended-Upgrade::Remove-Unused-Kernel-Packages" "$path"
else
	# prints if it fails
	echo "Error: File $path does not exist"
fi

# STIG UBTU-20-010409 CAT 2

# Checks to see if INACTIVE is set to 35 in the filepath
if sudo grep -q "^INACTIVE=35" /etc/default/useradd; then
	# prints is set to 35 in the filepath if successful
	echo "INACTIVE is set to 35 in /etc/default/useradd"
else
	# prints is not set to 35 in /etc/default/useradd
	echo "INACTIVE is not set to 35 in /etc/default/useradd"
	# asks the user for input to they want to change to 35
	read -p "Do you want to change it 35? (y/n): " choice2
	# if the choice is yes or y
	if [ "$choice2" == "y" ]; then
		# changes the INACTIVE to 35 if yes
		sudo useradd -D -f 35
		# prints now set to 35
		echo "INACTIVE set to 35 in /etc/default/useradd"
	else
		# prints if user says no
		echo "INACTIVE remains unchanged"
	fi
fi


# STIG UBTU-20-010004 CAT 2

# runs the check command and stores the result in variable
checkScreenLock=$(sudo gsettings get org.gnome.desktop.screensaver lock-enabled)

# statement that checks to determine is ran command is true
if [[ "$checkScreenLock" == *true* ]]; then
	# tells if compliant
	echo "System has screen lock enabled and is compliant"
else
	# tells if not compliant
	echo "System does not have screen lock enabled and is not compliant"

# statement that checks to determine if command is false
if [[ "$checkScreenLock" != *true* ]]; then
	# asks the user if they want to enable screen lock
	read -p "Would you like to enable screen lock? (y/n): " confirm1
	# statement takes either yes or no for answer
	if [[ $confirm1 == [yY] || $confirm1 == [yY][eE][sS] ]]; then
		# command sets condition to true
		sudo gsettings set org.gnome.desktop.screensaver lock-enabled true
		# prints screen lock enabled
		echo "Screen lock enabled"
	# prints screen lock not enabled
	else exit 1 && echo "screen lock not enabled"
	fi
fi

# STIG UBTU-20-010461 CAT 2

# checks if /bin/true is present
usbcheck=$(grep usb-storage /etc/modprobe.d/* | grep "/bin/true")

# statement checks if the status is true
if [[ "$usbcheck" == *true* ]]; then
	# already installed
	echo "It is already here"
else
	# its not already installed
	echo "It is not"
fi

# statement checks to see if the status is false
if [[ "$usbcheck" != *true* ]]; then
	# adds the usb-storage and /bin/true lines to the file
	sudo su -c "echo install usb-storage /bin/true >> /etc/modprobe.d/DISASTIG.conf"
	# prints added
	echo "Added"
fi
