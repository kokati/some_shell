#!/bin/bash
/etc/init.d/redis_6379 stop
sed -i '815s/^/# /' /etc/redis/6379.conf
sed -i '823s/^/# /' /etc/redis/6379.conf
sed -i '829s/^/# /' /etc/redis/6379.conf
rm -rf /var/lib/redis/6379/*
/etc/init.d/redis_6379 start
