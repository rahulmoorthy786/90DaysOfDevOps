# LVM Storage Management – Hands-on Lab

## Task 1: Check Current Storage

Check available disks, partitions, volume groups, logical volumes, and mounted filesystems.

```bash
lsblk
pvs
vgs
lvs
df -h
```

<img width="591" height="429" alt="image" src="https://github.com/user-attachments/assets/f455e580-4663-4193-80c4-1a4e90b6b0c1" />


---

# Task 2: Create a Physical Volume (PV)

Identify the new disk:

```bash
lsblk
```

Example output:

```bash
root@ip-172-31-45-183:~# lsblk
NAME         MAJ:MIN RM  SIZE RO TYPE MOUNTPOINTS
loop0          7:0    0 28.2M  1 loop /snap/amazon-ssm-agent/13009
loop1          7:1    0   74M  1 loop /snap/core22/2411
loop2          7:2    0 49.3M  1 loop /snap/snapd/26865
nvme0n1      259:0    0   15G  0 disk
├─nvme0n1p1  259:1    0   14G  0 part /
├─nvme0n1p14 259:2    0    4M  0 part
├─nvme0n1p15 259:3    0  106M  0 part /boot/efi
└─nvme0n1p16 259:4    0  913M  0 part /boot
nvme1n1      259:5    0   12G  0 disk
root@ip-172-31-45-183:~#
```

Create the Physical Volume:

```bash
pvcreate /dev/sdb
```

Verify:

```bash
pvs
```

<img width="449" height="127" alt="image" src="https://github.com/user-attachments/assets/d4c7a304-7c5e-4d5a-a279-193c37cabe01" />


---

# Task 3: Create a Volume Group (VG)

Create a Volume Group named `devops-vg`.

```bash
vgcreate devops-vg /dev/nvme1n1
```

Verify:

```bash
vgs
```

<img width="469" height="151" alt="image" src="https://github.com/user-attachments/assets/7b3dbc5b-eb4a-4f40-867b-64d48618d95c" />


---

# Task 4: Create a Logical Volume (LV)

Create a Logical Volume named `app-data` with size `500M`.

```bash
lvcreate -L 500M -n app-data devops-vg
```

Verify:

```bash
lvs
```

<img width="744" height="114" alt="image" src="https://github.com/user-attachments/assets/12351f09-5fb2-4eb0-9296-aa30e255ba28" />

---

# Task 5: Format and Mount the Logical Volume

## Format the LV with ext4 filesystem

```bash
mkfs.ext4 /dev/devops-vg/app-data
```

<img width="524" height="219" alt="image" src="https://github.com/user-attachments/assets/7b100dcf-615d-413a-8be6-da3ae8ece2db" />


## Create a mount point

```bash
mkdir -p /mnt/app-data
```

<img width="467" height="172" alt="image" src="https://github.com/user-attachments/assets/48cc8f7b-720c-42f5-88f6-052457115466" />


## Mount the Logical Volume

```bash
mount /dev/devops-vg/app-data /mnt/app-data
```
Verify the mount

```bash
df -h /mnt/app-data
```

<img width="578" height="112" alt="image" src="https://github.com/user-attachments/assets/cf8bbd58-8a53-49c7-9f4a-9f54798fc1fb" />


Optional verification:

```bash
mount | grep app-data
```

Example output:

```bash
root@ip-172-31-45-183:~# mount | grep app-data
/dev/mapper/devops--vg-app--data on /mnt/app-data type ext4 (rw,relatime)
```

---

# Task 6: Extend the Logical Volume

## Extend the LV by 200M

```bash
lvextend -L +200M /dev/devops-vg/app-data
```
Resize the ext4 filesystem

```bash
resize2fs /dev/devops-vg/app-data
df -h /mnt/app-data
```

<img width="953" height="350" alt="image" src="https://github.com/user-attachments/assets/1b21ae50-9f3c-4e6e-8e5b-70626c3b3b4b" />


Verify Logical Volume size:

```bash
lvs
```

<img width="760" height="80" alt="image" src="https://github.com/user-attachments/assets/1089b5e9-1d50-4a41-8546-c12d6345b240" />


---

# Commands Used

| Command     | Purpose                             |
| ----------- | ----------------------------------- |
| `lsblk`     | Lists block storage devices         |
| `pvs`       | Displays Physical Volumes           |
| `vgs`       | Displays Volume Groups              |
| `lvs`       | Displays Logical Volumes            |
| `df -h`     | Shows mounted filesystem usage      |
| `pvcreate`  | Creates a Physical Volume           |
| `vgcreate`  | Creates a Volume Group              |
| `lvcreate`  | Creates a Logical Volume            |
| `mkfs.ext4` | Formats the LV with ext4 filesystem |
| `mkdir -p`  | Creates mount directory             |
| `mount`     | Mounts the filesystem               |
| `lvextend`  | Extends Logical Volume size         |
| `resize2fs` | Resizes the ext4 filesystem         |

---

# What I Learned

* How to inspect Linux storage devices and mounted filesystems.
* Understanding the relationship between:

  * Physical Volume (PV)
  * Volume Group (VG)
  * Logical Volume (LV)
* How to create and manage LVM storage in Linux.
* How to format a Logical Volume using the ext4 filesystem.
* How to mount storage and verify filesystem usage.
* How to extend a Logical Volume without recreating the filesystem.
* Importance of resizing the filesystem after extending the Logical Volume.
* Practical understanding of flexible storage management using LVM.

---
LVM is widely used in Linux system administration and DevOps environments because it provides flexible and scalable storage management.
