#!/bin/bash
# Nmap SYN scan against the Windows victim VM
# Expected: Suricata generates alerts, Wazuh rule 100100 fires

TARGET="192.168.56.13"

echo "[*] Running stealth SYN scan against $TARGET..."
sudo nmap -sS -T4 -A "$TARGET"

echo "[*] Scan complete."
echo "[*] Check the Wazuh dashboard: search rule.id: 100100"
