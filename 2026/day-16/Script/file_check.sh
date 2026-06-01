#!/bin/bash

read -p "Enter the file name: " file

if [  -f "$file" ]; then
        echo "The file exists."
else
        echo "The file does not exist."
fi

