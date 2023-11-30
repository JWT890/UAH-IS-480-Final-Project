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
