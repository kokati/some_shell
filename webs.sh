#!/bin/bash
/usr/local/nginx/sbin/nginx -s stop
umount /usr/local/nginx/html
sed -i "/192.168.4.40/s/^/#/" /etc/fstab
mount -t ceph 192.168.4.50:6789:/ /usr/local/nginx/html/ -o name=admin,secret=AQCY9RpdPSHoHhAAHqCqwVMn0i7rUli/baC+OQ==
echo 'mount -t ceph 192.168.4.50:6789:/ /usr/local/nginx/html/ -o name=admin,secret=AQCY9RpdPSHoHhAAHqCqwVMn0i7rUli/baC+OQ==' >> /etc/rc.local
chmod +x /etc/rc.local

