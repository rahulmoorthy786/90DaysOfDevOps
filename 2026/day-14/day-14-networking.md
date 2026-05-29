# Networking Fundamentals

## Quick Concepts

### OSI Model (L1–L7)

* The OSI model divides networking into 7 layers, from physical hardware communication up to application-level services.
* It helps troubleshoot issues by isolating problems to a specific layer (example: cable issue = Layer 1, DNS issue = Layer 7).

### TCP/IP Stack

* The TCP/IP model is the practical networking model used on the Internet.
* It has 4 layers: Link, Internet, Transport, and Application.

---

## OSI Layers vs TCP/IP Stack

| OSI Layer              | TCP/IP Layer | Example Protocols   |
| ---------------------- | ------------ | ------------------- |
| Layer 7 – Application  | Application  | HTTP, HTTPS, DNS    |
| Layer 6 – Presentation | Application  | SSL/TLS             |
| Layer 5 – Session      | Application  | Sessions/API Calls  |
| Layer 4 – Transport    | Transport    | TCP, UDP            |
| Layer 3 – Network      | Internet     | IP, ICMP            |
| Layer 2 – Data Link    | Link         | Ethernet, MAC       |
| Layer 1 – Physical     | Link         | Cable, Wi-Fi Signal |

---

## Where Common Protocols Sit

| Protocol     | Layer                 |
| ------------ | --------------------- |
| IP           | Internet / Layer 3    |
| TCP / UDP    | Transport / Layer 4   |
| HTTP / HTTPS | Application / Layer 7 |
| DNS          | Application / Layer 7 |

---

## Real Example

```bash
curl https://example.com
```

Explanation:

* `curl` works at the Application Layer.
* HTTPS runs over TCP.
* TCP runs over IP.
* Data finally travels through the Link layer (Ethernet/Wi-Fi).

Flow:

```text
Application (HTTPS)
        ↓
Transport (TCP)
        ↓
Internet (IP)
        ↓
Link (Ethernet/Wi-Fi)
```

---

# Hands-on Checklist

> Target used for testing: `google.com`

---

## 1. Identity Check

### Command

```bash
hostname -I
```

OR

```bash
ip addr show
```

<img width="773" height="327" alt="image" src="https://github.com/user-attachments/assets/67d69ebf-aa5f-4692-bf0a-c0190f00de03" />


### Observation

* Displays the system IP address assigned to the machine.
* Useful for identifying the active network interface and troubleshooting connectivity issues.

---

## 2. Reachability Test

### Command

```bash
ping google.com
```

<img width="747" height="217" alt="image" src="https://github.com/user-attachments/assets/7cef70ed-4e59-4755-9a6a-4d0de554bc37" />


### Observation

* Confirms whether the target host is reachable.
* Shows latency (response time) and packet loss percentage.

Example:

```text
64 bytes from ... time=6.39 ms
0% packet loss
```

---

## 3. Path Discovery

### Command

```bash
traceroute google.com
```

<img width="1070" height="158" alt="image" src="https://github.com/user-attachments/assets/797c77ac-91e2-465b-b6e1-0aae35ab6986" />


### Observation

* Packets reached Google successfully in 6 hops.
* Minor timeout/high latency at hop 2 may indicate temporary filtering or congestion.

---

## 4. Check Listening Ports

### Command

```bash
ss -tulpn
```

OR

```bash
netstat -tulpn
```

### Observation

* Lists active listening services and their ports.
* Example:

This indicates the SSH service is listening on port 22.


<img width="1026" height="127" alt="image" src="https://github.com/user-attachments/assets/6c4ab234-2d9e-4f18-9266-6178851e65d1" />


---

## 5. DNS Resolution

### Command

```bash
dig google.com
```

OR

```bash
nslookup google.com
```

### Observation

* Resolves the domain name into an IP address.
* Helps verify whether DNS resolution is functioning properly.


<img width="576" height="334" alt="image" src="https://github.com/user-attachments/assets/f2a8fce2-7508-4b38-a941-6db705b19998" />

---

## 6. HTTP Header Check

### Command

```bash
curl -I https://google.com
```

### Observation

* Sends a HEAD request and displays HTTP response headers.
* Useful for checking web server availability and status codes.

<img width="1107" height="256" alt="image" src="https://github.com/user-attachments/assets/3a123ffa-7618-4c1b-ac4e-c1523e154621" />

---

## 7. Connections Snapshot

### Command

```bash
netstat -an | head
```

### Observation

* Displays active network connections.
* Helps identify:

  * `LISTEN` → waiting for incoming connections
  * `ESTABLISHED` → active communication sessions


<img width="657" height="211" alt="image" src="https://github.com/user-attachments/assets/6c76436a-4207-4d21-b2a9-cf1ddb03847c" />

---

# Mini Task: Port Probe & Interpret

## Step 1: Identify a Listening Port

### Command

```bash
ss -tulpn
```

<img width="1013" height="127" alt="image" src="https://github.com/user-attachments/assets/2fcffdcb-1e8f-467b-9afb-f66f852f90db" />

SSH is listening on port `22`.

---

## Step 2: Test the Port

### Command

```bash
nc -zv localhost 22
```

<img width="534" height="67" alt="image" src="https://github.com/user-attachments/assets/7377180b-90cf-4c4b-9aff-bfef536e0ff9" />


### Observation

Example:

Connection to localhost 22 port [tcp/ssh] succeeded!

Result:

* The service is reachable locally.

If the connection fails:

* Check whether the service is running.
* Verify firewall rules.
* Confirm the service is listening on the expected port.

---

# Reflection

## 1. Which command gives the fastest signal when something is broken?

```text
ping
```

Reason:

* Quickly confirms basic network connectivity and packet reachability.

---

## 2. What layer would you inspect next?

### If DNS fails:

* Inspect the Application Layer (DNS service/configuration).
* Check `/etc/resolv.conf`, DNS server reachability, or firewall rules.

### If HTTP 500 appears:

* Inspect the Application Layer.
* Check web server logs, backend application logs, or database connectivity.

---

## 3. Two Follow-up Checks During a Real Incident

### Service Status

```bash
systemctl status nginx
```

Purpose:

* Confirms whether the service is running properly.

---

### Log Investigation

```bash
journalctl -u nginx
```

OR

```bash
tail -f /var/log/nginx/error.log
```

Purpose:

* Helps identify application crashes, configuration issues, or permission errors.

---

