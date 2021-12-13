TL;DR

How to Use in WSL2

In Powershell:

adb kill-server

adb -a -P 5037 nodaemon server

In Ubuntu WSL2:

export ADB_SERVER_SOCKET=tcp:<your_ip>:5037

./debug.sh 

In gdb-cmds2 replace the appropriate directories with your build output directory.

In Ubuntu WSL2:

gdb-multiarch -x gdb-cmds2
