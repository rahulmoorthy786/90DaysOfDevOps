#!/bin/bash

packages=("nginx" "curl" "wget")

if [ "$EUID" -ne 0 ]; then
    echo "This script must be run as root"
    exit 1
else
    echo "Running as root"
fi

echo "Updating package list..."
apt update -y

for pkg in "${packages[@]}"; do
    if dpkg -s "$pkg" &>/dev/null; then
        echo "$pkg already installed"
    else
        echo "$pkg installing..."
        apt install "$pkg" -y
    fi
done

echo "Final Status:"
for pkg in "${packages[@]}"; do
    if dpkg -s "$pkg" &>/dev/null; then
        echo "STATUS - $pkg is INSTALLED"
    else
        echo "STATUS - $pkg is NOT INSTALLED"
    fi
done
