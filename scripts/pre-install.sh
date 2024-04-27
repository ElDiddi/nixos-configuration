#!/bin/sh

while getopts d:l flag
do
    case "${flag}" in
        d) _disk=${OPTARG};;
        p) _pwd=${OPTARG};;
    esac
done

if [[ $_disk == "" ]]; then
  echo "specify disk, e.g. /dev/nvme0n1";
  exit
fi

if [[  $_disk == "/dev/nvme"* ]]; then
  _part1 = "$_disk"p1
  _part2 = "$_disk"p2
else
  _part1 = "$_disk"1
  _part2 = "$_disk"2
fi

sed -e 's/\s*\([\+0-9a-zA-Z]*\).*/\1/' << EOF | fdisk "$_disk"
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
mkfs.fat -F 32 -n NIXBOOT $_part1

# Format /root BTRFS
mkfs.btrfs -L NIXROOT $_part2

mount $_part2 /mnt
mkdir -p /mnt/boot
mount $_part1 /mnt/boot

nixos-generate-config --root /mnt

vim /mnt/etc/nixos/configuration.nix
