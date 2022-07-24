#!/bin/bash

RAM_total=$(free -m | grep "Mem:" | awk '\{print $2\}')
RAM_used=$(free -m | grep "Mem:" | awk '\{print $3\}')
RAM_percent=$(free -m | grep "Mem:" | awk '\{printf("%.2f%%\\n"), $3/$2*100\}')
MEM_total=$(df -h --total | grep "total" | awk '\{print $2\}')
MEM_used=$(df -m --total | grep "total" | awk '\{print $3\}')
MEM_percent=$(df -m --total | grep "total" | awk '\{printf("%.2f%%\\n"), $3/$2*100\}')
CPU_load=$(mpstat | grep "all" | awk '\{print 100- $13"%"\}')
LVM_list=$(lsblk | awk '\{print $6\}' | grep "lvm" | wc -l)
TCP_list=$(ss | grep "tcp" | wc -l)
USER_on=$(who | awk '\{print $1\}' | uniq | wc -l)
IPV4_address=$(ip link | grep "link/ether" | awk '\{print $2\}')
MAC_address=$(hostname -I)
SUDO_used=$(journalctl _COMM=sudo | grep "COMMAND" | wc -l)
BOOT_last=$(who -b | awk '$1 == "system" {print $3 " " $4}')

wall "
#Architecture: $(uname -a)
#CPU physical : $(lscpu | grep "Socket(s):" | awk '\{print $2\}')
#vCPU : $(nproc)
#Memory Usage: $RAM_used/$\{RAM_total\}MB ($RAM_percent)
#Disk Usage: $MEM_used/$\{MEM_total\}b ($MEM_percent)
#CPU load: $CPU_load
#Last boot: $BOOT_last
#LVM use: $(if [ $LVM_list -eq 0 ]; then echo "no"; else echo "yes"; fi)
#Connections TCP : $\{TCP_list\} ESTABLISHED
#User log: $USER_on
#Network: IP $MAC_address($IPV4_address)
#Sudo : $SUDO_used cmd
"
