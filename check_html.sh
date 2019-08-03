#!/bin/bash
a=`curl 192.168.2.200 |md5sum |awk '{print $1}'` &> /dev/null

while :
do
	b=`curl 192.168.2.200 |md5sum |awk '{print $1}'` &> /dev/null
	if [ $a != $b ];then
	echo "网页被人篡改了!!!!!!!!!!"
	break
	fi
	sleep 2
done
