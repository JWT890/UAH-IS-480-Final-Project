# UAH-IS-480-Final-Project

Bash final cybersecurity project for IS 480

CAT1 scripts

#############################################

rebtarget.sh / STIG UBTU-20-010460

This script checks for if reboot.target is masked or not. If reboot.target is not masked, it asks if the user wants to mask it by running the sudo systemctl mask reboot.target
which masks it.

Usage: run the sudo systemctl status reboot.target first for status. If not masked, run the script and type y, Y, or yes to after being asked to mask it or not.

######################################

telnetCheck.sh / STIG UBTU-20-010405

This script checks to see if telnet is installed on the system. If it is, the user is asked if the want to uninstall it not by typing y or n.

Usage: run the dpkg -l | grep telnet command to see if its installed. It it is run the telnetCheck.sh script to uninstall it by typing y when prompted. Run the dpkg -l command again to check if its still there or not

######################################

x11forward.sh / STIG UBTU-20-010048 

This script checks to see if x11forwarding is set to either yes or no. If x11forwarding is set to yes, run this script to comment out the yes one and add one saying x11forwarding no.

Usage: run the grep -q 'X11Forwarding yes' /etc/ssh/sshd_config* first to check if its set to set to either yes or no. If set to yes, run the script to change it to x11forwarding no. Proceed to run the prior grep command
to see if the script has worked or not or go check /etc/ssh/sshd_config. 

##############################################

CAT2 scripts

#######################################

aidecheck.sh / STIG UBTU-20-010450

This script checks to see if aide is installed on the system. If it isn't, the user is asked if they want to install or not. They user is also asked if they want to initalize aide or not

Usage: run the dpkg -l | grep aide command to see if its installed. It if it isn't run the aidecheck.sh script to install it by typing y or Y when prompted. Run the dpkg -l command afterwards to check for installation.

#######################################

apt.sh / STIG UBTU-20-010449

This script checks to see if both Unattended-Upgrades conditions are both set to true. If they are not, run the script to change both to true

Usage: Check the /etc/apt/apt.conf.d/50unattended-upgrades path by running the command: grep -i remove-unused /etc/apt/apt.conf.d/50unattended-upgrades to check if both are set to true. If one or both are either missing
or not set to true, run the apt.sh script to change the conditions to both be true

#######################################

inactiveAccount.sh / STIG UBTU-20-010409 

This script checks to see if INACTIVE in /etc/default/useradd path is set 35. If it is not, run the script to change it to 35.

Usage: run the sudo grep INACTIVE /etc/default/useradd command to check to see if INACTIVE value is set to 35 or not. If it isn't set at 35, run the inactiveAccount.sh script to change the value to be 35. Check afterwards by running the
sudo grep INACTIVE /etc/default/useradd command

#######################################

secCheck.sh / STIG UBTU-20-010004 

This script checks to see if the GUI screen lock is enabled. If it is not, run the script to enable it. The user is asked if they want to enabled or not

Usage: run the sudo gsettings get org.gnome.desktop.screensaver lock-enabled command to check if screen lock is enabled or not. If it isn't, run the secCheck.sh script to enable screen lock.

#######################################

usbstorage.sh / STIG UBTU-20-010461 

This script checks to see if the USB storage kernel is disabled or not. If is enabled, run the script to disable it.

Usage: run the grep usb-storage /etc/modprobe.d/* | grep "/bin/true" command to first check if it's present or not. If it isn't, run the script to add install usb-storage /bin/true to the DISASTIG.conf file in 
/etc/modprobe.d path

############################################################

UBUNTUSTIGS.sh / Combined Ubuntu Stig script

This script is the combined script of the CAT 1 and CAT 2 scripts

Usage: run this script if you would rather have them all run instead of going one by one
