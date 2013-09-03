adb reboot bootloader
sleep 5
fastboot boot /repos/recovery.img
sleep 10 
/repos/relink.sh /repos2/cm9/out/target/product/toro/symbols/system/bin/linker
chmod 755 /repos2/cm9/out/target/product/toro/symbols/system/bin/linker-1-mod
/repos/relink.sh /repos2/cm9/out/target/product/toro/symbols/system/bin/twrpmtp
chmod 755 /repos2/cm9/out/target/product/toro/symbols/system/bin/twrpmtp-1-mod
adb push /repos2/cm9/out/target/product/toro/symbols/system/bin/linker-1-mod /sbin/linker
adb push /repos2/cm9/out/target/product/toro/symbols/system/bin/twrpmtp-1-mod /sbin/twrpmtp
adb push valgrind-tool /sbin/
adb shell chmod -R 755 /sbin/bin
adb shell 'export VALGRIND_LIB=/sbin/lib/valgrind; /sbin/bin/valgrind -v /sbin/twrpmtp'
