#!/bin/bash


check_disk() {
        echo "  ===Disk Space(/)=== "
        df -h / | awk ' NR==2 {print "Available: " $4 " / " "Total: " $2}'
}



check_memory() {
        echo "    ===Memory=== "
        free -h | awk ' NR==2 {print "Available: "  $4 " / " "Total: " $2}'
}

check_disk
check_memory
