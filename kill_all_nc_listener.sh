#!/usr/bin/env bash

process_list=$(ps aux | grep nc_listener_script.sh | awk '{print $2}')
process_len=$(echo $process_list | wc -w)

for (( i=1; i < $process_len + 1; i++ )); do
    kill $(echo $process_list | awk -v index_var="$i" '{print $index_var}')
done