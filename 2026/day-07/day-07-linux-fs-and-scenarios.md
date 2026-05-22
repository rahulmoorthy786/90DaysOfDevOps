# Linux File System Hierarchy & Scenario-Based Practice

## Objective

Today's goal is to understand the Linux File System Hierarchy and practice real-world troubleshooting scenarios like a DevOps Engineer.

---

# Part 1 - Linux File System Hierarchy

## 1. `/` (Root Directory)

### Purpose
The root directory (`/`) is the starting point of the Linux file system. Everything in Linux begins from this directory.

### Command
```bash
ls -l /
```

### Files/Folders Observed
- etc
- home
- var

### I would use this when...
I need to navigate the entire Linux file system or troubleshoot system-level issues.

---

## 2. `/home`

### Purpose
The `/home` directory contains personal directories for normal users.

### Command
```bash
ls -l /home
```

### Files/Folders Observed
- ubuntu
- user

### I would use this when...
I need to access user files, scripts, or personal configurations.

---

## 3. `/root`

### Purpose
The `/root` directory is the home directory for the root user (administrator).

### Command
```bash
ls -l /root
```

### Files/Folders Observed
- .bashrc
- scripts

### I would use this when...
I am logged in as root and need to manage administrative tasks.

---

## 4. `/etc`

### Purpose
The `/etc` directory stores system-wide configuration files.

### Command
```bash
ls -l /etc
```

### Files/Folders Observed
- hostname
- ssh

### I would use this when...
I need to configure services, networking, users, or system settings.

---

## 5. `/var/log`

### Purpose
The `/var/log` directory stores system and application log files.

### Command
```bash
ls -l /var/log
```

### Files/Folders Observed
- syslog
- auth.log

### I would use this when...
I need to troubleshoot services, applications, or system issues.

---

## 6. `/tmp`

### Purpose
The `/tmp` directory stores temporary files created by applications and users.

### Command
```bash
ls -l /tmp
```

### Files/Folders Observed
- systemd-private-*
- temp files

### I would use this when...
Applications need temporary storage during execution.

---

## 7. `/bin`

### Purpose
The `/bin` directory contains essential Linux command binaries.

### Command
```bash
ls -l /bin
```

### Files/Folders Observed
- ls
- cp

### I would use this when...
I need access to basic Linux commands required for system operation.

---

## 8. `/usr/bin`

### Purpose
The `/usr/bin` directory contains additional user command binaries and applications.

### Command
```bash
ls -l /usr/bin
```

### Files/Folders Observed
- python3
- vim

### I would use this when...
I need to run installed applications or utilities.

---

## 9. `/opt`

### Purpose
The `/opt` directory is used for optional or third-party software installations.

### Command
```bash
ls -l /opt
```

### Files/Folders Observed
- custom applications
- third-party packages

### I would use this when...
Installing external applications like Google Chrome, Splunk, or custom software.

---

# Hands-On Tasks

## Find the Largest Log Files

### Command
```bash
du -sh /var/log/* 2>/dev/null | sort -h | tail -5
```

### Observation
This command displays the top 5 largest log files or directories inside `/var/log`.

- /var/log/auth.log
- /var/log/cloud-init.log
- /var/log/syslog
- /var/log/sysstat
- /var/log/journal

---

## View Hostname Configuration

### Command
```bash
cat /etc/hostname
```

### Observation
This file stores the hostname of the Linux server.

---

## Check Home Directory Contents

### Command
```bash
ls -la ~
```

### Observation
This command lists hidden and visible files in the current user's home directory.

---

# Part 2 - Scenario-Based Practice

# Scenario 1 - Service Not Starting

### Problem
A web application service called `myapp` failed to start after a reboot.

---

### Step 1

#### Command
```bash
systemctl status myapp
```

#### Why
To check whether the service is running, failed, or inactive.

---

### Step 2

#### Command
```bash
journalctl -u myapp -n 50
```

#### Why
To view the last 50 lines of logs for the service and identify the error.

---

### Step 3

#### Command
```bash
systemctl is-enabled myapp
```

#### Why
To verify whether the service is enabled during boot.

---

### Step 4

#### Command
```bash
systemctl list-units --type=service | grep myapp
```

#### Why
To confirm that the service exists and is recognized by systemd.

---

### What I Learned
Always check the service status first, then investigate logs and boot configuration.

---

# Scenario 2 - High CPU Usage

### Problem
The application server is slow, and CPU usage is suspected to be high.

---

### Step 1

#### Command
```bash
top
```

#### Why
To monitor live CPU and memory usage.

---

### Step 2

#### Command
```bash
ps aux --sort=-%cpu | head -10
```

#### Why
To list the top CPU-consuming processes.

---

### Step 3

#### Command
```bash
htop
```

#### Why
To get an interactive and user-friendly view of running processes.

---

### Step 4

#### Command
```bash
pidstat 1
```

#### Why
To monitor CPU usage of processes continuously.

---

### What I Learned
High CPU troubleshooting starts by identifying the process consuming resources.

---

# Scenario 3 - Finding Service Logs

### Problem
A developer wants to check logs for the Docker service.

---

### Step 1

#### Command
```bash
systemctl status docker
```

#### Why
To check the service status and recent logs.

---

### Step 2

#### Command
```bash
journalctl -u docker -n 50
```

#### Why
To view the latest 50 log entries for Docker.

---

### Step 3

#### Command
```bash
journalctl -u docker -f
```

#### Why
To follow Docker logs in real time.

---

### Step 4

#### Command
```bash
journalctl -xe
```

#### Why
To investigate detailed system errors and service-related issues.

---

### What I Learned
Systemd-managed services store logs in journald, accessible using `journalctl`.

---

# Scenario 4 - File Permission Issue

### Problem
A script called `backup.sh` shows "Permission denied" when executed.

---

### Step 1

#### Command
```bash
ls -l /home/user/backup.sh
```

#### Why
To check the current file permissions.

---

### Step 2

#### Command
```bash
chmod +x /home/user/backup.sh
```

#### Why
To add execute permission to the script.

---

### Step 3

#### Command
```bash
ls -l /home/user/backup.sh
```

#### Why
To verify that execute permission was added successfully.

---

### Step 4

#### Command
```bash
./backup.sh
```

#### Why
To test whether the script executes correctly.

---

### What I Learned
Linux files require executable permissions to run scripts.

---

These skills are essential for Linux Administration, DevOps, and real-world production troubleshooting.
