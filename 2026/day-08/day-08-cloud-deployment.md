# Deploy a real web server on the cloud

- Step 1: Launch a cloud instance from AWS.
  
- Step 2: Connecting to instances via SSH using the below command
  **Command**: `ssh -i "test-server-key.pem" ubuntu@ec2-52-27-96-206.us-west-2.compute.amazonaws.com`
  
- Step 3: Install nginx using the commands mentioned below.
  **Command**: `sudo apt update && sudo apt install nginx`

- Step 4: Save logs to a file.
   **Command**: `scp  -i "test-server-key.pem" ubuntu@ec2-52-27-96-206.us-west-2.compute.amazonaws.com:~/nginx-logs.txt .`

- Step 5: Verified webpage is accessible from the internet
  
   <img width="842" height="591" alt="image" src="https://github.com/user-attachments/assets/93a101eb-49ac-4399-8cc1-474bb88d61e8" />

---

## Install Docker

Install Docker using the command `sudo apt install docker.io` 

---

# Challenges Faced
- My custom HTML page was not loading on the webpage.
  
- **Solution**: I reloaded the Nginx service. After reloading, my aboutme.html page was accessible.

- File permissions issue when accessing logs.

- **Solution**: Needed sudo to read /var/log/nginx/access.log.

---

# What I learned
- Connected to an AWS EC2 instance securely using SSH for remote administration and troubleshooting.
- Managed AWS Security Groups by configuring inbound rules to control access to services such as SSH and HTTP/HTTPS.
- Installed and configured Nginx on a Linux server and successfully hosted a webpage.
- Understood the importance of reloading/restarting services after configuration changes or when deploying new files to apply updates correctly.
- Transferred files securely between the EC2 instance and the local machine using SCP.
- Gained clarity on Nginx logging: `journalctl -u nginx` is used for service-level logs, while HTTP request logs are stored in `/var/log/nginx/access.log`.
