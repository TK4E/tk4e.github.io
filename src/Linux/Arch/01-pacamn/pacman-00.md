---
title:
date: 2021-07-13 14:39:36
update:
author: TK4E
tags:
  -

---

# pacman-00


---
## pacman
```sh
yes | LC_ALL=en_US.UTF-8 pacman -Syu
    # 自动回答 yes


pacman -Syu
    # 更新所有包


pacman -Qlq  neovim | grep /usr/bin
    # 查看某个包所包含的命令


pacman -Ss xxx
    # 搜索 xxx


pacman -Qqe
    # 创建已安装的包的列表


pacman -Qqen
    # 创建已安装的包的列表  但排除外部包


pacman -Qqem
    # 创建已显式安装的外部包的列表


```


---
## pactree

```sh
pactree linux
    # 显示包的依赖树

```


---
## pacman-contrib

```sh
pacman -S pacman-contrib


paccache -rk1
    # 仅保留一个过去的版本的包缓存

```


---
## Error
```sh
# unable to lock database
rm /var/lib/pacman/db.lck



```

---
## makepkg
```sh
pacman -S kernel26-headers file base-devel abs
makepkg -Acs
pacman -U xxx.pkg.tar.zst

```


