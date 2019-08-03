#!/bin/bash
for i in {16..23}
do
virsh start tedu_node$i
done
