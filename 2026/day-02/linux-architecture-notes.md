# Core components of Linux: 
- **Kernel**: The core component of the Linux operating system that acts as a bridge between hardware and software. It manages **CPU**, **memory**, **devices**, and running processes.
**In short**,the kernel is the brain of Linux that controls hardware and system operations.
- **Shell**: It’s the interface that lets users talk to the Linux system by typing commands. It takes your input, passes it to the kernel, and shows the output back to you.
- **System Libraries**: These are pre-written functions that applications use to interact with the kernel, so programs don’t need to talk to the kernel directly.
- **System Utilities**: Programs and tools like **ls**, **cp**, **mv**, **cat**, **echo**, **grep** that perform specific system tasks such as managing files, viewing content, handling text, users, and other basic system operations.
- **File System**: The way Linux organizes and stores data on disk. It manages files and directories, controls how data is saved, retrieved, and structured in a hierarchy starting from the root (/). 

# Processes in Linux:
Processes in Linux are created and managed by the kernel. When a process is created, the system typically uses fork() to create a copy of an existing process, and then exec() to replace it with a new program. Every process gets a unique Process ID (PID).
- Tracking state (running, sleeping, stopped)
- Handling priorities
- Managing memory and resources

## What is systemd? Why does it matter?
- systemd is the init system in most modern Linux distributions. It is the first process (PID 1) that starts when the system boots.
It is responsible for:
- Starting and stopping system services (like web servers, SSH, database services)
- Monitoring and restarting services if they fail

## Process State
- **running (R)**: The process is currently executing. Active process.
- **sleeping (S)**: The process is waiting for an event or resource (like I/O, input, or signal). It’s not using the CPU while waiting, and wakes up instantly when a signal arrives.. 
- **Uninterruptible Sleep (D)**: The process is waiting for critical I/O (like disk/network). It cannot be interrupted until the operation completes. Can not be killed. The kernel prevents the process from receiving any signals
- **Stooped (T)**: The process has been paused, usually by a signal like SIGSTOP (via Ctrl + Z) or SIGTSTP. It remains frozen in memory and can be resumed later by a SIGCONT signal
- **Zombie (Z)**: The process has finished execution, but its entry still exists in the process table because the parent hasn’t read its exit status yet.

# 5 Commands for daily use:
- **df/free/du**: df Shows disk space usage of mounted filesystems (how much disk is used and available). free (how much disk is used and available). du Shows disk usage of files and directories, useful for finding which folders are consuming space.
- **chmod/chown**: Used to change file permissions (chmod) and file ownership (chown)
- **cp/mv**: (cp) is used to copy files, and (mv) is used to move/rename files and directories.
- **systemctl**: Used to manage system services like start, stop, restart, and check status.
- **ps/top**: Used to view running processes (ps for snapshot, top for real-time view).
