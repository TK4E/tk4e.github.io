---
title:
date: 2021-07-13 14:43:42
update:
author: TK4E
tags:
  -

---

# Btrfs-00


```sh
btrfs device stats /


btrfs device stats /dev/sda1


btrfs filesystem usage /


btrfs filesystem defragment -r /
    # 碎片整理


btrfs property set /root/Downloads compression none
    # 为目录关闭压缩选项

```
