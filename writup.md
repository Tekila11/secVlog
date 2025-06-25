# image:
Extract LSB from the image to get the message:
Emergency protocol activated. The operation codename is NIGHTINGALE. If this message is found, the primary extraction point has been compromised. Secondary rendezvous location is the old pier. All team members should switch to backup communication channels immediately. The syndicate has likely infiltrated our standard networks


# Network pcap:

we notice some suspicious domain names:
[

        "seattle-office-2024.company-updates.net",
        "fibonacci-sequence-research.math-tools.org", 
        "victrola-coffee-suppliers.local-business.com",
        "dr-chen-1989-alumni.university-networks.edu",
        "defcon32-security-briefing.conference-archives.org",
        "operation-raven-intelligence.classified-data.net",
        "cybersec-research-fibonacci.academic-papers.net",
        "coffee-shop-surveillance.security-feeds.com",
        "missing-researcher-case-2024.investigation-logs.gov",
        "seattle-missing-person-chen.police-database.local"
]

# Voice memo
there is nothing hidden in the audio just a normal Voice memo.
we get:

Dr. Sarah Chen, personal log, June 15th. They're watching me. I've been investigating a cybercrime syndicate using Fibonacci encryption patterns. Been working from Victrola Coffee, Capitol Hill - my usual spot. DEF CON 32 showed me how to hide data in frequencies. My cat Fibonacci is acting strange too. Born in '89, I know the old techniques work best. If something happens, look for hidden research across platforms. The truth is in the patterns and frequencies people can't hear. Someone's at the door. Remember Seattle. End log.

# social media:
social media dump

## intelligence gathered :

# from social media dump:
Location: Seattle, Washington
Name: Sarah Chen (Dr.)
Profession: Cybersecurity researcher
Education: PhD Computer Science
Workplace: Digital Forensics Institute

# from image:
Operation codename: NIGHTINGALE
Protocol: Emergency protocol activated
Context: Primary extraction point compromised
Backup location: Old pier
Network status: Standard networks infiltrated

# from audio:
Personal details: Born in '89 (1989)
Pet: Cat named Fibonacci
Work location: Victrola Coffee, Capitol Hill
Research focus: Fibonacci encryption patterns, cybercrime syndicate
Conference: DEF CON 32
Techniques: Data hidden in frequencies
Location confirmation: Seattle

# from network capture:
Parsing domain names reveals key intelligence:

seattle-office-2024 → Seattle, 2024
fibonacci-sequence-research → Fibonacci (confirms pet name and research)
victrola-coffee-suppliers → Victrola Coffee (confirms workplace)
dr-chen-1989-alumni → Dr. Chen, 1989 (confirms birth year)
defcon32-security-briefing → DEF CON 32 (confirms conference)
operation-raven-intelligence → RAVEN (mission codename)
cybersec-research-fibonacci → Cybersecurity, Fibonacci research
seattle-missing-person-chen → Seattle, Chen (confirms identity/location)

# we need first to analyse these keywords to contruct a wordlist.
#Wordlist Construction:
Step 1: Cross-source validation
Elements appearing in multiple sources (high confidence):

Seattle: Social media + voice memo + network domains
Fibonacci: Voice memo + network domains
1989: Voice memo + network domains
Victrola: Voice memo + network domains
Chen: Social media + network domains

Step 2: Unique intelligence per source

Social media only: Professional background, education
Image only: NIGHTINGALE (operation codename)
Voice memo only: Personal timeline, cat name, birth year
Network only: RAVEN (mission codename), 2024 timeline

Step 3: Component classification
Locations: Seattle, Washington, Capitol Hill
Personal names: Sarah, Chen, Fibonacci (cat)
Dates/Numbers: 1989, 2024, 32 (DEF CON 32)
Operation codenames: NIGHTINGALE, RAVEN
Professional terms: Cybersecurity, Research, PhD
Places: Victrola Coffee, Digital Forensics Institute
Step 4: Password psychology analysis
Security professionals typically use:

Meaningful personal information (locations, pets, dates)
Professional terminology (operation codenames)
Significant dates (birth year, current events)
Concatenated meaningful terms without special characters

Step 5: Intelligence-based wordlist construction

intelligence_wordlist = [

    "seattle",
    "fibonacci",  
    "victrola",
    "chen", 
    "nightingale",
    "raven",
    "1989",
    "2024", 
    "sarah",
    "cybersecurity",
    "research",
    "defcon", 
    "coffee",
    "capitol",
    "hill", 
    "operation",
    "intelligence", 
    "protocol", 
    "emergency" 
]
# let's now create the wordlist:

```python

from itertools import permutations
from bcrypt import checkpw

# Intelligence keywords (from OSINT analysis)
intelligence_wordlist = [
    "seattle", "nightingale", "raven", "fibonacci", "victrola",
    "chen", "sarah", "cybersecurity", "research", "defcon",
    "coffee", "capitol", "hill", "operation", "intelligence",
    "protocol", "emergency"
]

# Process words (title case for proper nouns)
processed_word_list = []
for word in intelligence_wordlist:
    processed_word_list.append(word.title())

# Remove duplicates
processed_word_list = list(set(processed_word_list))

print(f"Extracted {len(processed_word_list)} unique keywords from intelligence")
print("Keywords:", processed_word_list[:10], "...")

# Generate 3-word combinations 
password_strings = []
for group in list(permutations(processed_word_list, 3)):
    password_strings.append(''.join(group))

print(f"Generated {len(password_strings)} 3-word combinations")

```

```python

# Date and number variations found in intelligence
numbers = ["1989", "89", "2024", "24", "32", "15"]
date_strings = []

# Single numbers
for num in numbers:
    date_strings.append(num)

# 2-number combinations  
for group in list(permutations(numbers, 2)):
    date_strings.append(''.join(group))

print(f"Generated {len(date_strings)} date/number combinations")

```

```python 

# Generate all combinations of words + dates
with open('generated_passwords.txt', "w") as file:
    # Pattern 1: 3 words + date
    for date in date_strings:
        for word in password_strings:
            file.write((word + date) + "\n")
    
    # Pattern 2: date + 3 words  
    for date in date_strings:
        for word in password_strings:
            file.write((date + word) + "\n")
    
    # Pattern 3: 4-word combinations (no dates)
    for group in list(permutations(processed_word_list, 4)):
        file.write(''.join(group) + "\n")

print("Password list generated: generated_passwords.txt")

# Check file size
with open('generated_passwords.txt', "r") as file:
    password_count = sum(1 for line in file)
print(f"Total password candidates: {password_count}")

```

# for password cracking we have few options, crack the password from the hash given (python / hashcat) or bruteforce the zip password directly.

let's work on the hash using python:

```python

# Target hash from the challenge
hash_goal = b"$2b$12$.9z5q8EU8.jEG4eO91BmIeNGIKTh.o/4AaRZXrSiEuAbrQf5QiR3q" 

print("Starting brute force attack...")
print("Testing intelligence-derived password combinations...")

flag = 0
attempt_count = 0

with open('generated_passwords.txt', "r") as file:
    for password in file:
        attempt_count += 1
        
        # Progress indicator
        if attempt_count % 1000 == 0:
            print(f"Tested {attempt_count} passwords...")
        
        if (checkpw(bytes(password.rstrip(), "utf-8"), hash_goal) == True):
            print("🎉 FOUND!")
            print(f"💻 Password: {password.rstrip()}")
            print(f"🔢 Attempts: {attempt_count}")
            flag = 1
            break
        else:
            continue  
            
if (flag == 0):
    print("❌ Not found in intelligence-derived wordlist")

    
```

Starting brute force attack...
Testing intelligence-derived password combinations...
🎉 FOUND!
# 💻 Password: **SeattleNightingaleRaven1989**

# get the flag:
```bash
unzip -P "SeattleNightingaleRaven1989" final_intelligence.zip
```
```bash
 cat recovered_intelligence.txt
CTF{digital_detective_case_solved_dr_chen_investigation_complete_a7f3b9e2}
```
