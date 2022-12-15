#!/bin/bash
arc=$(uname -a)
cpu_physic=$(cat /proc/cpuinfo | grep "physical id" | wc -l)
cpu_virtual=$(cat /proc/cpuinfo | grep processor | wc-l)
mem_used=$(free | awk '/Mem/ {printf("%0.f\n", $3 / 1024)}')
mem_total=$(free | awk '/Mem/ {printf("%0.f\n", $2 / 1024)}')
mem_porcent=$(echo "$mem_user $mem_total" | awk '{printf ("%.2f", ($1 / $2) * 100)}')

echo "#Memory Usage:" "${mem_used}/${mem_total}MB" "($mem_porcent%)"



#!/bin/bash
wall $'#Architecture: ' `hostnamectl | grep "Operating System" | cut -d ' ' -f5- ` `awk -F':' '/^model name/ {print $2}' /proc/cpuinfo | uniq | sed -e 's/^[ \t]*//'` `arch` \
$'\n#CPU physical: '`cat /proc/cpuinfo | grep processor | wc -l` \
$'\n#vCPU:  '`cat /proc/cpuinfo | grep processor | wc -l` \
$'\n'`free -m | awk 'NR==2{printf "#Memory Usage: %s/%sMB (%.2f%%)", $3,$2,$3*100/$2 }'` \
$'\n'`df -h | awk '$NF=="/"{printf "#Disk Usage: %d/%dGB (%s)", $3,$2,$5}'` \
$'\n'`top -bn1 | grep load | awk '{printf "#CPU Load: %.2f\n", $(NF-2)}'` \
$'\n#Last boot: ' `who -b | awk '{print $3" "$4" "$5}'` \
$'\n#LVM use: ' `lsblk |grep lvm | awk '{if ($1) {print "yes";exit;} else {print "no"} }'` \
$'\n#Connection TCP:' `netstat -an | grep ESTABLISHED |  wc -l` \
$'\n#User log: ' `who | cut -d " " -f 1 | sort -u | wc -l` \
$'\nNetwork: IP ' `hostname -I`"("`ip a | grep link/ether | awk '{print $2}'`")" \
$'\n#Sudo:  ' `grep 'sudo ' /var/log/auth.log | wc -l`




#!/bin/bash
cpu_virtual=$(cat /proc/cpuinfo | grep processor | wc -l)
mem=$(free -m | awk '$1 == "Mem:" {printf("%d/%dMB (%.2f%)", $3,$2, $3/$2*100)}')
disk_usage=$(df -h | awk '$NF=="/"{printf("%d/%dGB (%s)", $3,$2,$5)}')

wall"   #Architecture: $(uname -a)
                #CPU phisical: $(nproc)
                #vCPU: $cpu_virtual
                #Memory Usage: $mem
                #Disk Usage: $disk_usage
        "