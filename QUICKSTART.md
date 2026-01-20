# Quick Start Guide - Linux Network Lab

A concise reference for deploying and testing the Linux system administration and network services infrastructure.

## Quick Setup (5 Minutes)

```bash
# Clone the repository
git clone https://github.com/yourusername/linux-network-lab.git
cd linux-network-lab/scripts

# Make scripts executable
chmod +x *.sh
```

## Common Commands

```bash
# System preparation and hardening
sudo ./system_prep.sh

# Web server deployment
sudo ./setup_web.sh

# System monitoring
./monitor_stats.sh
```

## What You'll See

### System Preparation Output

```
========================================
  SYSTEM PREPARATION
========================================
[+] Creating admin user...
[+] Updating system packages...
[+] Configuring SSH security...
    - Port changed to 2222
    - Root login disabled
    - Key-based auth enabled
[+] Configuring firewall (UFW)...
    - Allowing SSH (port 2222)
    - Allowing HTTP (port 80)
    - Allowing HTTPS (port 443)
[+] System hardening complete!

IMPORTANT: Next SSH login requires:
ssh -p 2222 user@hostname
```

### Web Server Setup Output

```
========================================
  WEB SERVER DEPLOYMENT
========================================
[+] Installing Nginx...
[+] Deploying custom configuration...
[+] Enabling gzip compression...
[+] Adding security headers...
[+] Starting Nginx service...
[+] Web server deployed successfully!

Visit: http://localhost
```

### Monitoring Dashboard Output

```
========================================
  SYSTEM RESOURCE MONITOR
========================================

CPU Load Averages:
  1 min:  0.45
  5 min:  0.38
  15 min: 0.29

Memory Usage:
  Total:     8.0 GB
  Used:      3.2 GB (40%)
  Free:      4.8 GB (60%)

Disk Usage:
  Total:     100 GB
  Used:      45 GB (45%)
  Available: 55 GB (55%)

Top 5 Processes by CPU:
  PID    CPU%   MEM%   COMMAND
  1234   12.5   2.3    nginx
  5678   8.2    1.5    python3
  9012   5.1    0.8    sshd
```

## Project Statistics

- **Scripts**: 3 automation scripts
- **Configurations**: 2 hardened config files
- **Services**: Nginx web server + SSH
- **Security**: UFW firewall + SSH hardening
- **Monitoring**: Real-time resource dashboard

## Key Features Demonstrated

- [+] Bash scripting automation
- [+] System security hardening
- [+] Service management (Systemd)
- [+] Firewall configuration (UFW)
- [+] Web server deployment (Nginx)
- [+] Resource monitoring
- [+] Infrastructure as Code (IaC)

## Security Considerations

### ⚠️ Important Warnings

**Before running `system_prep.sh`:**
1. Ensure you have SSH keys configured
2. Backup current SSH configuration
3. Note the new SSH port (2222)
4. Test on a non-production system first

**SSH Access After Setup:**
```bash
# Old way (will no longer work):
ssh user@hostname

# New way (required):
ssh -p 2222 user@hostname
```

## Configuration Files

### Nginx Custom Configuration
- **Location**: `configs/nginx_custom.conf`
- **Features**: Gzip compression, security headers, optimized caching
- **Deployment**: Automatically copied by `setup_web.sh`

### SSH Hardened Configuration
- **Location**: `configs/sshd_hardened`
- **Features**: Port 2222, no root login, key-based auth only
- **Deployment**: Automatically applied by `system_prep.sh`

## Testing the Setup

### 1. Verify SSH Hardening
```bash
# Check SSH is running on port 2222
sudo netstat -tulpn | grep 2222

# Test connection
ssh -p 2222 localhost
```

### 2. Verify Web Server
```bash
# Check Nginx status
sudo systemctl status nginx

# Test web server
curl http://localhost

# Check security headers
curl -I http://localhost
```

### 3. Verify Firewall
```bash
# Check UFW status
sudo ufw status verbose

# Should show:
# - 2222/tcp (SSH)
# - 80/tcp (HTTP)
# - 443/tcp (HTTPS)
```

## Troubleshooting

### SSH Connection Refused
```bash
# Check if SSH is running
sudo systemctl status sshd

# Verify port
sudo netstat -tulpn | grep sshd

# Check firewall
sudo ufw status
```

### Nginx Won't Start
```bash
# Check configuration syntax
sudo nginx -t

# View error logs
sudo tail -f /var/log/nginx/error.log

# Restart service
sudo systemctl restart nginx
```

### Locked Out of SSH
```bash
# If you can't connect via SSH:
# 1. Access via console (physical or cloud provider)
# 2. Reset SSH config:
sudo cp /etc/ssh/sshd_config.backup /etc/ssh/sshd_config
sudo systemctl restart sshd
```

## Platform Support

- ✅ Ubuntu 20.04+ (recommended)
- ✅ Debian 10+
- ✅ WSL2 (Windows Subsystem for Linux)
- ⚠️ CentOS/RHEL (may need package name adjustments)

## Next Steps

After successful setup:

1. **Customize Nginx**: Edit `configs/nginx_custom.conf` for your needs
2. **Add SSL/TLS**: Install Certbot for Let's Encrypt certificates
3. **Monitor Logs**: Set up log rotation and monitoring
4. **Automate Backups**: Create backup scripts for configurations
5. **Expand Services**: Add database, caching, or other services

## Requirements

- Linux system (Ubuntu/Debian recommended)
- Root/sudo privileges
- Internet connection (for package installation)
- SSH client (for remote access)

## Support

For detailed documentation, see:
- **README.md** - Complete project documentation
- **scripts/** - Commented automation scripts
- **configs/** - Configuration file templates

---

**Ready to deploy!** 🚀
