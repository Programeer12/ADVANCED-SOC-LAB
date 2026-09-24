# Troubleshooting Log

Issues encountered and resolved while building this SOC lab.

## Issue 1: Agent Failed to Start — Invalid log_format
**Symptom:** `ERROR: (1235): Invalid value for element 'log_format': snort.`
**Cause:** `snort-full` isn't a valid log format
**Fix:** Use `<log_format>syslog</log_format>` for Snort alerts

## Issue 2: Too Many Fields for JSON Decoder
**Symptom:** `ERROR: Too many fields for JSON decoder.`
**Cause:** Suricata stats events have 200+ fields
**Fix:** Increased `decoder_order_size` to 1024 in `/var/ossec/etc/internal_options.conf`

## Issue 3: Rule 100100 Fired in logtest but Not on Real Traffic
**Symptom:** Custom rule works with `wazuh-logtest` but dashboard shows 0 alerts
**Cause:** Multiple — Snort path typo, agent config issue, decoder limit
**Fix:** 
- Fixed Snort path: `/var/log/snort/snort.alert.fast` (with two slashes)
- Used `<if_sid>86601</if_sid>` as child of default Suricata rule
- Confirmed JSON decoded correctly with `wazuh-logtest`

## Issue 4: Malformed <localfile> Block
**Symptom:** Agent couldn't read eve.json
**Cause:** Broken XML with orphaned tags
**Fix:** Rewrote the `<localfile>` block cleanly

## Useful Commands

### Check agent config
\```bash
sudo grep -A3 "suricata" /var/ossec/etc/ossec.conf
\```

### Check if agent is reading the file
\```bash
sudo grep -a "eve.json" /var/ossec/logs/ossec.log | tail -5
\```

### Count Suricata alerts on the sensor
\```bash
sudo grep -c '"event_type":"alert"' /var/log/suricata/eve.json
\```

### Test rule with logtest
\```bash
sudo /var/ossec/bin/wazuh-logtest
# Paste a JSON event and press Ctrl+D
\```

### Count alert hits on the SIEM
\```bash
sudo grep -c '"id":"100100"' /var/ossec/logs/alerts/alerts.json
\```
