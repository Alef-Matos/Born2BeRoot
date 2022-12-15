#!/bin/bash
cpu_virtual=$(cat /proc/cpuinfo | grep processor | wc -l)
mem=$(free -m | awk '$1 == "Mem:" {printf("%d/%dMB (%s)"), $3,$2}')
mem_porcent=$(free | awk '$1 == "Mem:" {printf("%.2f", $3/$2*100)}')
disk_usage=$(df -h | awk '$NF=="/"{printf("%d/%dGB (%s)", $3,$2,$5)}')

wall"	#Architecture: $(uname -a)
		#CPU phisical: $(nproc)
		#vCPU: $cpu_virtual
		#Memory Usage: $(mem) ($(mem_porcent))
		#Disk Usage: $disk_usage
	"
