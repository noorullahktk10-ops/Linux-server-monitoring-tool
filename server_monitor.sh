#!/bin/bash
# Advanced Server Monitoring Tool - Intermediate Level
# Author: Noorullah

CPU_THRESHOLD=80
MEM_THRESHOLD=80
DISK_THRESHOLD=80

echo "===== Advanced Server Report - $(date) ====="

# CPU Check with ALERT
CPU=$(top -bn1 | grep "Cpu(s)" | sed "s/.*, *\([0-9.]*\)%* id.*/\1/" | awk '{print 100 - $1}')
CPU_INT=${CPU%.*}
echo "CPU Usage: $CPU%"

if [ "$CPU_INT" -gt "$CPU_THRESHOLD" ]; then
    echo "🚨 ALERT: CPU High - $CPU% (Threshold $CPU_THRESHOLD%)"
else
    echo "✅ CPU OK"
fi

# Memory Check with ALERT
MEM=$(free | awk '/Mem/{printf "%.0f", $3/$2*100}')
echo "Memory Usage: $MEM%"

if [ "$MEM" -gt "$MEM_THRESHOLD" ]; then
    echo "🚨 ALERT: Memory High - $MEM%"
else
    echo "✅ Memory OK"
fi

# Disk Check with ALERT
DISK=$(df / | awk 'END{print $5}' | sed 's/%//')
echo "Disk Usage: $DISK%"

if [ "$DISK" -gt "$DISK_THRESHOLD" ]; then
    echo "🚨 ALERT: Disk Full - $DISK%"
else
    echo "✅ Disk OK"
fi

# Top Processes
echo "----- Top 5 Processes -----"
ps aux --sort=-%mem | head -n 6

echo "===== Check Complete ====="
