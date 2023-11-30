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
