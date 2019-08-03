#!/bin/bash
cd /root
tar -xf mysql-5.7.17.tar
yum -y install mysql-community*
systemctl start mysqld
systemctl enable mysqld
