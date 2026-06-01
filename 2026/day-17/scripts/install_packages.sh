#!/bin/bash

packages="nginx  curl  wget"

echo "Updating the packages repository..."
apt update

for package in $packages;do

        if dpkg -s "$package" >/dev/null 2>&1; then
        echo "$package is already installed. Skipping..."
    else
        echo "$package is not installed. Installing..."

        sudo apt install -y "$package"
    fi
done


echo "Package check completed."
