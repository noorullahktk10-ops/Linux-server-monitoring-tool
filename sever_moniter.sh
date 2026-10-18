#!/bin/bash

# Linux Server Health Monitoring Tool
# Author: Noorullah
# Purpose: Check CPU, Memory, Disk Usage

echo "=============================="
echo " Server Health Report"
echo " Date: $(date)"
echo "=============================="

echo ""
echo "--- CPU Usage ---"
top -bn1 | grep "Cpu(s)" 

echo ""
echo "--- Memory Usage ---"
free -h

echo ""
echo "--- Disk Usage ---"
df -h

echo ""
echo "--- Uptime ---"
uptime

echo ""
echo "--- Top 5 Processes ---"
ps aux --sort=-%mem | head -n 6

echo ""
echo "Report Completed!"
