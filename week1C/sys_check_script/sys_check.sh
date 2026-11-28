#!/bin/bash

# Function to check disk space
check_disk_space() {
  THRESHOLD=80 # Set disk usage threshold in percentage
  USAGE=$(df / | tail -1 | awk '{print $5}' | sed 's/%//')

  if [ "$USAGE" -gt "$THRESHOLD" ]; then
    echo "Warning: Disk space usage is at ${USAGE}%."
  else
    echo "Disk space usage is at a safe level (${USAGE}%)."
  fi
}

# Function to check if Linux/systemd services are running
check_services() {
 # Replace these with services installed on your system
  services=("nginx" "mysql" "docker") # Replace with services you want to check

  # Loop through each service and ask systemd if it is active
  for service in "${services[@]}"; do
    if service "$service" status; then
      echo "$service is running."
    else
      echo "$service is not running."
    fi
  done
}

# Call the functions
check_disk_space
check_services
