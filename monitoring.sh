#!/bin/bash
cpu_virtual=$(cat /proc/cpuinfo | grep processor | wc -l)
mem=$(free -m | awk '$1 == "Mem.:" {printf("%d/%dMB (%.2f%%)", $3,$2, $3/$2*100)}')
disk_total=$(df -Bg | grep '^/dev/' | grep -v '/boot$' | awk '{ft += $2} END {printf("%dG"), ft}')
disk_used=$(df -Bm | grep '^/dev/' | grep -v '/boot$' | awk '{ut += $3} END {print ut}')
disk_porcent=$(df -Bm | grep '^/dev/' | grep -v '/boot$' | awk '{ut += $3} {ft+= $2} END {printf("%d%%"), ut/ft*100}')
sudo_log=$(journalctl _COMM=sudo | grep COMMAND | wc -l)
mac=$(ip a | grep link/ether | awk '{print $2}')
cpu_load=$(grep 'cpu ' /proc/stat | awk '{usage=($2+$4)*100/($2+$4+$5)} END {printf("%.2f%%\n", usage)}')
tcp=$(cat /proc/net/sockstat | grep "TCP" | awk '$1 == "TCP:" {print $3}')
lvm=$(lsblk | grep lvm | awk '{if ($2) {print "yes";exit;} else {print "no"} }')

wall " 	#Architecture: $(uname -a)
        #CPU phisical : $(nproc)
        #vCPU : $cpu_virtual
        #Memory Usage: $mem
        #Disk Usage: $disk_used/$disk_total ($dist_porcent)
	#Cpu load: $cpu_load
	#Last boot: $(who -b | awk '{print $4" "$5}')
	#User log: $(users | wc -w)
	#LVM use: $lvm
	#Connections TCP : $tcp ESTABLISHED
	#Network: IP $(hostname -I)($mac)
	#Sudo : $sudo_log cmd"