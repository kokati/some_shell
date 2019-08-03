#!/bin/bash
#echo "192.168.4.50 ceph1
#192.168.4.51 ceph2
#192.168.4.52 ceph3
#" >> /etc/hosts
#yum -y install ceph-mon ceph-osd ceph-mds
parted /dev/vdb mklabel gpt
parted /dev/vdb mkpart primary 1 50%
parted /dev/vdb mkpart primary 50% 100%
chown ceph.ceph /dev/vdb1
chown ceph.ceph /dev/vdb2
echo '"ENV{DEVNAME}=="/dev/vdb1",OWNER="ceph",GROUP="ceph"
ENV{DEVNAME}=="/dev/vdb1",OWNER="ceph",GROUP="ceph"'> /etc/udev/rules.d/70-vdb.rules

