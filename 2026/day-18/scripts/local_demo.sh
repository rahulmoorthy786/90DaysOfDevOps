#!/bin/bash

name="global"

local_demo() {

        local var_name="local"
        echo "Inside the function name:  $var_name"
}



global_demo() {

        echo "Global/Regular variable inside global function: $name"

}


local_demo
global_demo

echo "local variable outsite the function: $var_name"
echo "Global/Regular variable outside the function: $name"
