# 🐧 Linux System Administration & Network Services Lab

[![Shell Script](https://img.shields.io/badge/Shell-Bash-4EAA25?logo=gnu-bash&logoColor=white)](https://www.gnu.org/software/bash/)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
[![Platform](https://img.shields.io/badge/Platform-Linux-FCC624?logo=linux&logoColor=black)](https://www.linux.org/)

Infrastructure as Code (IaC) scripts for automated Linux server provisioning, security hardening, and service deployment. Demonstrates professional DevOps practices with Bash automation, Nginx configuration, and system monitoring.

## 🌟 Why This Project?

Manual server configuration is error-prone, time-consuming, and not reproducible. This project showcases **Infrastructure as Code** principles, allowing you to provision secure, production-ready Linux servers with a single command. Essential skills for DevOps engineers, system administrators, and backend developers.

### Key Highlights
- 🔒 **Security Hardening** - SSH hardening, firewall configuration, key-based authentication
- 🚀 **Automated Deployment** - One-command server setup with Nginx
- 📊 **System Monitoring** - Real-time resource monitoring dashboard
- 🔧 **Production-Inspired** - Best practices for web server configuration
- 📝 **Well-Documented** - Clear scripts with inline comments
- ♻️ **Reproducible** - Consistent server setup every time

---

## 🚀 At a Glance

- 🔒 **Security hardening** (SSH, firewall, key-based auth)
- 🌐 **Nginx web server** (automated deployment with optimization)
- 📊 **System monitoring** (real-time resource dashboard)
- 🤖 **Infrastructure as Code** (reproducible Bash scripts)
- ⚡ **One-command setup** (automated provisioning)
- 📚 **Zero dependencies** (pure Bash, standard Linux tools)

⏱️ **Setup time**: ~5 minutes  
🎓 **Ideal for**: DevOps engineers, system administrators, backend developers

---

## 📚 Table of Contents

- [Why This Project?](#-why-this-project)
- [Quick Start](#-quick-start)
- [Project Structure](#️-project-structure)
- [Security Features](#-security-features)
- [Web Server Deployment](#-web-server-deployment)
- [System Monitoring](#-system-monitoring)
- [Key Design Decisions](#-key-design-decisions)
- [What I Learned](#-what-i-learned)
- [Use Cases](#-use-cases)
- [Contributing](#-contributing)

---

## 🚀 Quick Start

### Prerequisites
- Linux environment (Ubuntu/Debian recommended) or WSL on Windows
- Root/sudo privileges
- Basic understanding of Linux commands

### Installation

```bash
# Clone the repository
git clone https://github.com/Saad-Arif-20/linux-network-lab.git
cd linux-network-lab/scripts

# Make scripts executable
chmod +x *.sh
```

### Usage

**⚠️ Warning**: `system_prep.sh` modifies SSH configuration. Ensure you have SSH keys configured before running on remote servers.

```bash
# 1. System hardening (changes SSH port to 2222)
sudo ./system_prep.sh

# 2. Deploy Nginx web server
sudo ./setup_web.sh

# 3. Monitor system resources
./monitor_stats.sh
```

---

## 🏗️ Project Structure

```
linux-network-lab/
├── scripts/
│   ├── system_prep.sh       # User setup & security hardening
│   ├── setup_web.sh         # Nginx installation & configuration
│   └── monitor_stats.sh     # System resource monitoring
├── configs/
│   ├── nginx_custom.conf    # Optimized Nginx configuration
│   └── sshd_hardened        # Secure SSH configuration
├── screenshots/             # Execution evidence
└── README.md
```

---

## 🔒 Security Features

### 1. SSH Hardening (`system_prep.sh`)

**Implemented Security Measures:**
- ✅ Disable root login via SSH
- ✅ Change default SSH port (22 → 2222)
- ✅ Enforce key-based authentication only
- ✅ Disable password authentication
- ✅ Configure SSH timeout settings

```bash
# After running system_prep.sh, connect with:
ssh -p 2222 username@server-ip
```

### 2. Firewall Configuration (UFW)

**Allowed Ports:**
- `2222` - SSH (custom port)
- `80` - HTTP
- `443` - HTTPS

```bash
# Firewall rules applied automatically
sudo ufw status
```

### 3. Principle of Least Privilege
- Non-root user with sudo access
- Service-specific permissions
- Minimal attack surface

---

## 🌐 Web Server Deployment

### Nginx Configuration (`setup_web.sh`)

**Features:**
- ✅ Gzip compression for bandwidth optimization
- ✅ Security headers (X-Frame-Options, X-XSS-Protection)
- ✅ Centralized access and error logging
- ✅ Optimized worker processes
- ✅ Custom error pages

**Verify Deployment:**
```bash
# Check Nginx status
sudo systemctl status nginx

# Visit your server
curl http://localhost
```

---

## 📊 System Monitoring

### Real-Time Dashboard (`monitor_stats.sh`)

**Metrics Displayed:**
- 💾 Memory usage (free, used, available)
- 💿 Disk usage by partition
- ⚡ CPU load averages (1, 5, 15 minutes)
- 🔝 Top resource-consuming processes

**Example Output:**
```
═══════════════════════════════════════
   SYSTEM RESOURCE MONITOR
═══════════════════════════════════════
Memory Usage:
  Total: 8.0 GB
  Used:  4.2 GB (52%)
  Free:  3.8 GB

Disk Usage:
  /dev/sda1: 45% (120GB / 250GB)

CPU Load: 0.52, 0.48, 0.51

Top Processes:
  nginx    - 2.3% CPU
  mysql    - 1.8% CPU
═══════════════════════════════════════
```

---

## 🛠️ Tech Stack

- **OS**: Ubuntu/Debian Linux
- **Shell**: Bash scripting
- **Web Server**: Nginx
- **Firewall**: UFW (Uncomplicated Firewall)
- **Init System**: systemd
- **Monitoring**: Native Linux tools (free, df, ps, uptime)

---

## 🧠 Key Design Decisions

### Why Bash Over Ansible/Terraform?
- **Learning Value**: Understand low-level system administration
- **Zero Dependencies**: Works on any Linux system with Bash
- **Transparency**: See exactly what commands are executed
- **Foundation**: Learn fundamentals before abstraction layers

### Why SSH Hardening First?
- **Security Priority**: Secure the entry point before anything else
- **Industry Standard**: SSH is the primary attack vector
- **Defense in Depth**: Multiple layers (port change, key-only, no root)
- **Real-World Practice**: Production servers require this

### Why Nginx Over Apache?
- **Performance**: Event-driven architecture, lower memory footprint
- **Modern Standard**: Industry preference for new deployments
- **Configuration Simplicity**: Cleaner config file syntax
- **Reverse Proxy**: Better suited for modern microservices

### Why UFW Over iptables?
- **Simplicity**: Easier to understand and maintain
- **Safety**: Less error-prone than raw iptables
- **Sufficient**: Meets security needs for most applications
- **Beginner-Friendly**: Lower barrier to entry

### Why Separate Scripts?
- **Modularity**: Run only what you need
- **Testing**: Test each component independently
- **Flexibility**: Mix and match for different scenarios
- **Clarity**: Each script has a single, clear purpose

---

## 💡 What I Learned

### Technical Insights
- **Security is layers, not a single fix**: SSH hardening + firewall + key-auth = defense in depth
- **Automation prevents human error**: Manual config leads to inconsistencies and mistakes
- **Port changes reduce noise**: Moving SSH from 22 to 2222 eliminates 99% of brute-force attempts
- **Systemd is powerful**: Service management, logging, and dependency handling built-in

### DevOps Lessons
- **Infrastructure as Code works**: Reproducible environments save hours of debugging
- **Documentation is automation**: Well-commented scripts are self-documenting
- **Testing in VMs is essential**: Never test security scripts on production first
- **Idempotence matters**: Scripts should be safe to run multiple times

### Security Lessons
- **Default configs are insecure**: Root login, password auth, port 22 are all attack vectors
- **Least privilege principle**: Give minimum necessary permissions
- **Monitoring catches issues early**: Resource monitoring prevents outages
- **Backups before changes**: Always have a rollback plan

### Professional Growth
- **Linux fundamentals are timeless**: Cloud abstracts but doesn't eliminate these concepts
- **Bash is everywhere**: Every server has it, making it universally useful
- **Security isn't optional**: Legal and ethical obligations require it
- **Automation scales knowledge**: One good script helps hundreds of deployments

---

## 🎯 Use Cases

- **DevOps Engineers**: Server provisioning automation
- **System Administrators**: Security hardening templates
- **Backend Developers**: Local development environment setup
- **Students**: Learning Linux administration and Bash scripting
- **Startups**: Quick server deployment for MVPs

---

## 🔧 Customization

### Modify SSH Port
Edit `configs/sshd_hardened`:
```bash
Port 2222  # Change to your preferred port
```

### Adjust Nginx Configuration
Edit `configs/nginx_custom.conf`:
```nginx
worker_processes auto;
gzip_comp_level 6;  # Adjust compression level
```

### Add Monitoring Metrics
Extend `monitor_stats.sh`:
```bash
# Add network statistics
echo "Network Connections:"
netstat -an | grep ESTABLISHED | wc -l
```

---

## 🚀 Future Enhancements

- [ ] **Ansible Playbooks** - Port scripts to Ansible for multi-server deployment
- [ ] **Docker Support** - Containerize Nginx setup
- [ ] **SSL/TLS** - Automated Let's Encrypt certificate generation
- [ ] **Log Aggregation** - Centralized logging with ELK stack
- [ ] **Terraform Integration** - Cloud infrastructure provisioning
- [ ] **Prometheus Monitoring** - Advanced metrics collection

---

## 🤝 Contributing

Contributions are welcome! Ideas for contributions:

- Add support for other Linux distributions (CentOS, Arch, Fedora)
- Implement database server setup (MySQL, PostgreSQL)
- Add automated backup scripts
- Create monitoring alerts (email/Slack notifications)
- Add Docker/Kubernetes deployment scripts

**Steps to contribute:**
1. Fork the repository
2. Create a feature branch (`git checkout -b feature/DatabaseSetup`)
3. Test scripts in a VM or container
4. Commit changes (`git commit -m 'Add PostgreSQL setup script'`)
5. Push to branch (`git push origin feature/DatabaseSetup`)
6. Open a Pull Request

---

## ⚠️ Security Notice

**Important:**
- Always review scripts before running with sudo privileges
- Test in a VM or container before production use
- Backup SSH configuration before modifications
- Keep SSH keys secure and never commit them to version control
- Change default passwords and ports in production

---

## 📝 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

---

## 👨‍💻 Author

**Saad Arif**
- GitHub: [@Saad-Arif-20](https://github.com/Saad-Arif-20)
- Portfolio: [Your Portfolio URL]
- LinkedIn: [Your LinkedIn URL]

---

## 🙏 Acknowledgments

- **Linux Foundation** - For comprehensive Linux documentation
- **Nginx** - High-performance web server
- **Ubuntu Community** - Excellent server administration resources
- **DevOps Community** - Best practices and automation patterns

---

**Built with 🔧 and automation in mind** | © 2025 Saad Arif
