#!/bin/bash
while :
do
a=`awk '/Failed password/{print $11}' /var/log/secure  | awk '{ip[$1]++}END{for(i in ip){print ip[i],"-----",i}}'`
echo '<meta http-equiv="refresh" content="3">'>/usr/local/nginx/html/jk.html
echo '<h2> ssh登录失败的IP </h2>' >>/usr/local/nginx/html/jk.html
echo '<hr color=blue>' >> /usr/local/nginx/html/jk.html
echo '失败次数  IP' >> /usr/local/nginx/html/jk.html
echo '<hr color=red>' >> /usr/local/nginx/html/jk.html
echo $a >> /usr/local/nginx/html/jk.html
sleep 10
done

