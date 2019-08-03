#!/bin/bash
cd /root/lnmp_soft
tar -zxf nginx-1.15.8.tar.gz
cd nginx-1.15.8
./configure  --with-http_ssl_module --with-http_stub_status_module
make
mv /usr/local/nginx/sbin/nginx{,.bak}
cp objs/nginx /usr/local/nginx/sbin/
a="/usr/local/nginx/conf/nginx.conf"
sed -i "47a location /status {" $a
sed -i "48a stub_status on;" $a
sed -i "49a allow 192.168.2.0/24;" $a
sed -i "50a deny all;"  $a
sed -i "51a }" $a
killall nginx
/usr/local/nginx/sbin/nginx
