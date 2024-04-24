#!/bin/sh

DISK=/dev/nvme0n1

sed -e 's/\s*\([\+0-9a-zA-Z]*\).*/\1/' << EOF | fdisk "$DISK"
  g # clear the in memory partition table
  n # new partition
  1 # partition number 1
    # default - start at beginning of disk
  +500M # 500 MB boot partition
  n # new partition
  2 # partion number 2
    # default, start immediately after preceding partition
    # default, extend partition to end of disk
  t
  1
  uefi
  w # write the partition table
  q # and we're done
EOF

# Format /boot FAT32
mkfs.fat -F 32 -n NIXBOOT "$DISK"p1
# Format /root BTRFS
mkfs.btrfs -L NIXROOT "$DISK"p2

mount "$DISK"p2 /mnt
mkdir -p /mnt/boot
mount "$DISK"p1 /mnt/boot

nixos-generate-config --root /mnt

vim /mnt/etc/nixos/configuration.nix
