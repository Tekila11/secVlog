---
layout: article
title: "Web Application Penetration Testing | Hands-on intro"
date: 2025-02-18
categories: Web security
tags: security web tutorials penetration-testing best-practices
---

# **Web Application Penetration Testing: Essential Commands & Tools**  

## **1. Reconnaissance & Information Gathering**  

### **Find subdomains**  
```bash
subfinder -d example.com
amass enum -d example.com
```
  
### **Retrieve DNS records**  
```bash
nslookup example.com
dig example.com any
```
  
### **Gather HTTP headers**  
```bash
curl -I https://example.com
```
  
### **Discover hidden files & directories**  
```bash
gobuster dir -u https://example.com -w /usr/share/wordlists/dirb/common.txt
ffuf -u https://example.com/FUZZ -w /usr/share/wordlists/dirb/common.txt
```

---

## **2. Web Application Scanning**  

### **Scan for vulnerabilities (OWASP ZAP)**
```bash
zap-cli quick-scan -r -u https://example.com
```
  
### **Basic Nmap scan for open ports**
```bash
nmap -sC -sV example.com
```
  
### **Check for SQL Injection vulnerabilities**
```bash
sqlmap -u "https://example.com/index.php?id=1" --dbs
```

---

## **3. Intercept & Modify Requests (Burp Suite & Curl)**  

### **Use Curl to modify headers**  
```bash
curl -X GET "https://example.com" -H "User-Agent: admin"
```

### **Basic Burp Suite Workflow**
1. **Turn on Intercept** in **Proxy** tab.
2. Navigate to a form and capture the request.
3. Modify the request (e.g., test for XSS, SQLi, or broken authentication).
4. Forward or resend the modified request.

---

## **4. Exploiting Common Web Vulnerabilities**  

### **Test for XSS (Cross-Site Scripting)**  
Inject in input fields or URLs:
```html
<script>alert('XSS')</script>
```
Using `curl`:
```bash
curl -X POST "https://example.com/search" -d "query=<script>alert('XSS')</script>"
```

### **Test for IDOR (Insecure Direct Object References)**  
Modify numerical values in API requests:
```
https://example.com/profile?id=123  → Change to id=124
```

### **Brute-force login forms (Hydra)**
```bash
hydra -l admin -P rockyou.txt example.com http-post-form "/login:username=^USER^&password=^PASS^:F=Incorrect"
```

---

## **5. Post-Exploitation & Reporting**  

### **Check for security misconfigurations**
```bash
nikto -h https://example.com
```

### **Dump database contents (If SQLi exists)**
```bash
sqlmap -u "https://example.com/index.php?id=1" --dump
```

### **Capture & analyze traffic (Wireshark)**
```bash
tshark -i wlan0 -w capture.pcap
```

---

## **6. Useful Online Resources**  
📌 [PortSwigger Web Security Academy](https://portswigger.net/web-security)  
📌 [OWASP Testing Guide](https://owasp.org/www-project-web-security-testing-guide/)  
📌 [HackTricks Cheat Sheet](https://book.hacktricks.xyz/)  
📌 [TryHackMe - Web Fundamentals](https://tryhackme.com/module/)  

---

This handout gives participants a solid reference for key web pentesting commands. Let me know if you need any modifications! 🚀