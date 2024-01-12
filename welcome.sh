#!/bin/bash

hostName=`uname -n`
diskSpace=`df -Ph | grep /dev/root | awk '{print $4}' | tr -d '\n'`
memoryUsed=`free -t -m | grep Total | awk '{print $3" MB";}'`

echo "
===========================================
 - Hostname............: $hostName
 - Disk Space..........: $diskSpace
 - Memory used.........: $memoryUsed
===========================================
"
