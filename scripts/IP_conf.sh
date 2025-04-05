#!/bin/bash

echo "Checking and configuring IPs in /etc/hosts..."

# Define IP-hostname mappings
declare -A hosts
hosts=(
  ["192.168.56.10"]="NameNode"
  ["192.168.56.11"]="DataNode1"
  ["192.168.56.12"]="DataNode2"
)

# Loop through each mapping and add if not already present
for ip in "${!hosts[@]}"; do
  hostname="${hosts[$ip]}"
  if ! grep -q "$ip $hostname" /etc/hosts; then
    echo "$ip $hostname" | sudo tee -a /etc/hosts
    echo "Added: $ip $hostname"
  else
    echo "Entry already exists: $ip $hostname"
  fi
done

echo "IP configuration completed."

