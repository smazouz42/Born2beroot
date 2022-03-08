#!/bin/bash
#█▀▀█ █▀▀█ █▀▀ █░░█ ░▀░ ▀▀█▀▀ █▀▀ █▀▀ ▀▀█▀▀ █░░█ █▀▀█ █▀▀
#█▄▄█ █▄▄▀ █░░ █▀▀█ ▀█▀ ░░█░░ █▀▀ █░░ ░░█░░ █░░█ █▄▄▀ █▀▀
#▀░░▀ ▀░▀▀ ▀▀▀ ▀░░▀ ▀▀▀ ░░▀░░ ▀▀▀ ▀▀▀ ░░▀░░ ░▀▀▀ ▀░▀▀ ▀▀▀

uname=$(uname -a)
echo "#Architecture : $uname"

#░█▀▀█ ░█▀▀█ ░█─░█ 　 ─▀─ █▀▀▄ █▀▀ █▀▀█
#░█─── ░█▄▄█ ░█─░█ 　 ▀█▀ █──█ █▀▀ █──█
#░█▄▄█ ░█─── ─▀▄▄▀ 　 ▀▀▀ ▀──▀ ▀── ▀▀▀▀

pCpu=$(cat /proc/cpuinfo | grep "physical id" | wc -l)
vCpu=$(cat /proc/cpuinfo | grep "processor" | wc -l)
echo "#Cpu physical : $pCpu"
echo "#vCpu : $vCpu"

#█▀▄▀█ █▀▀ █▀▄▀█ █▀▀█ █▀▀█ █──█ 　 ─▀─ █▀▀▄ █▀▀ █▀▀█ 
#█─▀─█ █▀▀ █─▀─█ █──█ █▄▄▀ █▄▄█ 　 ▀█▀ █──█ █▀▀ █──█ 
#▀───▀ ▀▀▀ ▀───▀ ▀▀▀▀ ▀─▀▀ ▄▄▄█ 　 ▀▀▀ ▀──▀ ▀── ▀▀▀▀

Ram=$(free -m | grep "Mem" | awk '{printf("#Memory Usage : %d/%dMB (%.2f%%)"),$3,$2,(($3/$2)*100)}')
echo "$Ram"

#█▀▀▄ ─▀─ █▀▀ █─█ 　 ─▀─ █▀▀▄ █▀▀ █▀▀█
#█──█ ▀█▀ ▀▀█ █▀▄ 　 ▀█▀ █──█ █▀▀ █──█
#▀▀▀─ ▀▀▀ ▀▀▀ ▀─▀ 　 ▀▀▀ ▀──▀ ▀── ▀▀▀▀

fdisk=$(df -Bg | grep '^/dev/' | grep -v '/boot$' | awk '{ft += $2} END {print ft}')
udisk=$(df -Bg | grep '^/dev/' | grep -v '/boot$' | awk '{ut += $3} END {print ut * 1024}')
pdisk=$(df -Bg | grep '^/dev/' | grep -v '/boot$' | awk '{ut += $3} {ft+= $2} END {printf("(%d%%)"), ut/ft*100}')
echo "full disk space : $fdisk GB"
echo "disk usage : $udisk M"
echo "#Disk Usage: $udisk/${fdisk}GB $pdisk"

#░█▀▀█ ░█▀▀█ ░█─░█ 　 █── █▀▀█ █▀▀█ █▀▀▄ 
#░█─── ░█▄▄█ ░█─░█ 　 █── █──█ █▄▄█ █──█ 
#░█▄▄█ ░█─── ─▀▄▄▀ 　 ▀▀▀ ▀▀▀▀ ▀──▀ ▀▀▀─

cpul=$(w | grep user | awk '{printf("%.2f",$11+$9)}')
echo "#CPU load: ${cpul}%"

#█▀▀▄ █▀▀█ █▀▀█ ▀▀█▀▀ 　 ─▀─ █▀▀▄ █▀▀ █▀▀█
#█▀▀▄ █──█ █──█ ──█── 　 ▀█▀ █──█ █▀▀ █──█
#▀▀▀─ ▀▀▀▀ ▀▀▀▀ ──▀── 　 ▀▀▀ ▀──▀ ▀── ▀▀▀▀

date=$(who -b | awk '{print $3}')
time=$(who -b | awk '{print $4}')
echo "#Last boot: $date $time"

#░█─── ░█──░█ ░█▀▄▀█ 　 ░█─░█ █▀▀ █▀▀█ █▀▀▀ █▀▀
#░█─── ─░█░█─ ░█░█░█ 　 ░█─░█ ▀▀█ █▄▄█ █─▀█ █▀▀
#░█▄▄█ ──▀▄▀─ ░█──░█ 　 ─▀▄▄▀ ▀▀▀ ▀──▀ ▀▀▀▀ ▀▀▀

lvmt=$(lsblk | grep "lvm" | wc -l)
lvmu=$(if [ $lvmt -eq 0 ]; then echo no; else echo yes; fi)
echo"#LVM user: $lvmu"

#▀▀█▀▀ █▀▀ █▀▀█ 　 █▀▀ █▀▀█ █▀▀▄ █▀▀▄ █▀▀ █▀▀ ▀▀█▀▀ ─▀─ █▀▀█ █▀▀▄
#──█── █── █──█ 　 █── █──█ █──█ █──█ █▀▀ █── ──█── ▀█▀ █──█ █──█
#──▀── ▀▀▀ █▀▀▀ 　 ▀▀▀ ▀▀▀▀ ▀──▀ ▀──▀ ▀▀▀ ▀▀▀ ──▀── ▀▀▀ ▀▀▀▀ ▀──▀

tcp=$(ss | grep tcp | grep ESTAB | wc -l)
echo "#Connexions TCP : $tcp ESTABLISHED"

#█──█ █▀▀ █▀▀ █▀▀█ 　 █── █▀▀█ █▀▀▀ ─▀─ █▀▀▄ 　 █▀▀ █▀▀█ █──█ █▀▀▄ ▀▀█▀▀ 
#█──█ ▀▀█ █▀▀ █▄▄▀ 　 █── █──█ █─▀█ ▀█▀ █──█ 　 █── █──█ █──█ █──█ ──█── 
#─▀▀▀ ▀▀▀ ▀▀▀ ▀─▀▀ 　 ▀▀▀ ▀▀▀▀ ▀▀▀▀ ▀▀▀ ▀──▀ 　 ▀▀▀ ▀▀▀▀ ─▀▀▀ ▀──▀ ──▀──

users=$(who | wc -l)
echo "#User log: $users"

█#▀▀▄ █▀▀ ▀▀█▀▀ █───█ █▀▀█ █▀▀█ █─█ 　 ─▀─ █▀▀▄ █▀▀ █▀▀█ 
#█──█ █▀▀ ──█── █▄█▄█ █──█ █▄▄▀ █▀▄ 　 ▀█▀ █──█ █▀▀ █──█ 
#▀──▀ ▀▀▀ ──▀── ─▀─▀─ ▀▀▀▀ ▀─▀▀ ▀─▀ 　 ▀▀▀ ▀──▀ ▀── ▀▀▀▀

mac=$(ip link show | grep "link/ether" | awk '{print $2}')
ip=$(hostname -I)
echo "#Network: IP ${ip} ($mac)"

#█▀▀ █──█ █▀▀▄ █▀▀█ 　 █▀▀ █▀▀█ █──█ █▀▀▄ ▀▀█▀▀ 
#▀▀█ █──█ █──█ █──█ 　 █── █──█ █──█ █──█ ──█── 
#▀▀▀ ─▀▀▀ ▀▀▀─ ▀▀▀▀ 　 ▀▀▀ ▀▀▀▀ ─▀▀▀ ▀──▀ ──▀──

sudo=$( sudo cat /var/log/sudo/hst | grep COMMAND | wc -l)
echo "#Sudo : ${sudo} cmd"
