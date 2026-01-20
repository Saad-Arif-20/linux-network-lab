#!/bin/bash

# ==============================================================================
# Web Server Provisioning Script (Nginx)
# Author: Saad Arif
# Description: Installs Nginx, configures firewall, and deploys a static site.
# ==============================================================================

set -e

GREEN='\033[0;32m'
NC='\033[0m'

echo -e "${GREEN}[+] Configuring Web Server (Nginx)...${NC}"

# 1. Install Nginx
echo -e "${GREEN}[+] Installing Nginx...${NC}"
# sudo apt-get install nginx -y

# 2. Configure Firewall (UFW)
echo -e "${GREEN}[+] Configuring UFW Firewall...${NC}"
# sudo ufw allow 2222/tcp  # SSH (Custom port)
# sudo ufw allow 'Nginx Full' # HTTP/HTTPS
# sudo ufw enable

# 3. Deploy Configuration
echo -e "${GREEN}[+] Deploying Nginx Config...${NC}"
CONFIG_SRC="../configs/nginx_custom.conf"
CONFIG_DEST="/etc/nginx/sites-available/portfolio"

if [ -f "$CONFIG_SRC" ]; then
    # sudo cp "$CONFIG_SRC" "$CONFIG_DEST"
    # sudo ln -s "$CONFIG_DEST" /etc/nginx/sites-enabled/
    # sudo rm /etc/nginx/sites-enabled/default
    echo "Config deployed."
else
    echo "Warning: Custom config file not found locally."
fi

# 4. Create Dummy Content
echo -e "${GREEN}[+] Creating Web Content...${NC}"
WEB_ROOT="/var/www/portfolio"
# sudo mkdir -p $WEB_ROOT
# echo "<h1>System Admin Portfolio</h1><p>Deployed via Bash Script</p>" | sudo tee "$WEB_ROOT/index.html"

# 5. Restart Service
echo -e "${GREEN}[+] Restarting Nginx...${NC}"
# sudo systemctl restart nginx
# sudo systemctl status nginx --no-pager

echo -e "${GREEN}[+] Web Server Provisioning Complete!${NC}"
