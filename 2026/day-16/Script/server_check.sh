#!/bin/bash

read -p "Enter any service name: " service

read -p "Do you want to check the status?(y/n): " choice

if [[ "$choice" == 'y' ||  "$choice" == 'Y' ||  "$choice" == 'yes' ||  "$choice" == 'Yes' || "$choice" == 'YES' ]]; then

        status=$(systemctl is-active  "$service")
        echo "Service: $service"
        echo "Status: $status"

elif [[ "$choice" == 'n' ||  "$choice" == 'N' ||  "$choice" == 'no' || "$choice" == 'No' ||  "$choice" == 'NO' ]]; then

        echo "skip"
        exit 0
else
        echo "Enter the valid choise. Quite"
        exit 1

fi
