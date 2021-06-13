# pacman


```sh
pacman -Syu
    # 更新所有包


pacman -Qlq  neovim | grep /usr/bin
    # 查看某个包所包含的命令


pacman -Ss xxx
    # 搜索 xxx
```



## Error
```sh
# unable to lock database
rm /var/lib/pacman/db.lck



```


## makepkg
```sh
pacman -S kernel26-headers file base-devel abs
makepkg -Acs
pacman -U xxx.pkg.tar.zst

```
