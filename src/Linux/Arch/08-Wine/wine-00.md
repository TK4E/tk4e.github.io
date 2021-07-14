---
title:
date: 2021-07-13 14:42:11
update:
author: TK4E
tags:
  -

---

```sh
winetricks d3dx9* msxml3 msxml4 vcrun2003 quartz devenum corefonts lucida tahoma d3dcompiler_43

```


```sh
# 关掉 WINEDEBUG

WINEDEBUG=-all game.exe

```



```sh
# 32位

某些游戏只支持 32位
倘若出现打不开游戏的情况
可以尝试下使用 32位 的 wine


win32() {
    WINEARCH=win32 WINEPREFIX=$XDG_DATA_HOME/win32 \
        \wine $1 -force-d3d9
}

```
