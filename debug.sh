#!/bin/bash
adb reboot bootloader && fastboot boot /data/win/boot.img 
#&& sleep 20 && adb shell twrp decrypt 1234
sleep 20
adb push gdbserver /sbin
adb shell chmod 755 /sbin/gdbserver
sleep 10
adb forward tcp:20000 tcp:20000
adb shell '/sbin/gdbserver --attach :20000 `pgrep recovery | head -2 | tail -1`'
