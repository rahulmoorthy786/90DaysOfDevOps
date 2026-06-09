#!/bin/bash

set -euo pipefail

LOG_FILE="/var/log/maintenance.log"

log() {
    echo "$(date '+%Y-%m-%d %H:%M:%S') : $1" >> "$LOG_FILE"
}

log_rotation() {
    /home/ubuntu/log_rotation/log_rotate.sh /var/log/logs >> "$LOG_FILE" 2>&1
}

backup() {
    /home/ubuntu/log_rotation/backup.sh /home/ubuntu/script  /home/ubuntu/backups >> "$LOG_FILE" 2>&1
}

main() {
    log "Starting Maintenance"

    log_rotation
    log "Log rotation completed"

    backup
    log "Backup completed"

    log "Maintenance completed"
}

main

echo "Successfully written logs to $LOG_FILE"
