# User And Group Management

## Create users and set passwords

- **Command:** `useradd -m -s /bin/bash username` 
- **Command:** `passwd username`

<img width="647" height="90" alt="image" src="https://github.com/user-attachments/assets/9f8832ca-1171-4a3d-a5ea-0bcfcd2d0782" />

<img width="340" height="47" alt="image" src="https://github.com/user-attachments/assets/60f0d25f-a6c4-4622-816e-30c68785a3f2" />


- User added tokyo, berlin, professor

---

## Create Group

- **Command:** `groupadd groupname`

<img width="649" height="46" alt="image" src="https://github.com/user-attachments/assets/71c07a10-6d0b-424d-9546-7a5aa2cb83e4" />

- Groups: developers, admins

## Group Assignment

- **Command:** `usermod -aG group username`

<img width="589" height="81" alt="image" src="https://github.com/user-attachments/assets/65d33952-7208-4b88-a058-15e64b0570d8" />


## Home Directory For Users

<img width="522" height="157" alt="image" src="https://github.com/user-attachments/assets/280c9d80-418a-4df3-92ea-763af199d657" />

---

## Shared Directory

- Create directory: /opt/dev-project
- Set group owner to developers
- Set permissions to 775 (drwxrwxr-x)
- Test by creating files for Tokyo and Berlin (refer to the screenshot below)

<img width="549" height="238" alt="image" src="https://github.com/user-attachments/assets/f6f23b5d-6c59-47f2-af79-25fe959cea91" />

<img width="473" height="102" alt="image" src="https://github.com/user-attachments/assets/499bf685-5066-4292-9c61-e2830cc7024f" />

<img width="691" height="272" alt="image" src="https://github.com/user-attachments/assets/74802585-199c-4b2f-871d-e94cab8092c3" />

<img width="744" height="445" alt="image" src="https://github.com/user-attachments/assets/5e6f10bd-620b-43c3-9610-be5e24e5dc62" />

---

## Team Workspace

Use the commands below for the Task

- Command: `sudo useradd -m -s /bin/bash nairobi`
- Command: `sudo passwd nairobi`
- Command: `sudo groupadd project-team`
- Command: `sudo usermod -aG project-team nairobi`
- Command: `sudo usermod -aG project-team tokyo`

<img width="500" height="538" alt="image" src="https://github.com/user-attachments/assets/164b31df-c634-4a26-b64d-3f780770a572" />

<img width="792" height="125" alt="image" src="https://github.com/user-attachments/assets/b095b119-af9f-4e9a-a0ad-bf52dcda37a7" />


---

# Linux Users, Groups & Permissions Lab

## Users & Groups Created

### Users
- tokyo
- berlin
- professor
- nairobi

### Groups
- developers
- admins
- project-team

---

# Group Assignments

| User | Groups |
|------|---------|
| tokyo | developers, project-team |
| berlin | developers, admins |
| professor | admins |
| nairobi | project-team |

---

# Directories Created

| Directory | Group Owner | Permissions |
|-----------|-------------|-------------|
| /opt/dev-project | developers | 775 |
| /opt/team-workspace | project-team | 775 |

---

# Commands Used

## Create Groups

```bash
sudo groupadd developers
sudo groupadd admins
sudo groupadd project-team
```

---

# What I learned

- Linux users and groups can be managed using `useradd`, `groupadd`, and `usermod`.
- Shared collaboration directories can be managed using Linux group permissions.
- `chmod`, `chgrp`, and `chown` are used for managing permissions and ownership of files/directories.
- Users do not need `sudo` if proper group permissions are configured.
- Group-based access control is commonly used in real Linux server administration and DevOps environments.

