#!/bin/bash

sudo umount /dev/mapper/vaultdrive
sudo cryptsetup close vaultdrive

echo "Encrypted"
