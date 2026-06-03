# Shell Scripting: Functions & intermediate Concepts

## Tasks

### Task 1: Basic Functions
1. Create `functions.sh` with:
   - A function `greet` that takes a name as argument and prints `Hello, <name>!`
   - A function `add` that takes two numbers and prints their sum
   - Call both functions from the script

[View functions.sh](scripts/functions.sh)

<img width="505" height="109" alt="image" src="https://github.com/user-attachments/assets/23157271-f1e5-4de2-9a04-e841aa8d4979" />

---

### Task 2: Functions with Return Values
1. Create `disk_check.sh` with:
   - A function `check_disk` that checks disk usage of `/` using `df -h`
   - A function `check_memory` that checks free memory using `free -h`
   - A main section that calls both and prints the results

[View disk_check.sh](scripts/disk_check.sh)

<img width="510" height="116" alt="image" src="https://github.com/user-attachments/assets/a7afa7cb-1876-4f5f-87ff-1aa9114b0d9b" />

---

### Task 3: Strict Mode — `set -euo pipefail`
1. Create `strict_demo.sh` with `set -euo pipefail` at the top
2. Try using an **undefined variable** — what happens with `set -u`?
3. Try a command that **fails** — what happens with `set -e`?
4. Try a **piped command** where one part fails — what happens with `set -o pipefail`?

**Document:** What does each flag do?
- `set -e` → Stops the script immediately if any command fails.
- `set -u` → Stops the script if it references an undefined variable.
- `set -o pipefail` → Causes a pipeline to fail if any command inside it fails, not just the last one.

[View strict_demo.sh](scripts/strict_demo.sh)

<img width="545" height="353" alt="image" src="https://github.com/user-attachments/assets/25ef6710-e7e6-4f10-b129-1f2f9d535fda" />

---

### Task 4: Local Variables
1. Create `local_demo.sh` with:
   - A function that uses `local` keyword for variables
   - Show that `local` variables don't leak outside the function
   - Compare with a function that uses regular variables
     
[View local_demo.sh](scripts/local_demo.sh)

<img width="501" height="110" alt="image" src="https://github.com/user-attachments/assets/14ddb9d8-61b6-4d91-8fd9-cdb4e93c1194" />

---

### Task 5: Build a Script — System Info Reporter
Create `system_info.sh` that uses functions for everything:
1. A function to print **hostname and OS info**
2. A function to print **uptime**
3. A function to print **disk usage** (top 5 by size)
4. A function to print **memory usage**
5. A function to print **top 5 CPU-consuming processes**
6. A `main` function that calls all of the above with section headers
7. Use `set -euo pipefail` at the top

[View system_info.sh](scripts/system_info.sh)

<img width="568" height="577" alt="image" src="https://github.com/user-attachments/assets/37813edb-c821-4468-947e-943caa336795" />


---
