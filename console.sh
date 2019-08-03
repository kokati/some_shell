#!/bin/bash
. fun.sh &> /dev/null
. fun1.sh &> /dev/null
echo -e "\033[35;7;1m     WELCOME XX    \033[0m"
line=1
while :
do

#echo  -n $PS1
read -p "[$line]" order
echo -ne "\033[34m  [out]:\033[0m"
$order
let line++
done
~     
