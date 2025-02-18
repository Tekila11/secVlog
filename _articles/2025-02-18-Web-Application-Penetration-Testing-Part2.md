---
layout: article
title: "Web Application Penetration Testing | Part2"
date: 2025-02-18
categories: Web security
tags: security web tutorials penetration-testing best-practices
---

# Web Application Penetration Testing Part 2
## Essential Commands & Tools Reference

### Reconnaissance Commands

**Subdomain Enumeration:**
```bash
# Using Sublist3r
sublist3r -d example.com -o subdomains.txt

# Using Amass
amass enum -d example.com -o amass_results.txt
```

**Information Gathering:**
```bash
# Perform Whois lookup
whois example.com

# DNS enumeration with dig
dig example.com ANY
dig MX example.com

# Checking website technology with whatweb
whatweb example.com
```

### Web Application Scanning

**Vulnerability Scanning:**
```bash
# Nikto basic scan
nikto -h https://example.com

# Using OWASP ZAP from command line
zap-cli quick-scan --self-contained --start-options '-config api.disablekey=true' https://example.com
```

**Directory/File Enumeration:**
```bash
# Using dirb
dirb https://example.com /usr/share/wordlists/dirb/common.txt

# Using gobuster
gobuster dir -u https://example.com -w /usr/share/wordlists/dirbuster/directory-list-2.3-medium.txt
```

### Burp Suite Quick Reference

1. **Setup Proxy:**
   - Settings: Proxy tab → Options → Proxy Listeners → Add → Bind to port 8080
   - Configure browser to use 127.0.0.1:8080 as proxy

2. **Important Features:**
   - **Proxy**: Intercept and modify requests/responses
   - **Target**: Define scope, site map
   - **Repeater**: Manually modify and resend requests
   - **Intruder**: Automate customized attacks

3. **Common Shortcuts:**
   - Ctrl+R: Send to Repeater
   - Ctrl+I: Send to Intruder
   - Ctrl+Shift+B: Base64 encode
   - Ctrl+Shift+U: URL encode

### Common Web Vulnerabilities Testing

**Cross-Site Scripting (XSS) Test Payloads:**
```
<script>alert('XSS')</script>
<img src="x" onerror="alert('XSS')">
<svg onload="alert('XSS')">
```

**SQL Injection Test Strings:**
```
' OR 1=1--
" OR 1=1--
admin'--
' UNION SELECT username,password FROM users--
```

**Command Injection Tests:**
```
; ls -la
& whoami
| cat /etc/passwd
```

### HTTP Status Codes Reference

- **2xx Success**
  - 200: OK
  - 201: Created
  - 204: No Content

- **3xx Redirection**
  - 301: Moved Permanently
  - 302: Found (Temporary Redirect)

- **4xx Client Errors**
  - 400: Bad Request
  - 401: Unauthorized
  - 403: Forbidden
  - 404: Not Found
  - 405: Method Not Allowed

- **5xx Server Errors**
  - 500: Internal Server Error
  - 502: Bad Gateway
  - 503: Service Unavailable

### Security Tool Installation Quick Commands

```bash
# Install Burp Suite Community
sudo apt install burpsuite

# Install OWASP ZAP
sudo apt install zaproxy

# Install common reconnaissance tools
sudo apt install whois dnsutils nmap nikto dirb

# Clone popular tools from GitHub
git clone https://github.com/OWASP/Amass.git
git clone https://github.com/aboul3la/Sublist3r.git
```

### Useful Browser Extensions

- **Firefox:**
  - FoxyProxy (proxy management)
  - Wappalyzer (technology identification)
  - User-Agent Switcher
  - Cookie Editor

- **Chrome:**
  - Proxy SwitchyOmega
  - Wappalyzer
  - EditThisCookie
  - Web Developer Tools

### Resources for Further Learning

- **Websites:**
  - PortSwigger Web Security Academy: https://portswigger.net/web-security
  - OWASP: https://owasp.org/
  - HackTheBox: https://www.hackthebox.com/
  - TryHackMe: https://tryhackme.com/

- **Books:**
  - "The Web Application Hacker's Handbook"
  - "OWASP Testing Guide"
  - "Bug Bounty Bootcamp"