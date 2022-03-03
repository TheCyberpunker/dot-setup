#!/bin/bash

sudo cryptsetup luksOpen /dev/sdb vaultdrive
sudo mount /dev/mapper/vaultdrive /home/ufo/Desktop/backup
sudo chown -R ufo /home/ufo/Desktop/backup

echo "Decrypted"
