#!/usr/bin/env bash

current_time=$(date +"%Y%m%d%H%M%S")
log_dir="log/$current_time"
mkdir -p "$log_dir"

for script in $(ls *.sh | grep -v "start_test.sh" | sort); do
    script_name=$(basename "$script")
    echo "Executing script: $script_name"
    bash "$script" | tee "$log_dir/$script_name.log" 2>&1
done

echo "All scripts have been executed. Log files are saved in the $log_dir directory."