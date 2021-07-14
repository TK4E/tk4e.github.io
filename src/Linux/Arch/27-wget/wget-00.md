---
title:
date: 2021-07-09 08:50:12
update:
author: TK4E
tags:
  -

---
## wget

```sh
wget -c -r -l 2 'http://192.168.2.3:8080/' -A mp4,mkv,avi -P ./ -q
        # -c :  断点续传
        # -l :  递归的层数
        # -r :  递归下载目录
        # -A :  指定需要下载的文件的后缀
        # -P :  下载文件到位置
        # -q :  隐藏输出

```
