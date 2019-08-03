#!/bin/bash
/etc/init.d/redis_6379 stop
ip=`ifconfig eth0|grep inet|awk '{print $2}'`
num=`ifconfig eth0|grep inet|awk '{print $2}'|awk -F "." '{print $4}'`
sed -i "70s/127.0.0.1/$ip/" /etc/redis/6379.conf
sed -i "93s/79/$num/" /etc/redis/6379.conf
sed -i '815s/# //' /etc/redis/6379.conf
sed -i '823s/# //' /etc/redis/6379.conf
sed -i '829s/# //' /etc/redis/6379.conf
sed -i '829s/15000/5000/' /etc/redis/6379.conf
rm -rf /var/lib/redis/6379/*
sed -i "43s/\$REDISPORT/63$num -h $ip/" /etc/init.d/redis_6379 
/etc/init.d/redis_6379 start
