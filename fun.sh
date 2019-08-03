#!/bin/bash
print_red(){
echo -e "\033[31m$1\033[0m"
}

print_blue(){
echo -e "\033[34m$1\033[0m"
}
add(){
echo "scale=10;$1 + $2" |bc
}

mul(){
echo "scale=10;$1*$2" | bc
}
~ 
