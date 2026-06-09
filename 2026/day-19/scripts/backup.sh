#!/bin/bash

set -eu

usage() {
    echo "Usage: $0 source_path destination_path"
    echo "Example: $0 /home/ubuntu/script /home/ubuntu/backups"
    exit 1
}

check_source() {
    [ -d "$src" ] || {
        echo "Source directory doesn't exist"
        exit 1
    }

    [ -d "$dest" ] || {
        echo "Destination directory doesn't exist"
        exit 1
    }
}

backup() {
    echo "====== Taking Backup ======"

    archive="$dest/backup-$(date +%Y-%m-%d-%H-%M-%S).tar.gz"

    tar -czf "$archive" "$src"

    echo "Backup Complete"
    echo
}

print_file() {
    echo "====== Backup Details ======"

    echo "Archive Name : $(basename "$archive")"
    du -sh "$archive" | awk '{print "Size : "$1}'

    echo
}

delete_old() {
    archives=$(find "$dest" -name "*.tar.gz" -mtime +14)

    if [ -n "$archives" ]; then
        echo "====== Removing archives older than 14 days ======"

        for file in $archives; do
            rm -f "$file"
            echo "Removed Archive : $file"
        done
    fi
}

[ $# -eq 2 ] || usage

src="$1"
dest="$2"

check_source
backup
print_file
delete_old
