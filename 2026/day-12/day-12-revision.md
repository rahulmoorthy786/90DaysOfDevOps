# Revision & Self-Check

# Review Summary

## 1. Mindset & Learning Plan Review

My goal for 2026 is to become a DevOps Engineer, and I’m steadily moving toward it with confidence. Through consistent learning, hands-on practice, and a strong focus on Linux, automation, and cloud technologies, I’m building the skills needed to achieve that goal.

---

# Processes & Services Review

## Commands Practiced

```bash
ps aux
systemctl status nginx
journalctl -u nginx --since "10 minutes ago"
```

## What I Observed

* `ps aux` shows all running processes and resource usage.
* `systemctl status nginx` shows whether the service is active or failed.
* `journalctl -u nginx` helps troubleshoot service issues using logs.

---

# File Skills Practice

## Commands Practiced

```bash
echo "Linux revision practice" >> notes.txt

chmod 644 notes.txt

ls -l notes.txt

mkdir practice-dir

cp notes.txt practice-dir/
```

## What I Practiced

* Appending text into files
* Changing file permissions
* Viewing permissions with `ls -l`
* Creating directories
* Copying files

---

# Cheat Sheet Refresh

## 5 Commands I’d Use First During an Incident

```bash
top
ps aux
systemctl status <service>
journalctl -xe
df -h
```

## Why These Commands Matter

* `top` → Check CPU and memory usage
* `ps aux` → Find running or stuck processes
* `systemctl status` → Check service health
* `journalctl -xe` → Investigate recent errors
* `df -h` → Check disk space issues

---

# User & Group Sanity Practice

## Scenario Practiced

```bash
sudo useradd demo-user

touch demo-file.txt

sudo chown demo-user:demo-user demo-file.txt

ls -l demo-file.txt

id demo-user
```

## Verification

* Confirmed ownership changed successfully.
* Verified user details using `id`.

---

# Mini Self-Check

## 1. Which 3 commands save you the most time right now, and why?

### Commands

```bash
ls -l
journalctl
systemctl status
```

### Why

* `ls -l` quickly shows permissions and ownership.
* `journalctl` helps identify errors from logs.
* `systemctl status` instantly shows service health.

---

## 2. How do you check if a service is healthy?

### Commands I Run First

```bash
systemctl status nginx

journalctl -u nginx --since "15 minutes ago"

ps aux | grep nginx
```

### Purpose

* Check if service is active
* Review logs for failures
* Verify running processes

---

## 3. How do you safely change ownership and permissions without breaking access?

### Example

```bash
sudo chown ubuntu:developers app.conf

chmod 640 app.conf
```

### Explanation

* Change ownership carefully using `chown`
* Apply minimum required permissions using `chmod`

---

## 4. What will you focus on improving in the next 3 days?

* Linux troubleshooting
* Service monitoring
* AWS EC2 practice
* Nginx configuration
* File permissions and security
* Writing better documentation

---

# Key Takeaways

* Logs are extremely important for troubleshooting.
* Permissions and ownership directly affect system security.
* Repeating small hands-on tasks improves confidence faster than only reading documentation.
