# UAH-IS-480-Final-Project

Bash final cybersecurity project for IS 480

CAT1 scripts

#############################################

rebtarget.sh / STIG UBTU-20-010460

This script checks for if reboot.target is masked or not. If reboot.target is not masked, it asks if the user wants to mask it by running the sudo systemctl mask reboot.target
which masks it.

Usage: run the sudo systemctl status reboot.target first for status. If not masked, run the script and type y, Y, or yes to after being asked to mask it or not.

######################################
