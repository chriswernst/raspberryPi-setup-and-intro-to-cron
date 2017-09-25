# Terminal Commands in Raspian Jessie Linux

sudo raspi-config
# Brings up the menu

sudo reboot
# Reboots the Pi

startx
# Starts the GUI from CLI

sudo apt-get update
# Updates system package list

sudo apt-get dist-upgrade
# Upgrade to latest version

sudo nano /etc/wpa_supplicant/wpa_supplicant.conf
# Opens the text editor for network configuration

network={
    ssid="Your WiFi name"
    psk="Your WiFi password"
}
# Enter your wifi network and password at the bottom of the script

hostname -I 
# Gives the IP address of the Pi

# HINT: Enable SSH sharing from OSX under System Preferences > Sharing > Check box Remote Login

scp UserName@192.XXX.X.XX:/Users/Name/of/Path/SurfText.py ~
# From the RaspberryPi to pull files from my Mac
scp pi@192.XXX.X.XX:/home/pi/SurfText2.py ~
# From my Mac to pull files from the Raspberry Pi

# From a Mac/Linux machine, to control the remote machine:
ssh pi@192.XXX.X.XX

scp /home/pi/SurfText2.py pi@raspberrypi:~
# From the mac into the Pi

# from windows quick access toolbar, type:
\\RETROPIE
# For access to ROM folders, etc


