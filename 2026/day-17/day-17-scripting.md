# Shell Scripting: Loops, Arguments & Error Handling

## Challenge Tasks

### Task 1: For Loop
1. Create `for_loop.sh` that:
   - Loops through a list of 5 fruits and prints each one
     
[View for_loop.sh](day-17/scripts/for_loop.sh)

 <img width="475" height="110" alt="image" src="https://github.com/user-attachments/assets/80002c8e-d00b-4c6b-a6bf-99a4ea908aab" />
 
  
2. Create `count.sh` that:
   - Prints numbers 1 to 10 using a for loop

[View count.sh](day-17/scripts/count.sh)

<img width="438" height="209" alt="image" src="https://github.com/user-attachments/assets/7d99fd03-6f21-47a3-a1c7-0f932e0ceace" />

---

### Task 2: While Loop
1. Create `countdown.sh` that:
   - Takes a number from the user
   - Counts down to 0 using a while loop
   - Prints "Done!" at the end

[View countdown.sh](day-17/scripts/countdown.sh)

<img width="489" height="425" alt="image" src="https://github.com/user-attachments/assets/1ef185f9-ba17-4dce-910a-703c7a20ce0c" />


---

### Task 3: Command-Line Arguments
1. Create `greet.sh` that:
   - Accepts a name as `$1`
   - Prints `Hello, <name>!`
   - If no argument is passed, prints "Usage: ./greet.sh <name>"

[View greet.sh](day-17/scripts/greet.sh)

<img width="504" height="115" alt="image" src="https://github.com/user-attachments/assets/c97ed4e1-0562-440c-894e-6fb24e2396ea" />


2. Create `args_demo.sh` that:
   - Prints total number of arguments (`$#`)
   - Prints all arguments (`$@`)
   - Prints the script name (`$0`)
     
[View args_demo.sh](day-17/scripts/args_demo.sh)

<img width="677" height="234" alt="image" src="https://github.com/user-attachments/assets/39ca9404-0704-4fe0-9da7-44a328524459" />


---

### Task 4: Install Packages via Script
1. Create `install_packages.sh` that:
   - Defines a list of packages: `nginx`, `curl`, `wget`
   - Loops through the list
   - Checks if each package is installed (use `dpkg -s` or `rpm -q`)
   - Installs it if missing, skips if already present
   - Prints status for each package

[View install_packages.sh](day-17/scripts/install_packages.sh)

<img width="649" height="243" alt="image" src="https://github.com/user-attachments/assets/804ca572-b3dc-4562-bf89-cbc034e9744a" />


---

### Task 5: Error Handling
1. Create `safe_script.sh` that:
   - Uses `set -e` at the top (exit on error)
   - Tries to create a directory `/tmp/devops-test`
   - Tries to navigate into it
   - Creates a file inside
   - Uses `||` operator to print an error if any step fails

[View safe_script.sh](day-17/scripts/safe_script.sh)

<img width="596" height="217" alt="image" src="https://github.com/user-attachments/assets/8ce505c1-cb35-4a78-8423-5ac40dc07797" />


2. Modify your `install_packages.sh` to check if the script is being run as root — exit with a message if not.

[View modify_install_packages.sh](day-17/scripts/modify_install_packages.sh)

<img width="642" height="377" alt="image" src="https://github.com/user-attachments/assets/0db781ee-3e89-4190-bb48-8b01085a7f40" />
