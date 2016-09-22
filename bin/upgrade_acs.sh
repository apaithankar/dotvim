#!/bin/bash

if [ $# -ne 1 ]; then
  # echo "$0 BOOT_DISK DATA_DISK"
  echo "$0 BOOT_DISK"
  exit 1
fi

echo "Using $BOOT_DISK as boot disk"
BOOT_DISK=$1
CTR_ID=c8e91b34-2e21-42aa-9e39-a5d60fcdb065

echo "Deleting cluster"
./list 10.5.209.107 app_container_cluster delete || exit 1

echo "Stopping Orion"
allssh genesis stop orion || exit 1

echo "Deleting ZK config"
./zk —delete=true || exit 1

echo "Starting cluster"
cluster start

echo "Upgrade fixup"
./upgrade fixup --filename=${BOOT_DISK} --annotation=Orion-VM --ctrid=$CTR_ID

echo "Sending upgrade command"
./upgrade upgrade --filename=${BOOT_DISK} --annotation=Orion-VM

echo "Enable upgrade"
./upgrade enable true
