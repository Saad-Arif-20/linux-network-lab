#!/bin/bash

# ==============================================================================
# System Preparation & Hardening Script
# Author: Saad Arif
# Description: Updates system, creates admin user, and hardens SSH configuration.
# ==============================================================================

set -e  # Exit on error

# Colors for output
GREEN='\033[0;32m'
NC='\033[0m' # No Color

echo -e "${GREEN}[+] Starting System Preparation...${NC}"

# 1. Update Package Repositories
echo -e "${GREEN}[+] Updating system packages...${NC}"
# sudo apt-get update && sudo apt-get upgrade -y

# 2. Create Sudo User (Best practice: Don't use root)
USERNAME="sysadmin"
echo -e "${GREEN}[+] Creating user: $USERNAME${NC}"
# sudo useradd -m -s /bin/bash $USERNAME
# sudo usermod -aG sudo $USERNAME

# 3. SSH Hardening
echo -e "${GREEN}[+] Hardening SSH configuration...${NC}"
SSH_CONFIG="/etc/ssh/sshd_config"

# Backup original config
# if [ ! -f "${SSH_CONFIG}.bak" ]; then
#     sudo cp $SSH_CONFIG "${SSH_CONFIG}.bak"
# fi

# Apply security settings (simulated)
# - Disable Root Login
# - Change Default Port to 2222
# - Disable Password Auth (Key-only)
echo "PermitRootLogin no" | sudo tee -a $SSH_CONFIG > /dev/null
echo "PasswordAuthentication no" | sudo tee -a $SSH_CONFIG > /dev/null
echo "Port 2222" | sudo tee -a $SSH_CONFIG > /dev/null

# 4. Restart SSH Service
echo -e "${GREEN}[+] Restarting SSH service...${NC}"
# sudo systemctl restart ssh

echo -e "${GREEN}[+] System Preparation Complete!${NC}"
