#!/bin/bash

# Function: Check if directory exists
check_directory() {
    local log_dir="$1"

    if [[ ! -d "$log_dir" ]]; then
        echo "Error: Directory '$log_dir' does not exist."
        exit 1
    fi
}

# Function: Compress .log files older than 7 days
compress_logs() {
    local log_dir="$1"

    compressed_count=$(find "$log_dir" -type f -name "*.log" -mtime +7 | wc -l)

    find "$log_dir" -type f -name "*.log" -mtime +7 -exec gzip {} \;

    echo "$compressed_count"
}

# Function: Delete .gz files older than 30 days
delete_old_archives() {
    local log_dir="$1"

    deleted_count=$(find "$log_dir" -type f -name "*.gz" -mtime +30 | wc -l)

    find "$log_dir" -type f -name "*.gz" -mtime +30 -delete

    echo "$deleted_count"
}

# Main Function
main() {
    if [[ $# -ne 1 ]]; then
        echo "Usage: $0 <log_directory>"
        exit 1
    fi

    local log_dir="$1"

    check_directory "$log_dir"

    compressed=$(compress_logs "$log_dir")
    deleted=$(delete_old_archives "$log_dir")

    echo "--------------------------------"
    echo "Log Rotation Summary"
    echo "--------------------------------"
    echo "Files Compressed : $compressed"
    echo "Files Deleted    : $deleted"
}

# Execute main function
main "$@"
