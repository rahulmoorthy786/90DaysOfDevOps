#!/bin/bash

set -euo pipefail

print_header() {
    echo
    echo "========================================"
    echo "$1"
    echo "========================================"
}

system_info() {

        echo "Hostname : $(hostname)"
        echo "OS       : $(grep '^PRETTY_NAME=' /etc/os-release | cut -d= -f2 | tr -d '"')"
        echo "Kernel   : $(uname -r)"
}


uptime_info() {

        uptime -p
}


disk_usage() {

        df -h / | awk ' NR==2 {print "Available: " $4 "\n" "Used: " $3 "\n" "Total: " $2}'
}


memory_usage() {

        free -h | awk 'NR==2 {print "Available: " $7 "\n" "Used: " $3 "\n" "Total: " $2}'
}

top_cpu_processes() {

        ps -eo pid,user,%cpu,%mem,comm  --sort=-%cpu | head -6
}


main() {

    print_header "SYSTEM INFORMATION"
    system_info

    print_header "UPTIME"
    uptime_info

    print_header "DISK USAGE (TOP 5)"
    disk_usage

    print_header "MEMORY USAGE"
    memory_usage

    print_header "TOP 5 CPU-CONSUMING PROCESSES"
    top_cpu_processes

}


main
