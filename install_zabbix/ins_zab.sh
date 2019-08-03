#!/bin/bash
yum -y install net-snmp-devel curl-devel
yum -y install libevent-devel-2.0.21-4.el7.x86_64.rpm
tar -xf zabbix-3.4.4.tar.gz
#安装zabbix
cd zabbix-3.4.4
./configure --enable-server --enable-proxy --enable-agent --with-mysql=/usr/bin/mysql_config --with-net-snmp --with-libcurl
make install

# 在数据库中添加zabbix库及用户
sql() {
mysql -e "$1"
}
sql "create database zabbix character set utf8"
sql "grant all on zabbix.* to zabbix@'localhost' identified by 'zabbix'"
cd database/mysql/

# 把zabbix的自带数据导入数据库
sql_in(){
mysql -uzabbix -pzabbix zabbix < $1
}
sql_in schema.sql
sql_in images.sql
sql_in data.sql

#把zabbix的相关页面放到本地nginx的网页文件夹下
cd /root/zabbix-3.4.4/frontends/php/
cp -r * /usr/local/nginx/html/
chmod -R 777 /usr/local/nginx/html/*

#修改zabbix服务的配置文件
sed -i '85s/^# //' /usr/local/etc/zabbix_server.conf
sed -i '119s/^# //' /usr/local/etc/zabbix_server.conf
sed -i '119s/=/=zabbix/' /usr/local/etc/zabbix_server.conf
useradd -s /sbin/nologin zabbix
zabbix_server
# 修改zabbix_agent 的配置文件
sed -i '93s/127.0.0.1/127.0.0.1,192.168.2.5/' /usr/local/etc/zabbix_agentd.conf
sed -i '134s/127.0.0.1/127.0.0.1,192.168.2.5/' /usr/local/etc/zabbix_agentd.conf
sed -i '145s/Zabbix  server/zabbix_server/' /usr/local/etc/zabbix_agentd.conf
sed -i '280s/^# //' /usr/local/etc/zabbix_agentd.conf
sed -i '280s/0/1/' /usr/local/etc/zabbix_agentd.conf
zabbix_agentd

# 安装php相关包,并修改php的配置文件
yum -y install php-gd php-xml
cd /root/
yum -y install php-bcmath
yum -y install php-mbstring
sed -i '878s/^;//' /etc/php.ini
sed -i '384s/30/300/' /etc/php.ini
sed -i '878s/=/= Asia\/Shanghai/' /etc/php.ini
sed -i '672s/8/32/' /etc/php.ini
sed -i '394s/60/300/' /etc/php.ini
systemctl restart php-fpm
