#!/bin/bash

centos_image=$1
lo_device=`losetup -f`
echo "Using $lo_device to setup $centos_image"
losetup $lo_device $centos_image
kpartx -av $lo_device
mkdir -p /mnt/image
sudo mount /dev/mapper/loop2p1 /mnt/image/
