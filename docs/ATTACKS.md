# Attack Simulations

## Attack 1: Nmap SYN Scan
**From:** Kali (VM4)
**Target:** Windows (VM3)
**Command:**
\```bash
nmap -sS -T4 -A 192.168.56.13
\```

**Expected Detection:**
- Suricata generates "ET SCAN ..." alerts
- Wazuh rule 100100 fires with MITRE T1046
- Alert appears in dashboard with rule.id: 100100

## Attack 2: SSH Brute Force
**From:** Kali (VM4)
**Target:** Sensor (VM2)
**Command:**
\```bash
hydra -l sensor -P /usr/share/wordlists/rockyou.txt ssh://192.168.56.11
\```

**Expected Detection:**
- Multiple failed SSH logins in `/var/log/auth.log`
- Wazuh rules 5710, 5712 fire

## Attack 3: ICMP Flood
**From:** Kali (VM4)
**Target:** Windows (VM3)
**Command:**
\```bash
sudo hping3 -1 --flood 192.168.56.13
\```

**Expected Detection:**
- Suricata may flag ICMP flood
- Wazuh may correlate as DoS attempt
