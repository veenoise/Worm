#!/usr/bin/env bash

# Use only port range 4444-4450
# Constants
port=$1
tmp_name='/tmp/worm_log/command_and_control_logs.log'


# Generate log file
mkdir -p /tmp/worm_log

# Get the initial port first (using args or by in-line)
if [[ port == '' ]]; then
    echo -n What port: 
    read port
fi

# Conditional exit when not given port
if [[ port == '' ]]; then
    exit 1
fi

# Start to infect patient zero
echo This computer is hacked: port $port '[patient zero]'
echo This computer is hacked: port $port '[patient zero]' >> "$tmp_name"

# Spread: scan for other ports
nmap_scan=$(nmap -sT --open -p4444-4450 localhost | head -n -2 | tail -n +7 | awk '{print $1}' | awk -F '/' '{print $1}')
scanned_len=$(echo $nmap_scan | wc -w)

# Do the same command in all these ports
for (( i=1; i < $scanned_len + 1; i++ )); do
    nc -c "echo This computer is hacked: port $(echo $nmap_scan | awk -v index_var="$i" '{print $index_var}')" 127.0.0.1 $(echo $nmap_scan | awk -v index_var="$i" '{print $index_var}')
    echo This computer is hacked: port $(echo $nmap_scan | awk -v index_var="$i" '{print $index_var}') >> "$tmp_name"
done