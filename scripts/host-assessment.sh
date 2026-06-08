#!/bin/bash

echo "======================================"
echo "       DEVOPS HOMELAB HOST REPORT"
echo "======================================"
echo

# --------------------------
# OS Information
# --------------------------
echo "[OS]"
echo "Distribution : $(grep '^NAME=' /etc/os-release | cut -d= -f2 | tr -d '"')"
echo "Version      : $(grep '^VERSION=' /etc/os-release | cut -d= -f2 | tr -d '"')"
echo

# --------------------------
# Kernel Information
# --------------------------
echo "[KERNEL]"
echo "Kernel Version : $(uname -r)"
echo

# --------------------------
# CPU Information
# --------------------------
echo "[CPU]"
echo "Model          : $(lscpu | grep 'Model name' | sed 's/Model name:[[:space:]]*//')"
echo "CPU(s)         : $(nproc)"
echo

# --------------------------
# Memory Information
# --------------------------
echo "[MEMORY]"
free -h | awk '
NR==2 {
    print "Total RAM     : " $2
    print "Used RAM      : " $3
    print "Available RAM : " $7
}'
echo

# --------------------------
# Storage Information
# --------------------------
echo "[STORAGE]"
echo "Filesystem Usage:"
df -hT | grep -v tmpfs
echo

echo "Block Devices:"
lsblk
echo

# --------------------------
# Network Information
# --------------------------
echo "[NETWORK]"
echo "Hostname       : $(hostname)"

IP=$(hostname -I | awk '{print $1}')
echo "IP Address     : $IP"
echo

# --------------------------
# Uptime
# --------------------------
echo "[UPTIME]"
uptime -p
echo

# --------------------------
# Filesystem Information
# --------------------------
echo "[FILESYSTEMS]"
findmnt -D
echo

echo "======================================"
echo "         REPORT COMPLETE"
echo "======================================"

