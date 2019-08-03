#!/bin/bash
yum -y install mariadb mariadb-server mariadb-devel php php-fpm php-mysql
systemctl start mariadb
systemctl enable mariadb
systemctl start php-fpm
systemctl enable php-fpm

