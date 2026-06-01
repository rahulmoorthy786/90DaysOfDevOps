# Shell Scripting Basics

### Task 1: Your First Script

1. Create a file `hello.sh`
2. Add the shebang line `#!/bin/bash` at the top
3. Print `Hello, DevOps!` using `echo`
4. Make it executable and run it

[View hello.sh](day-16/Script/hello.sh)

<img width="571" height="508" alt="image" src="https://github.com/user-attachments/assets/1e28da12-683f-4172-9057-9f01a1c2be02" />

  
- What happens if you remove the shebang line?
    - Even after removing the shebang (`#!/bin/bash`), the script executed successfully because it was run from a Bash shell. Normally, when a script without a shebang is executed directly, Linux cannot determine which interpreter to use and returns an "Exec format error". However, Bash catches this and automatically interprets the script itself. Since the script only contained a simple `echo` command, it ran successfully without any errors.
    
--- 

### Task 2: Variables

1. Create `variables.sh` with:
   - A variable for your `NAME`
   - A variable for your `ROLE` (e.g., "DevOps Engineer")
   - Print: `Hello, I am <NAME> and I am a <ROLE>`
2. Try using single quotes vs double quotes — what's the difference?
   - Double quotes ("): Bash replaces variables with their values.
   - Single quotes ('): Bash prints everything exactly as written, without expanding variables.

That's why double quotes are typically used when you want to display variable values in shell scripts.

[View variables.sh](day-16/Script/variables.sh)


<img width="482" height="135" alt="image" src="https://github.com/user-attachments/assets/620ce751-ebdb-4ac8-a654-9923b435e2b4" />

---

### Task 3: User Input with read

1. Create `greet.sh` that:
   - Asks the user for their name using `read`
   - Asks for their favourite tool
   - Prints: `Hello <name>, your favourite tool is <tool>`

[View greet.sh](day-16/Script/greet.sh)


<img width="476" height="107" alt="image" src="https://github.com/user-attachments/assets/a34753d7-a2f5-4476-9c07-8a329cc37aee" />

---
   
### Task 4: If-Else Conditions

1. Create `check_number.sh` that:
   - Takes a number using `read`
   - Prints whether it is **positive**, **negative**, or **zero**

[View check_number.sh](day-16/Script/check_number.sh)

 <img width="549" height="269" alt="image" src="https://github.com/user-attachments/assets/05a4bf35-722f-46b6-9b7d-93c552ee9aca" />


 2. Create `file_check.sh` that:
   - Asks for a filename
   - Checks if the file **exists** using `-f`
   - Prints appropriate message
     
[View file_check.sh](day-16/Script/file_check.sh)

<img width="507" height="160" alt="image" src="https://github.com/user-attachments/assets/c2d117c2-45e6-4ec3-8dba-4045ea5372dd" />

---

### Task 5: Combine It All

Create `server_check.sh` that:

1. Stores a service name in a variable (e.g., `nginx`, `sshd`)
2. Asks the user: "Do you want to check the status? (y/n)"
3. If `y` — runs `systemctl status <service>` and prints whether it's **active** or **not**
4. If `n` — prints "Skipped."

[View file_check.sh](day-16/Script/server_check.sh)

<img width="531" height="341" alt="image" src="https://github.com/user-attachments/assets/1d113316-6e58-4cbe-8419-f6789899fe15" />

   
