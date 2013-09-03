#!/sbin/sh    
echo 0 > /sys/class/android_usb/android0/enable 
echo rndis,adb > /sys/class/android_usb/android0/functions
echo 1 > /sys/class/android_usb/android0/enable 
