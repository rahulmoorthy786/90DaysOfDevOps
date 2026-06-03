#!/bin/bash

set -u

greet() {

        echo "Hello, $1!"

}


add() {

        echo $(($1 + $2))
}


read -p "Ener the name: " name
greet $name


read -p "Enter the number: " a b

if [ $a -eq $a ] &>/dev/null && [ $b -eq $b ] &>/dev/null;then

        add $a $b
else
        echo "Ener the valid number"
        exit 1
fi
