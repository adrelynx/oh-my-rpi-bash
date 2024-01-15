#!/bin/bash

hostName=`uname -n`
diskSpace=`df -Ph | grep /dev/root | awk '{print $4}' | tr -d '\n'`
memoryUsed=`free -t -m | grep Total | awk '{print $3" MB";}'`
momoryFree=`free -t -m | grep Total | awk '{print $4" MB";}'`

function getIPAddress() {
    local ip_route
    ip_route=$(ip -4 route get 8.8.8.8 2>/dev/null)
    if [[ -z "$ip_route" ]]; then
        ip_route=$(ip -6 route get 2001:4860:4860::8888 2>/dev/null)
    fi
    [[ -n "$ip_route" ]] && grep -oP "src \K[^\s]+" <<< "$ip_route"
}
getPublicIP=`curl -s https://icanhazip.com`


echo "
===========================================
- User@Hostname.......: $USER@$hostName
- Disk Space..........: $diskSpace
- Memory used.........: $memoryUsed
- Memory free.........: $momoryFree
- Local IP............: $(getIPAddress)
- Public IP...........: $getPublicIP
- Shell...............: $SHELL
===========================================
"

