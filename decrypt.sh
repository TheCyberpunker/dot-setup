#!/bin/bash

sudo cryptsetup luksOpen /dev/sdb vaultdrive
sudo mount /dev/mapper/vaultdrive /home/ufo/HDbackup
sudo chown -R ufo /home/ufo/HDbackup

echo "Decrypted"
