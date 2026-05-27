# File Permissions & File Operations Challenge

## Create Files

- Create an empty file devops.txt using touch
- Create notes.txt with some content using cat or echo
- Create script.sh using vim with content: echo "Hello DevOps"
- Verify: ls -l to see permissions

  <img width="646" height="217" alt="image" src="https://github.com/user-attachments/assets/2e0c7626-713f-434b-b40b-a92d7aed3e0f" />

---

## Read Files

- Read notes.txt using cat

<img width="462" height="63" alt="image" src="https://github.com/user-attachments/assets/a3006ea4-0b68-4b69-b512-0e5a153d15ae" />

- View script.sh in vim read-only mode `vim -R script.sh`

  <img width="289" height="579" alt="image" src="https://github.com/user-attachments/assets/ccf58adc-d523-46e1-9e62-b6f07fc27f6f" />

- Display first 5 lines of /etc/passwd using head

  <img width="554" height="116" alt="image" src="https://github.com/user-attachments/assets/9c8482d9-636a-43e8-a478-43b9402eda40" />

- Display the last 5 lines of /etc/passwd using tail

  <img width="556" height="116" alt="image" src="https://github.com/user-attachments/assets/f56b1509-9e0c-41da-994a-c4f77dc2a5e4" />

---

## Understand Permissions

<img width="473" height="130" alt="image" src="https://github.com/user-attachments/assets/8ec0f1fd-7f4b-4b02-a567-9d6b5eb223a7" />

- Permissions set to the files.
   - Set the same permission to all the files (devops.txt, notes.txt, script.sh) `-rw-rw-r--`
   - `-`  Regular file 
   - `rw-` Read write permission (User/Owner)
   - `rw-` Read write permission (Group)
   - `r--` read-only permission (Other)
 
---

## Modify Permissions

- Make script.sh executable → run it with ./script.sh

  <img width="502" height="129" alt="image" src="https://github.com/user-attachments/assets/aebe4c86-9564-424d-b577-40548be33fdb" />

- Set devops.txt to read-only (remove write for all)

<img width="528" height="102" alt="image" src="https://github.com/user-attachments/assets/2bd42975-6fac-4d23-ba41-46d30e8fdf3a" />

- Set notes.txt to 640 (owner: rw, group: r, others: none)

<img width="507" height="101" alt="image" src="https://github.com/user-attachments/assets/7145db18-1904-4cc2-8593-05a6bc2da6a4" />

- Create a directory project/ with permissions 755

<img width="642" height="102" alt="image" src="https://github.com/user-attachments/assets/95603d01-506f-4a67-a1c1-937067370010" />

---

## Test Permissions

- Try writing to a read-only file - what happens?

When trying to write to a read-only file, Linux blocks the operation and shows a Permission denied error.
This happens because the file does not have write (w) permission enabled.

<img width="743" height="82" alt="image" src="https://github.com/user-attachments/assets/45353e70-5e40-4494-a781-c336a96a83ff" />

- Try executing a file without execute permission

  If you try to execute a file without execute (x) permission, Linux denies execution and shows a Permission denied error.
  You must add execute permission using chmod +x filename before running the file or script.

  <img width="497" height="54" alt="image" src="https://github.com/user-attachments/assets/e9e80492-1998-46a8-a716-929be58a677f" />

  ---

  ## Command Used

- touch devops.txt 
- echo "Day 10 test file" >> notes.txt
- cat > notes.txt
- nano script.sh
- ls -l
- cat notes.txt
- vim -R script.sh
- cat /etc/passwd | head -5
- cat /etc/passwd | tail -5
- chmod 764 script.sh
- ./script.sh
- chmod -w devops.txt
- chmod 640 notes.txt
- mkdir project  && chmod 755 project
- ls -ld project
- echo "test" >> devops.txt
- chmod -x script.sh

---

## What I Learned

1. Linux file permissions use the format rwxrwxrwx, divided into owner, group, and others, where:
    - r = 4
    - w = 2
    - x = 1
    
2. The chmod command is used to modify permissions:
    - chmod +x makes a file executable
    - chmod -w removes write permissions
    - Numeric permissions like 640 and 755 control access levels.

3. Permission-related errors help identify access restrictions:
    - Writing to a read-only file gives Permission denied
    - Executing a file without execute permission also gives Permission denied
    
