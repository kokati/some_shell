#!/bin/bash
yum -y install gcc  pcre-devel openssl-devel
cd /root
#rm -rf lnmp_soft 
#userdel nginx
#rm -rf /home/nginx
#tar -zxf lnmp_soft.tar.gz
#cd lnmp_soft
tar zxf nginx-1.12.2.tar.gz
cd nginx-1.12.2/
useradd  -s /sbin/nologin nginx
./configure  --user=nginx --group=nginx --with-http_ssl_module --with-stream --with-http_stub_status_module
make && make install
ln -s /usr/local/nginx/sbin/nginx /usr/sbin/
nginx
yum -y install php php-fpm php-mysql mariadb-devel mariadb mariadb-server
systemctl start php-fpm
systemctl enable php-fpm
systemctl start mariadb
systemctl enable mariadb
echo "/usr/local/nginx/sbin/nginx" >> /etc/rc.local
chmod +x /etc/rc.local
sed -i "65,71s/#//" /usr/local/nginx/conf/nginx.conf
sed -i "69,70d" /usr/local/nginx/conf/nginx.conf
sed -i '68a include  fastcgi.conf;' /usr/local/nginx/conf/nginx.conf
/usr/local/nginx/sbin/nginx -s reload
