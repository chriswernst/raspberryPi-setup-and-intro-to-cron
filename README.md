# Raspberry Pi

#### Overview

We will step through a brief overview of how to setup the **$10** Raspberry Pi Zero W, update it, transfer files, and automate the running of scripts. 

The newly release Pi Zero W boasts ***Bluetooth LE, WiFi, and a 1Ghz processor!***

###
![alt text](https://www.raspberrypi.org/magpi/wp-content/uploads/2017/02/PI-Zero-W-web.jpg "Raspberry Pi Zero W")
###

Check them out at: https://www.raspberrypi.org/products/raspberry-pi-zero-w/


**You'll also need to get:**
- Power Supply (5V, >2A) Micro USB
- 8GB or larger Micro SD
- USB to Micro USB OTG adapter - *(I suggest the USB hub, below, instead of this)* 
- Micro USB Hub (Not all are compatible, one that is: https://www.amazon.com/LoveRPi-MicroUSB-Port-Raspberry-Zero/dp/B019BUA81U)
- HDMI adapter
- Wired/Wireless Keyboard & Mouse

*(Note this method works with the Raspberry Pi 3B also)*

Now you have your parts, we'll install Raspbian Jessie Linux OS onto the SD card. If your card came pre-installed with NOOBS, you may still want to do this as NOOBS updates are pushed regularly, and are critical to operation. 

You'll want to download NOOBS (not NOOBS lite) from: https://www.raspberrypi.org/downloads/noobs/

###
![alt text](https://www.raspberrypi.org/app/uploads/2012/02/RP_SD-150x150.png "NOOBS OS")
###

Plug your microSD card into your computer. Make sure your card is wiped clean using software like that from https://www.sdcard.org

NOOBS expects the FAT format. With 32gb or less SD cards, they will likely come out of the box in FAT(MS DOS) format. If your memory card is >32gb (SDXC), it will likely come in exFat format. This will need to be reformatted into FAT. A brief link can be found [Here](https://www.raspberrypi.org/documentation/installation/sdxc_formatting.md)
Or if you're on OSX, open **Disk Utility**, navigate to the new SD card, click *erase*, name the new card, and set the format to FAT.

Once downloaded, extract/unzip those files, and drop the file, not just the folder, into your newly formatted SD card(FAT formatting is necessary). An easy walkthrough of the NOOBS Linux installation is here: https://www.raspberrypi.org/documentation/installation/noobs.md

Now, plug in your Micro SD card, USB hub, HDMI, power supply(in the 'PWR' port), keyboard and mouse, and turn on the power. Raspbian OS should start up. A green light on the device is a good sign.

If you're having issues, **most of them can be traced to the power supply**. Make sure you are providing adequate current ~2-2.5A (5V)
#
###### Environment Setup
#
Once the system is up, go to the upper right-hand corner and plug in your WiFi details.

Now, do some updates. Open a terminal *(ctrl-alt-t on Linux)* and type:

`sudo apt-get update`

then

`sudo apt-get upgrade`

If you'll be working with Python, verify you have package manager for Python3 with:

`sudo apt-get install python3-pip`

and install any required modules with:

`pip3 install requests bs4 time datetime twilio`

Your machine is now set up! For some, you can stop here, but we'll go into file transfer below.

#
###### File Transfer
#
Because internet browsing on the Pi Zero W is not suggested, we'll need a way to get files from our primary machine over to the Pi.

We're going to use a secure shell(SSH) connection for this.

To go from my Raspberry Pi terminal out to my Mac, I used the command:

`scp MacUserName@192.XXX.X.XX:/Users/Path/To/File/On/Mac/fileName.py ~`

*(change UserName and IP address above to your personal details of the machine you are pulling files from)*

Make sure you save the file in the directory: `/home/pi/`  That `~` and the end of the line dictates the destination on the local machine.

Make sure any executable files are able to be ran with:

`chmod +x fileName.py`

 I'm not going to get into this heavily, but search `ssh`  and your OS + Raspberry Pi file transfer on Google if you get stuck.
#
###### Shell Script
#
In order to run the scripts periodically, we need to create the shell script we'll be executing.
Open a text editor on the Raspberry Pi, and type:
```
#!/bin/bash
cd
python3 myFileName.py
```
Save the file as `anyNameYouLike.sh` and put it in your home directory `/home/pi/`

Also, we need to make sure `anyNameYouLike.sh` is executable by typing into terminal:
```
chmod +x anyNameYouLike.sh
```

#
###### Cron
#
We're going to use Cron to automate the running of the shell script we just created above, that runs the script.  Learn more about Cron here: https://en.wikipedia.org/wiki/Cron

Open a new terminal and type:

`crontab -e`

If it asks you to select a text editor, choose `nano`

A text file should open up explaining how Cron and its syntax works. I'll leave the exploring up to you. Scroll to the bottom of this file and type:

`0 */3 * * * /home/pi/anyNameYouLike.sh`

This sets the `anyNameYouLike.sh` script to run **at zero minutes, every 3 hours, every day, of every month.** 

As an example, to make it run every 6 hours, at the 15th minute, change it to: 

`15 */6 * * * /home/pi/anyNameYouLike.sh`

There are 5 positional arguments for time data. The syntax is:

```
 ┌───────────── minute (0 - 59)
 │ ┌───────────── hour (0 - 23)
 │ │ ┌───────────── day of month (1 - 31)
 │ │ │ ┌───────────── month (1 - 12)
 │ │ │ │ ┌───────────── day of week (0 - 6) (Sunday to Saturday;
 │ │ │ │ │                                       7 is also Sunday on some systems)
 │ │ │ │ │
 │ │ │ │ │
 * * * * *  command to execute
```
*ctrl-x* will exit, make sure to save your changes, and press enter to finalize.

### 
### 

##### And that's it! Get creative with how to use the Raspberry Pi Zero W to automate your programming tasks!

