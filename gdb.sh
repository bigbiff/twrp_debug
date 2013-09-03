adb reboot bootloader
sleep 5
fastboot boot /repos/recovery.img
sleep 20 
adb push gdbserver /sbin
adb shell chmod 755 /sbin/gdbserver
adb push rndis.sh /sbin
adb shell chmod 755 /sbin/rndis.sh
/repos/relink.sh /repos2/cm9/out/target/product/toro/symbols/system/bin/linker
chmod 755 /repos2/cm9/out/target/product/toro/symbols/system/bin/linker-1-mod
/repos/relink.sh /repos2/cm9/out/target/product/toro/symbols/system/bin/twrpmtp
chmod 755 /repos2/cm9/out/target/product/toro/symbols/system/bin/twrpmtp-1-mod
adb push /repos2/cm9/out/target/product/toro/symbols/system/bin/linker-1-mod /sbin/linker
adb push /repos2/cm9/out/target/product/toro/symbols/system/bin/twrpmtp-1-mod /sbin/twrpmtp
sleep 30
adb shell 'ifconfig rndis0 10.10.10.1'
sudo ifconfig usb0 10.10.10.2
adb shell '/sbin/gdbserver 10.0.0.1:20000 /sbin/twrpmtp'
