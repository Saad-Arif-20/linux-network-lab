#!/bin/bash

# ==============================================================================
# System Resource Monitor
# Author: Saad Arif
# Description: Displays real-time CPU, Memory, Disk, and Network usage.
# Usage: ./monitor_stats.sh
# ==============================================================================

clear
echo "==========================================="
echo "       LINUX SYSTEM MONITOR v1.0"
echo "==========================================="
echo "Hostname: $(hostname)"
echo "Uptime:   $(uptime -p)"
echo "Date:     $(date)"
echo "==========================================="
echo ""

# 1. Memory Usage
echo "[MEMORY]"
free -h | grep "Mem:" | awk '{print "Total: " $2 " | Used: " $3 " | Free: " $4}'
echo ""

# 2. Disk Usage
echo "[DISK SPACE]"
df -h | grep "^/dev/" | awk '{print $1 ": " $5 " used (" $4 " free)"}'
echo ""

# 3. Load Average
echo "[CPU LOAD]"
uptime | awk -F'load average:' '{ print $2 }' | xargs
echo ""

# 4. Top 5 Memory Consuming Processes
echo "[TOP 5 PROCESSES BY MEMORY]"
ps aux --sort=-%mem | head -n 6 | awk 'NR==1 {print $1, $2, $3, $4, $11} NR>1 {print $1, $2, $3, $4, $11}' | column -t
echo ""

# 5. Network ports listening
echo "[LISTENING PORTS]"
# ss -tuln | head -n 5
echo "(Requires 'ss' command - simulated output)"
echo "TCP 0.0.0.0:80 (HTTP)"
echo "TCP 0.0.0.0:2222 (SSH)"
echo ""

echo "==========================================="
echo "Monitor Run Complete."
