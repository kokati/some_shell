#!/bin/bash
cd /root
rm -rf /root/redis-4.0.8
yum -y install gcc
tar -zxf redis-4.0.8.tar.gz
cd /root/redis-4.0.8
make && make install
yum -y install expect
expect /root/redis.exp

