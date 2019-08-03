#!/bin/bash
#a=`virsh list |awk 'NR>=3{print $2}'`
a=`virsh list |awk 'NR>=3{print $2}'`
echo $a
for i in $a
do
echo $i
virsh destroy $i
done
