# Linux Troubleshooting Drill: CPU, Memory, and Logs

## Environment basics

- Command: `uname -a`
<img width="859" height="55" alt="image" src="https://github.com/user-attachments/assets/5d6e793d-9cdf-403f-8a59-233455c01d11" />

Displays complete system information, including the Linux kernel name, hostname, kernel version, architecture, and operating system details.

- Command: `lsb_release -a`

<img width="323" height="117" alt="image" src="https://github.com/user-attachments/assets/821b30e5-f2e5-42f2-9fa6-5c307e0f8ee0" />

It tells you which Linux OS you are using and its exact version information (e.g., Ubuntu 26.04 LTS, Debian version, etc.).

---

## Filesystem sanity

- Command:  `mkdir /tmp/runbook-demo`

<img width="420" height="50" alt="image" src="https://github.com/user-attachments/assets/1f388d2e-3aa8-4413-a08a-2a5b2a053a5d" />

Creates a directory runbook-demo under /tmp

- Command: `cp /etc/hosts /tmp/runbook-demo/hosts-copy && ls -l /tmp/runbook-demo`
<img width="767" height="127" alt="image" src="https://github.com/user-attachments/assets/93bc9f69-d61a-42c6-afc9-565c6b4b47a8" />

  copies /etc/hosts into it as hosts-copy, and then lists the detailed contents of that directory.

---  

## CPU & Memory

- Command: `ps -o pid,pcpu,pmem,comm -p $(pidof nginx)`

<img width="548" height="98" alt="image" src="https://github.com/user-attachments/assets/decdad35-8a7c-4556-8124-8b8a27420044" />

Displays the CPU and memory usage of all running nginx processes along with their PID and command name.

- Command: `free -h | awk 'NR==2 {print "Available Memory: " $4 " / Total: " $2 " / Used Memory: " $3}'`

<img width="952" height="59" alt="image" src="https://github.com/user-attachments/assets/a091ee82-ce36-439c-afb6-da6dba8046ba" />

Shows Available memory, Used memory, and Total Memory

---

## Disk & IO

- Command: `df -h / | awk 'NR==2 {print "Available Space:", $4, "| Used:", $3, "| Usage:", $5}'`

<img width="889" height="58" alt="image" src="https://github.com/user-attachments/assets/dedeee9d-fe8a-4892-bf44-3bd5bb19060c" />

The command shows disk usage along with available and used  space of `/` 

- Command: `iostat`

<img width="777" height="224" alt="image" src="https://github.com/user-attachments/assets/7d29db74-e7ea-40d2-bdba-09f792819914" />

 The iostat command displays CPU usage and disk I/O statistics, and this output shows the system is mostly idle with low read/write activity on the nvme0n1 storage device.

---

## Network

- Command: `ss -tulpn  | grep nginx`

<img width="1109" height="104" alt="image" src="https://github.com/user-attachments/assets/d777cf7f-bda7-4864-ae13-d4b0df8869d9" />

The command checks active listening ports for nginx, and the output shows nginx is listening on port 80 (HTTP) for both IPv4 and IPv6 connections.

- Command:  `curl -I https://whois.com`

<img width="512" height="173" alt="image" src="https://github.com/user-attachments/assets/a73872af-f929-417f-8407-bf5d99b143ac" />

The command sends an HTTP HEAD request to whois.com, and the output shows the website is reachable and redirects traffic to https://www.whois.com/ with an HTTP 301 status.  

---

## Logs reviewed

- Command: `journalctl -u nginx -n 50`

<img width="1039" height="121" alt="image" src="https://github.com/user-attachments/assets/a0e337c7-abf0-4685-9cf4-9eec293d6c5e" />

Displays the last 50 log entries for the nginx service, helping you review recent events, errors, warnings, or service activity.

- Command: `tail -n 50 /var/log/auth.log`

<img width="1104" height="77" alt="image" src="https://github.com/user-attachments/assets/59540f6f-b3b8-4be0-a4a0-7e84c309ea55" />

Displays the last 50 lines of the authentication log, helping you review recent login attempts, SSH access, sudo usage, and authentication-related events.

---

## Quick findings

- Disk and memory usage are within normal limits.
- Network port 22 (SSH) is open and accepting connections normally.
- SSH service is running properly with low CPU usage.
- No errors or abnormal activity were found in the logs.

## If this worsens

- Check overall server health, including top CPU, memory, and service usage.
- Check active network connections using netstat or ss, especially for abnormal SYN connections or spikes.
- Check disk usage and inode availability to ensure the server is not running out of space.
- Review service and system logs to identify specific errors, warnings, or unusual activity.
- Verify the affected service status and confirm whether it is responding correctly.
- Restart the affected service if required.
- Monitor the server again after restarting to confirm the issue is resolved and resources return to normal.
