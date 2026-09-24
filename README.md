# 🛡️ SOC Lab — Wazuh SIEM + Suricata + Snort
![Wazuh](https://img.shields.io/badge/SIEM-Wazuh%204.9-blue)
![Suricata](https://img.shields.io/badge/IDS-Suricata%208.0-red)
![Snort](https://img.shields.io/badge/IDS-Snort%203.0-orange)
![MITRE](https://img.shields.io/badge/MITRE-T1046-green)
![License](https://img.shields.io/badge/License-MIT-yellow)

A self-contained Security Operations Center (SOC) lab built on 4 virtual machines, combining a SIEM (Wazuh), network intrusion detection (Suricata + Snort), a monitored Windows endpoint, and an attacker machine for live threat simulation.

![Architecture](screenshots/2.png)

## 📑 Table of Contents
- [Overview](#overview)
- [Architecture](#architecture)
- [Prerequisites](#prerequisites)
- [Setup Steps](#setup-steps)
- [Attack Simulations](#attack-simulations)
- [Custom Detection Rules](#custom-detection-rules)
- [Screenshots](#screenshots)
- [Troubleshooting](#troubleshooting)
- [License](#license)

## 🔎 Overview

This project demonstrates:
- ✅ Centralized log collection via Wazuh SIEM
- ✅ Real-time network intrusion detection via Suricata + Snort
- ✅ Host-based monitoring on Windows 10
- ✅ Live attack simulation from Kali Linux
- ✅ Custom detection rule for Nmap scans (MITRE T1046)

## 🏗️ Architecture

| VM | Role | OS | IP |
|----|------|----|----|
| VM1 | SIEM | Ubuntu Server 22.04 | 192.168.56.10 |
| VM2 | Sensor (IDS) | Ubuntu Server 22.04 | 192.168.56.11 |
| VM3 | Victim | Windows 10 | 192.168.56.13 |
| VM4 | Attacker | Kali Linux | 192.168.56.12 |

## 🚀 Setup Steps

See [docs/SETUP.md](docs/SETUP.md) for the complete setup guide.

## ⚔️ Attack Simulations

See [docs/ATTACKS.md](docs/ATTACKS.md) for detailed attack procedures and expected results.

## 🎯 Custom Detection Rules

Custom rule for Nmap detection (MITRE T1046):

See [configs/local_rules.xml](configs/local_rules.xml).

## 📸 Screenshots

See the [screenshots/](screenshots/) folder for step-by-step visual evidence of the setup and attacks.

## 🧩 Troubleshooting

See [docs/TROUBLESHOOTING.md](docs/TROUBLESHOOTING.md).

## 📜 License

This project is intended for educational and lab use only. Do not run attack tools against systems you do not own or have explicit permission to test.
## 🎯 Sample Detection

**Attack:** `nmap -sS -T4 -A 192.168.56.13`

**Detection:** Snort signature `1:1228:7 SCAN nmap XMAS`

**Alert:** Rule 100100 (Level 10) - "Nmap Scan Detected (Snort)"

**MITRE ATT&CK:** T1046 - Network Service Discovery

See the detection in action: [screenshots/8.png](screenshots/8.png)
