#!/bin/bash
cd /root
cat > temp.txt << eof
	fastcgi_buffers 8 16k;
	fastcgi_buffer_size 32k;
	fastcgi_connect_timeout 300; 
	fastcgi_send_timeout 300; 
	fastcgi_read_timeout 300;  
eof
sed -i '/http {/r temp.txt' /usr/local/nginx/conf/nginx.conf

