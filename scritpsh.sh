#!/bin/bash
MEM_TOTAL=$(free | awk '/Mem/ {printf("%0.f\n", $2 / 1024)}')
MEM_USED=$(free | awk '/Mem/ {printf("%0.f\n", $3 / 1024)}')
MEM_USED_PERCENT=$(echo "$MEM_USED $MEM_TOTAL" | awk '{printf ("%.2f", ($1 / $2) * 100)}')
DISK_USED=$(df --output=used | tail --lines=+2 | paste -sd+ | bc | awk '{printf("%.0f\n", $1 / 1024)}')
DISK_AVAIL_MB=$(df --output=avail | tail --lines=+2 | paste -sd+ | bc | awk '{printf("%.0f\n", $1 / 1024)}')
DISK_AVAIL_GB=$(echo "$DISK_AVAIL_MB" | awk '{printf ("%d", ($1 / 1024))}')
DISK_AVAIL_PERCENT=$(echo "$DISK_USED $DISK_AVAIL_MB" | awk '{printf ("%.2f", ($1 / $2) * 100)}')
LAST_BOOT=$(uptime -s)
LAST_BOOT=${LAST_BOOT::-3}
LVM_COUNT=$(lsblk -o TYPE | grep lvm | wc -l)
HAS_LVM="no"
if [[ "$LVM_COUNT" > 0 ]]
then
        HAS_LVM="yes"
fi
echo "Broadcast message from" $(whoami)"@"$(hostnamectl | awk '/Static hostname/ {print $3}') "("$(tty | awk -F/ '{print $3}')")" $(date)
echo "#Architecture: " $(uname -a)
echo "#CPU physical :" $(cat /proc/cpuinfo | grep 'physical id' | sort -u | wc -l)
echo "#vCPU :" $(nproc)
echo "#Memory Usage:" "${MEM_USED}/${MEM_TOTAL}MB" "($MEM_USED_PERCENT%)"
echo "#Disk Usage:" "${DISK_USED}MB/${DISK_AVAIL_GB}GB" "($DISK_AVAIL_PERCENT%)"
echo "#CPU load:" $(grep 'cpu ' /proc/stat | awk '{usage=($2+$4)*100/($2+$4+$5)} END {printf("%.2f%%\n", usage)}')
echo "#Last boot: $LAST_BOOT"
echo "#LVM: $HAS_LVM"
echo "Connections TCP:" $(grep '^ *[0-9]\+: [0-9A-F: ]\{27\} 01 ' /proc/net/tcp -c) "ESTABLISHED"
echo "#User log:" $(who | awk '{print $1}' | sort -u | wc -l)
echo "#Network: IP" $(hostname -I | awk '{print $2}') "("$(ip a | grep ether | tail -n 1 | awk '{print $2}')")"
echo "#Sudo : $(cat /var/log/sudo/sudo.log | grep -c COMMAND) cmd"