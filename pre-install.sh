#!/bin/sh

while getopts d:l:p flag
do
    case "${flag}" in
        d) DISK=${OPTARG};;
        p) PWD=${OPTARG};;
    esac
done

if [[ $DISK == "" ]]; then
  echo "specify disk, e.g. /dev/nvme0n1";
  exit
fi

PART1 = "$DISK"1
PART2 = "$DISK"2

if [[  $DISK == "/dev/nvme*" ]]; then
  PART1 = "$DISK"p1
  PART2 = "$DISK"p2
fi

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
mkfs.fat -F 32 -n NIXBOOT $PART1

if [ $PWD != "" ]; then
  # format the partition with the luks structure
cryptsetup luksFormat $PART2
$PWD
fi

# Format /root BTRFS
mkfs.btrfs -L NIXROOT $PART2

mount $PART2 /mnt
mkdir -p /mnt/boot
mount $PART1 /mnt/boot

nixos-generate-config --root /mnt

vim /mnt/etc/nixos/configuration.nix
