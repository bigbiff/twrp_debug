z:\win\adb reboot bootloader && fastboot boot z:\win\boot.img
sleep 15
z:\win\adb push gdbserver /sbin
z:\win\adb shell chmod 755 /sbin/gdbserver
z:\win\adb -a forward tcp:20000 tcp:20000
FOR /F "tokens=* USEBACKQ" %%F IN (`z:\win\adb shell pgrep recovery`) DO (
    SET pid=%%F
)	
echo %pid%
z:\win\adb shell /sbin/gdbserver --attach :20000 %pid%
