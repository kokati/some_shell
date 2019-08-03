#!/bin/bash
for i in {50..58}
do
virsh start sql$i
done
