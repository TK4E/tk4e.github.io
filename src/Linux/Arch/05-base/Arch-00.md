---
title:
date: 2021-07-13 14:39:24
update:
author: TK4E
tags:
  -

---

# Arch-00


---
```sh
reboot
    # 重启


shutdown -h 0
    # 0秒后关机


echo mem > /sys/power/state
    # 挂起


echo disk > /sys/power/state
    # 休眠


xev | grep key
    # 显示按下的键的名称


lspci | grep VGA
    # 查看图形卡型号


dmesg | grep VRAM
    # 查看VRAM数量


sort in.txt | uniq > ou.txt
    # 排序后去重文本


# HDD 电源管理 {
hdparm -C /dev/sdb
    # 查看信息

smartctl -i -n standby /dev/sdb
    # 查看信息(不通电)

idle3ctl -s 138 /dev/sdb
    # 低耗模式下五分钟后降速度
}



sleep 5; import 123.png
    # 等待5秒截屏


import -frame 123.jpg
    # 截取鼠标点击的那个窗口


import -windows root 123.png
    # 截取全屏幕






### 跳过开头若干字节快速拷贝文件
{ dd bs=41 skip=1 count=0; cat; } < input.bak > result.bak
        # bs=41 :  令每一个 block 的大小为 41b
                 # 也就是跳过开头 41b 大小的内容
        # skip=1 :  跳过 1 个 block




date '+%Y-%m-%d    %H:%M:%S'
    # 自定义时间格式


watch -n 1 cat /proc/sys/kernel/random/entropy_avail
    # 查看熵


balooctl disable
pacman -Qsq | grep -Ei 'fcitx5|mozc'
pacman -S fcron && systemctl enable fcron.service
pacman -S $(< pkglist)     OR
pacman -S --needed $(diff <(cat badpkglist|sort) <(diff <(cat pkglist|sort) <(pacman -Slq|sort)|grep \<|cut -f2 -d' ')|grep \<|cut -f2 -d' ')


pacman -S --overwrite "*" <package_name>
    # 强制安装包

rm /var/lib/pacman/db.lck
    Server = http://mirrors.neusoft.edu.cn/archlinux/$repo/os/$arch


pulseaudio --start --log-target=syslog


tac a.txt > b.txt
    # 反转文件行顺序


rev a.txt
    # 反转字符


sync
    # 将缓存写入磁盘并清理缓存


rmdir
    # 删除空文件夹


ptx
    # 针对文件内容生成关键字索引


shuf
    # 将文件内容随机排序输出


sum
    # 计算文件的大小及其占用的块（block）数


uniq
    # 从有序文件中删除重复行


sponge
    # 就地修改文件
        lua-format plugins.lua | sponge plugins.lua


xargs -d '\n' file < in.txt
    # 从文件中读取
        # -d '\n'  以换行符为分隔符号


fc-cache -fv
    # 清理字体缓存


timedatectl set-timezone "Asia/Shanghai"


pacman -Sy lxappearance-gtk3 qt5ct alsa-utils

```

---

```sh
tcpdump
  # 抓包工具
sensors
  # 查看 CPU 温度
        while true; do sensors | rg temp1; sleep 5; clear; done
cat /proc/cpuinfo
  # 查看 CPU 型号
bandwhich
  # 按连接/端口查看流量
qalculate
  # 计算器
nmcli
  # 替代 ip
ark
  # 压缩包管理
# copyq
  # 剪切板
vifm
  # 终端文件管理器
mpv+encode
  # 剪切视频
# gwenview / feh / # sxiv / chafa
  # 查看图片
aseprite
  # 像素画
krita
  # 画图
imagemagick / # flameshot
  # 截图
# yacreader
  # 漫画阅读

uutils-coreutils


zathura
  # 漫画阅读 / pdf阅读

tesseract
  # OCR
    gimagereader-qt
lsof:
    lsof |grep deleted
kompare
  # diff
subtitlecomposer
  # 字幕编辑
Kdenlive
  # 视频编辑
qbittorrent
  # bt下载

ffmpeg
  # 视频处理
VapourSynth
  # 视频滤镜
tesseract
  # OCR

gnuplot/python-seaborn/labplot2
  # 图表

xcolor
  # 提取颜色

lottie
  # lottie_convert.py in.tgs ou.html

Picard
  # 音乐元数据
dmesg
  # 系统日志
    journalctl:
glyrc

wireshark

mpd+mpc+ncmpcpp
  # 音乐播放器

parallel
  # 并行任务
        parallel 'guetzli --quality 84 {} {.}.jpg' ::
  # *.png

hyperfine
  # 对比多个命令的速度


traceroute / besttrace
  # 路由追踪


Blender
  # 3D

```

