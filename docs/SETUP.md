# Setup Guide

## Prerequisites
- Host with 16 GB RAM, 130 GB disk
- VirtualBox + Extension Pack
- Ubuntu Server 22.04 ISO (x2)
- Windows 10 ISO
- Kali Linux .ova

## Network Setup
- Adapter 1: Internal Network `soclab`
- Adapter 2: NAT (for internet)

## VM Static IPs
| VM | IP |
|----|-----|
| VM1 (SIEM) | 192.168.56.10 |
| VM2 (Sensor) | 192.168.56.11 |
| VM3 (Victim) | 192.168.56.13 |
| VM4 (Attacker) | 192.168.56.12 |

## Install Order
1. Ubuntu Server VMs (VM1, VM2)
2. Windows 10 (VM3)
3. Kali Linux (VM4)
4. Configure networking
5. Install Wazuh SIEM on VM1
6. Install Suricata + Snort on VM2
7. Deploy Wazuh agents on VM2 and VM3
8. Add custom rules to VM1
9. Test attacks from VM4

See the main README for detailed command reference.
