#!/usr/bin/env bash

# This script will keep the netcat listener active even after nmap scan 
# Don't use this if you are not familiar with ps aux and kill
while [[ 1 -eq 1 ]]; do
    nc -lnvp $1
done