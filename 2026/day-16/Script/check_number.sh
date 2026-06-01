#!/bin/bash

read -p "Enter the number of your choice: " num

if  [[ ! "$num" =~ ^-?[0-9]+$ ]] 2>/dev/null; then
        echo "Entered value is invalid."
        exit 1
else
        echo "Entered value is valid."

fi

if [ "$num" -gt 0 ]; then
        echo "Number is Positive."
elif [ "$num" -lt 0 ]; then
        echo "Number is Negative."
else
        echo "Number is Zero."
fi
