# Linux System Administration & Network Services Lab

A collection of **Infrastructure as Code (IaC)** scripts and configuration files demonstrating professional Linux system administration, security hardening, and service provisioning.

## Project Overview

This project simulates the setup of a production-grade Linux server (Ubuntu/Debian). Instead of manually typing commands, it uses **Bash scripting** to automate the provisioning process, ensuring reproducibility and consistency.

### Key Objectives
- **System Hardening**: Securing SSH, managing users, and configuring firewalls (UFW).
- **Service Management**: Installing and optimizing a Web Server (Nginx).
- **Monitoring**: Creating custom CLI tools to track system resources.
- **Automation**: Replacing manual config edits with script-based deployment.

---

## Project Structure

```
/linux-network-lab
 ├── scripts/              # Automation Scripts (Bash)
 │   ├── system_prep.sh    # User setup & Updates
 │   ├── setup_web.sh      # Nginx & Firewall Install
 │   └── monitor_stats.sh  # Resource Monitoring Dashboard
 ├── configs/              # Best-Practice Configurations
 │   ├── nginx_custom.conf # Optimized Web Server Config
 │   └── sshd_hardened     # Secure SSH Config
 ├── screenshots/          # Evidence of execution
 └── README.md             # Documentation
```

---

## Technical Implementation

### 1. Security First (System Hardening)
The `system_prep.sh` script implements industry standard security measures:
- **Root Login Disabled**: Prevents direct root access via SSH.
- **Custom SSH Port**: Changes port 22 to 2222 to reduce brute-force noise.
- **Key-Based Auth**: Disables password authentication entirely.
- **Firewall (UFW)**: Explicitly allows only required ports (2222, 80, 443).

### 2. High-Performance Web Server (Nginx)
The `setup_web.sh` script automates the full web stack deployment:
- Installs Nginx package.
- Deploys a custom configuration (`nginx_custom.conf`) that includes:
    - **Gzip Compression**: Reduces bandwidth usage.
    - **Security Headers**: Adds X-Frame-Options and X-XSS-Protection.
    - **Access Logging**: centralizes logs for audit trails.

### 3. Monitoring & Operations
The `monitor_stats.sh` script creates a real-time dashboard in the terminal showing:
- **Memory & Disk Usage** (using `free` and `df`).
- **CPU Load Averages** (using `uptime`).
- **Top Resource Hogs** (using `ps` and `awk`).

---

## Quick Start Guide

### Prerequisites
- A Linux environment (Ubuntu/Debian recommended) or **WSL (Windows Subsystem for Linux)**.
- Root/Sudo privileges.

### Usage

1. **Clone the Repository**
   ```bash
   git clone https://github.com/yourusername/linux-network-lab.git
   cd linux-network-lab/scripts
   ```

2. **Run System Prep** (Caution: Changes SSH Port)
   ```bash
   chmod +x system_prep.sh
   sudo ./system_prep.sh
   # Note: Next SSH login will require -p 2222
   ```

3. **Deploy Web Server**
   ```bash
   chmod +x setup_web.sh
   sudo ./setup_web.sh
   # Visit http://localhost to see the site
   ```

4. **Monitor System Health**
   ```bash
   chmod +x monitor_stats.sh
   ./monitor_stats.sh
   ```

---

## Learning Context & Academic Alignment

This project demonstrates applied understanding of key operating systems and networking concepts:

| Outcome | Implementation Evidence |
| :--- | :--- |
| **Shell Scripting** | Extensive use of Bash variables, loops, and conditionals. |
| **Process Management** | Scripts to start/stop/restart Systemd services. |
| **Network Configuration** | Understanding of Ports, TCP/IP, and Firewalls. |
| **System Security** | Implementation of Least Privilege Principle (Sudo vs Root). |

**Related Concepts**:
*   Operating systems fundamentals
*   Network administration
*   System security practices

---

## Security Notice

**DO NOT RUN** `system_prep.sh` on a production server without reviewing the commands first. It modifies `sshd_config` which could lock you out if you don't have SSH keys configured properly.

---

## Future Improvements

1.  **Ansible/Terraform**: Port these Bash scripts to professional provisioners.
2.  **Containerization**: Convert the Nginx setup into a `Dockerfile`.
3.  **SSL/TLS**: Automate Let's Encrypt certificate generation with Certbot.

---

## License
MIT License.

**Author**: SAAD ARIF
**Year**: 2024
