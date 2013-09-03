#adb reboot recovery
#fastboot boot recovery.img
#sleep 20
adb push pppd /sbin
adb push gdbserver /sbin
adb shell chmod 755 /sbin/pppd
adb shell chmod 755 /sbin/gdbserver
sudo /home/bigbiff/android-sdk-linux/platform-tools/adb ppp "shell:/sbin/pppd nodetach noauth noipdefault /dev/tty" nodetach noauth noipdefault notty 10.0.0.1:10.0.0.2
adb shell '/sbin/gdbserver --attach 10.0.0.1:20000 `pgrep /sbin/twrpmtp`'
