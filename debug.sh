#!/bin/bash
#adb.exe reboot bootloader && fastboot boot /z/win/boot.img 
#&& sleep 20 && adb.exe shell twrp decrypt 1234
#sleep 15
adb push gdbserver /sbin
adb shell chmod 755 /sbin/gdbserver
adb forward tcp:20000 tcp:20000
adb shell '/sbin/gdbserver --attach :20000 `pgrep recovery | head -2 | tail -1`'
#adb.exe shell '/sbin/gdbserver --attach :20000 `pgrep keystore | head -2 | tail -1`'
