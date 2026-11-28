    #!/bin/bash

    # Define an array of directories to back up
    directories=("dir1" "dir2" "dir3") # Replace with your actual directories

    # Define the timestamp format
    TIMESTAMP=$(date +"%Y%m%d_%H%M%S")

    # Loop through each directory and create a backup
    for dir in "${directories[@]}"; do
    if [ -d "$dir" ]; then
    BACKUP_NAME="${dir}_backup_$TIMESTAMP.zip"
    if zip -r "$BACKUP_NAME" "$dir"; then
      echo "Backup of $dir completed: $BACKUP_NAME"
    else
      echo "Error: Failed to back up $dir" >&2
    fi
  else
    echo "Directory $dir does not exist, skipping."
  fi
done
