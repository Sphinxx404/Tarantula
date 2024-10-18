#!/bin/bash

# Function to check if a command exists
command_exists() {
    command -v "$1" >/dev/null 2>&1
}

sudo apt update

# Check and install seclists
if ! command_exists seclists; then
    echo "Installing seclists..."
    sudo apt install seclists -y;
fi

# Check and install nmap
if ! command_exists nmap; then
    echo "Installing nmap..."
    sudo apt install nmap -y;
fi

# Check and install gobuster
if ! command_exists gobuster; then
    echo "Installing gobuster..."
    sudo apt install gobuster -y;
fi

# Check and install sntp
if ! command_exists sntp; then
    echo "Installing sntp..."
    sudo apt install sntp -y;
fi

# Check and install john the ripper
if ! command_exists john; then
    echo "Installing john..."
    sudo apt install jhon -y;
fi

# Check and install impacket
if ! command_exists impacket-GetUserSPNs; then
    echo "Installing Impacket..."
    sudo apt install impacket-scripts -y;
fi

# Check and install feroxbuster
if ! command_exists feroxbuster; then
    echo "Installing feroxbuster..."
    sudo apt install feroxbuster -y;
fi

# Check and install Metasploit
if ! command_exists msfconsole; then
    echo "Installing Metasploit..."
    sudo apt install metasploit-framework -y;
fi

# Check and install dig (part of dnsutils)
if ! command_exists dig; then
    echo "Installing dnsutils (includes dig)..."
    sudo apt install dnsutils -y;
fi

# Check and install snmpwalk (part of snmp)
if ! command_exists snmpwalk; then
    echo "Installing snmp (includes snmpwalk)..."
    sudo apt install snmp -y;
fi

# Clone CTFEnum repository and set up ctfenum command
if [ ! -d "/opt/Raider" ]; then
    echo "Cloning Raider repository..."
    sudo git clone https://github.com/TREASURE404DANGER/Raider /opt/Raider
fi

# Create ctfenum command
if [ ! -f "/usr/sbin/ctfenum" ]; then
    echo "Setting up ctfenum command..."
    echo 'sudo python3 /opt/Raider/raider/raider.py "$1"' | sudo tee /usr/sbin/raider>/dev/null
    sudo chmod +x /usr/sbin/raider;
fi
