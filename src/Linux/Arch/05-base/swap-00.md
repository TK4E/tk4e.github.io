# swap-01

## swapfile

---
### XFS / ext4

```sh
swapoff -a
    # turn off swap
rm -i /swapfile
    # remove old /swapfile

dd if=/dev/zero of=/swapfile bs=1M count=1024

chmod 600 /swapfile
    # set proper file protections
mkswap /swapfile
    # init /swapfile
swapon /swapfile
    # turn on swap

free -h
    # confirm 1G swap

echo '/swapfile none swap defaults 0 0' >> /etc/fstab

```

---
### Btrfs

```sh
cd /
truncate -s 0 ./swapfile
chattr +C ./swapfile
btrfs property set ./swapfile compression none

dd if=/dev/zero of=/swapfile bs=1M count=512 status=progress
chmod 600 /swapfile
mkswap /swapfile
swapon /swapfile

echo '/swapfile none swap defaults 0 0' >> /etc/fstab

```
