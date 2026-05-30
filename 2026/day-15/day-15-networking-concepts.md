# Networking Concepts: DNS, IP, Subnets & Ports

# Task 1: DNS – How Names Become IPs

## What Happens When You Type `google.com` in a Browser?

When you enter `google.com` in a browser, your computer first performs a DNS lookup to find the IP address associated with the domain name. The DNS server responds with the IP address, allowing your browser to connect to Google's servers. Once connected, the browser sends an HTTP/HTTPS request and receives the website content.

---

## Common DNS Record Types

### A Record

Maps a domain name to an IPv4 address.

### AAAA Record

Maps a domain name to an IPv6 address.

### CNAME Record

Creates an alias that points one domain name to another.

### MX Record

Specifies which mail server handles email for a domain.

### NS Record

Identifies the authoritative name servers for a domain.

---

## DNS Lookup Practice

### Command

```bash
dig google.com
```

<img width="566" height="351" alt="image" src="https://github.com/user-attachments/assets/69e19cdd-5368-4855-847d-35bf566c2b44" />


### Example Output

```text
;; ANSWER SECTION:
google.com. 300 IN A 142.251.42.14
```

### Identify

| Item     | Example Value |
| -------- | ------------- |
| A Record | 142.251.42.14 |
| TTL      | 300 seconds   |

### Observation

* The A record provides the IPv4 address for the domain.
* TTL (Time To Live) indicates how long DNS resolvers can cache the record.

---

# Task 2: IP Addressing

## What is an IPv4 Address?

An IPv4 address is a unique 32-bit identifier assigned to a device on a network. It is written as four decimal numbers separated by periods.

Example:

```text
192.168.1.10
```

Each section (octet) ranges from 0–255.

---

## Public vs Private IP Addresses

### Public IP

* Routable on the internet.
* Assigned by an ISP.

Example:

```text
8.8.8.8
```

### Private IP

* Used within internal networks.
* Not directly reachable from the internet.

Example:

```text
192.168.1.10
```

---

## Private IPv4 Address Ranges

| Range                         | CIDR           |
| ----------------------------- | -------------- |
| 10.0.0.0 – 10.255.255.255     | 10.0.0.0/8     |
| 172.16.0.0 – 172.31.255.255   | 172.16.0.0/12  |
| 192.168.0.0 – 192.168.255.255 | 192.168.0.0/16 |

---

## Identify Your Private IP

### Command

```bash
ip addr show
```

<img width="786" height="299" alt="image" src="https://github.com/user-attachments/assets/be22ff97-5c22-4786-8dc9-a120a259f35d" />


### Example Output

```text
inet 172.31.45.183/20
```

### Observation

* Check whether your IP falls within one of the private address ranges.
* Most cloud instances and home networks use private IPs internally.

---

# Task 3: CIDR & Subnetting

## What Does `/24` Mean?

Example:

```text
192.168.1.0/24
```

The `/24` indicates that the first 24 bits represent the network portion of the address, leaving 8 bits available for host addresses.

---

## Usable Hosts Calculation

| CIDR | Total IPs | Usable Hosts |
| ---- | --------- | ------------ |
| /24  | 256       | 254          |
| /16  | 65,536    | 65,534       |
| /28  | 16        | 14           |

> Formula: Usable Hosts = (2^Host Bits) - 2

---

## Why Do We Subnet?

Subnetting helps divide large networks into smaller, manageable segments. This improves security, reduces broadcast traffic, and allows efficient IP address allocation.

---

## Quick Exercise

| CIDR | Subnet Mask     | Total IPs | Usable Hosts |
| ---- | --------------- | --------- | ------------ |
| /24  | 255.255.255.0   | 256       | 254          |
| /16  | 255.255.0.0     | 65,536    | 65,534       |
| /28  | 255.255.255.240 | 16        | 14           |

---

# Task 4: Ports – The Doors to Services

## What is a Port?

A port is a logical communication endpoint used by applications and services. Ports allow multiple services to run on the same IP address without conflicts.

---

## Common Ports

| Port  | Service |
| ----- | ------- |
| 22    | SSH     |
| 80    | HTTP    |
| 443   | HTTPS   |
| 53    | DNS     |
| 3306  | MySQL   |
| 6379  | Redis   |
| 27017 | MongoDB |

---

## Identify Listening Services

### Command

```bash
ss -tulpn
```

### Example Output

```text
tcp LISTEN 0 128 0.0.0.0:22
tcp LISTEN 0 511 0.0.0.0:80
```

### Match Ports to Services

| Port | Service             |
| ---- | ------------------- |
| 22   | SSH                 |
| 80   | HTTP (Nginx/Apache) |

### Observation

* Port 22 indicates an SSH server is listening.
* Port 80 indicates a web server is listening.

---

# Task 5: Putting It Together

## Scenario 1

### Question

You run:

```bash
curl http://myapp.com:8080
```

What networking concepts are involved?

### Answer

DNS resolves `myapp.com` to an IP address. TCP establishes a connection to port `8080`, and HTTP sends the request over that connection. The response travels back through the TCP/IP stack to the client.

---

## Scenario 2

### Question

Your application cannot reach a database at:

```text
10.0.1.50:3306
```

What would you check first?

### Answer

First verify network connectivity using `ping` or `nc`, then confirm the database service is listening on port `3306`. Also check firewall rules, security groups, routing, and whether the database service is running.

---

# Hands-On Commands Summary

```bash
# DNS lookup
dig google.com

# View IP addresses
ip addr show

# View listening ports
ss -tulpn

# Check connectivity
ping google.com

# Port connectivity test
nc -zv localhost 22

# HTTP test
curl -I https://google.com
```

---

# Reflection

## 1. Why is DNS important?

DNS allows humans to use domain names instead of remembering IP addresses.

## 2. Why are ports important?

Ports allow multiple applications and services to communicate on the same host.

## 3. Why do organizations use subnetting?

Subnetting improves scalability, security, and efficient IP address management.

## 4. What did I learn today?

* How DNS resolves names to IP addresses
* How IPv4 addressing works
* CIDR notation and subnet calculations
* Common network service ports
* Basic network troubleshooting workflow
