# Linux fundamentals with real commands

## Processes Commands:

`ps -eo pid,comm,%cpu,%mem --sort=-%cpu | head -n 6`  
- Lists the top 5 processes using the highest CPU, along with PID, command name, CPU usage, and memory usage.  

<img width="629" height="142" alt="image" src="https://github.com/user-attachments/assets/91c35d6a-83aa-46d9-914b-62674df4390c" />


`top -b -n 1 | grep nginx`  
- Displays nginx process information from a non-interactive top command output.  

<img width="621" height="94" alt="image" src="https://github.com/user-attachments/assets/cef791bc-edba-4cd4-99c9-95d2afb2e8ec" />

`pgrep -x cron`  
- Returns the PID of the exact process name `cron`.  

<img width="415" height="63" alt="image" src="https://github.com/user-attachments/assets/e1c49669-7a3a-411d-9e2c-8c713f468b28" />

`pgrep -lx cron`  
- Returns both the PID and process name for `cron`. 

<img width="390" height="66" alt="image" src="https://github.com/user-attachments/assets/6d1e77fc-dac1-49e1-9cb6-25d4ccf06c59" />

---

# Service Commands

`systemctl status nginx`  
- Displays the current status of the nginx service.  

<img width="1046" height="322" alt="image" src="https://github.com/user-attachments/assets/ec75c3e9-f4be-4ad5-a950-4689283dde5a" />


`sudo systemctl list-units --type=service --state=running | head -n 20`  
- Lists the first 20 running system services.  

<img width="1089" height="354" alt="image" src="https://github.com/user-attachments/assets/620b0233-4f11-49bc-b635-3b2f32f74528" />

---

# Log Commands

`journalctl -u dmesg | tail -20`  
- Displays the last 20 log entries for the dmesg service.  

<img width="905" height="566" alt="image" src="https://github.com/user-attachments/assets/ae73ca84-f9b2-4f05-9019-b68552b72d28" />


`tail -50 /var/log/dmesg`  
- Shows the last 50 kernel and system boot log messages.  

<img width="1102" height="455" alt="image" src="https://github.com/user-attachments/assets/593e1e1f-ed52-451a-99d5-a3dba7338482" />

---

# Service Inspection Example (Docker)

`sudo docker ps`  
- Lists currently running Docker containers. But getting an error.   

<img width="800" height="76" alt="image" src="https://github.com/user-attachments/assets/56b42d95-b478-4242-b530-333e360fca83" />

`journalctl -u docker | tail -20`  
- Checks recent Docker service logs for errors or events.  

<img width="1108" height="338" alt="image" src="https://github.com/user-attachments/assets/642b36b4-95a7-4ae2-a0e3-d583c2d0f636" />

- Logs show the Docker service was stopped. Let's start the service and verify again.  

<img width="1108" height="360" alt="image" src="https://github.com/user-attachments/assets/43e30bfe-3f12-4808-949f-ffd599171a9e" />

`systemctl start docker`  
- Starts the Docker service.  

<img width="1115" height="403" alt="image" src="https://github.com/user-attachments/assets/6cdca358-59ab-40a2-be1a-ec4f4cc9c9cc" />

`sudo docker ps`  
- Verifies running Docker containers after starting the service.  

<img width="620" height="56" alt="image" src="https://github.com/user-attachments/assets/efd08fd1-d65e-4270-92b0-a36972adf275" />


