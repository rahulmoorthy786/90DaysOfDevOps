# Linux Commands Cheat Sheet

## Process Management
- **ps aufx**: Shows all running processes on the system.
- **top**: Display live system and process activity in real time.
- **htop**: Interactive and easier-to-read version of top.
- **kill PID**:	Stops a process using its Process ID.
- **pkill name**:	Stops a process using its name.
- **pgrep name**:	Finds the PID of a process by name.
- **jobs**:	Shows background jobs running in the current shell.
- **nohup command &**: Runs a command in the background even after logout.

## File System
- **pwd**:	Shows the current working directory path.
- **ls -l**:	Lists files and directories with details.
- **cd path**: Changes the current directory.
- **cp source dest**:	Copies files or directories.
- **mv source dest**:	Moves or renames files/directories.
- **rm -rf file**: Removes files or directories forcefully.
- **mkdir name**:	Creates a new directory.
- **cat file**:	Displays file contents on the screen.
- **grep text file**:	Searches for specific text inside a file.
- **find /path -name file**:	Searches for files and directories.
- **chmod 755 file**:	Changes file permissions.
- **chown user:group file**: Changes file ownership.
- **df -h**:	Shows overall disk space usage.
- **du -sch**: folder	Shows the size of a file or directory.

## Networking Troubleshooting
- **ip a**:	Displays network interfaces and IP addresses.
- **ping host**:	Checks network connectivity to another system.
- **curl URL**:	Tests and fetches data from a website or API.
- **wget URL**:	Downloads files from the internet.
- **ss -tulpn**:	Shows listening ports and active connections.
- **traceroute host**:	Shows the path packets take to reach a host.
- **nslookup domain**:	Finds the IP address of a domain.
- **dig domain**: Shows detailed DNS information like IP address, name servers, and DNS response details for a domain.
- **netstat -a**:	Displays network connections and ports.
- **host domain**: Shows DNS information for a domain.
- **whois domain**:	Displays domain registration details.
