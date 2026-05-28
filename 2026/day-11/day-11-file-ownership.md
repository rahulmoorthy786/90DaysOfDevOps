# File Ownership Challenge (chown & chgrp)

## Task 1: Understanding Ownership

### Difference between Owner and Group
- Owner -> The specific user who owns the file.
- Group -> A collection of users who can share access permissions to the file.

---

## Task 2: Basic chown Operations 
-  Create file devops-file.txt
-  Check current owner: ls -l devops-file.txt
-  Change owner to tokyo (create user if needed)
-  Change owner to berlin
-  Verify the changes

  <img width="626" height="258" alt="image" src="https://github.com/user-attachments/assets/0702e894-349a-4c74-bbee-b600aa280378" />

---

## Task 3: Basic chgrp Operations

- Create file team-notes.txt
- Check current group: ls -l team-notes.txt
- Create group: sudo groupadd heist-team
- Change file group to heist-team
- Verify the change

  <img width="644" height="226" alt="image" src="https://github.com/user-attachments/assets/bd87ea9b-d6e4-4579-bfde-1773aef19e1e" />


---

## Task 4: Combined Owner & Group Change

- Create file project-config.yaml
- Change owner to professor AND group to heist-team (one command)
- Create directory app-logs/
- Change its owner to berlin and group to heist-team

  <img width="759" height="263" alt="image" src="https://github.com/user-attachments/assets/a5071197-a573-43af-839c-d8708b3d31a4" />

---

## Task 5: Recursive Ownership

- Create directory structure:
- Create group planners: sudo groupadd planners
- Change ownership of entire heist-project/ directory:
      - Owner: professor
      - Group: planners
- Verify all files and subdirectories changed: ls -lR heist-project/

<img width="748" height="406" alt="image" src="https://github.com/user-attachments/assets/aa3025a7-f39e-41c1-a53a-e87fb4c3aef4" />

---

## Task 6: Practice Challenge

- Create users: tokyo, berlin, nairobi  (Already created)
- Create groups: vault-team, tech-team
- Create directory: bank-heist/
- Create 3 files inside:
  
  ```bash
  touch bank-heist/access-codes.txt
  touch bank-heist/blueprints.pdf
  touch bank-heist/escape-plan.txt
  ```

- Set different ownership:

   - access-codes.txt → owner: tokyo, group: vault-team
   - blueprints.pdf → owner: berlin, group: tech-team
   - escape-plan.txt → owner: nairobi, group: vault-team

<img width="807" height="381" alt="image" src="https://github.com/user-attachments/assets/398ed892-6f32-46e5-aaa1-667473d37b85" />

---

## Commands Used

`ls -l`

`touch devops-file.txt`

`sudo chown tokyo devops-file.txt`

`sudo chown berlin devops-file.txt`

`touch team-notes.txt`

`sudo groupadd heist-team`

`sudo chgrp heist-team team-notes.txt`

`touch project-config.yaml`

`sudo chown professor:heist-team project-config.yaml`

`mkdir app-logs`

`sudo chown berlin:heist-team app-logs`

`mkdir -p heist-project/vault`

`mkdir -p heist-project/plans`

`touch heist-project/vault/gold.txt`

`touch heist-project/plans/strategy.conf`

`sudo groupadd planners`

`sudo chown -R professor:planners heist-project/`

`sudo groupadd vault-team`

`sudo groupadd tech-team`

`mkdir bank-heist`

`touch bank-heist/access-codes.txt`

`touch bank-heist/blueprints.pdf`

`touch bank-heist/escape-plan.txt`

`sudo chown tokyo:vault-team bank-heist/access-codes.txt`

`sudo chown berlin:tech-team bank-heist/blueprints.pdf`

`sudo chown nairobi:vault-team bank-heist/escape-plan.txt`

`ls -l`

`ls -lR heist-project/`

`ls -l bank-heist/`

---

## What I Learned

- Every file in Linux has an owner and a group associated with it.
- The chown command changes file ownership, while chgrp changes the group ownership.
- Using chown -R allows recursive ownership changes for entire directories and their contents.
