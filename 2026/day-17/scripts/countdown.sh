#!/bin/bash

read -p "Enter a number: " num

if [[ ! "$num" =~ [0-9]+$ ]]; then
        echo "Provided input should be Integer"

        exit 1
fi

if [ "$num" -lt 0 ]; then
    step=1
else
    step=-1
fi

while [ "$num" -ne 0 ]
do
    echo "$num"
    num=$((num + step))
done

echo "0"
echo "Done!"
