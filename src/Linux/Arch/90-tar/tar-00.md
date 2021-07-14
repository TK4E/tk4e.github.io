# tar

```sh
tar --totals -acf xxx.yyy xxx
    # 将 xxx 打包压缩为 yyy 格式
        # --totals :  显示压缩时的进度条


tar -xvf xxx.tar.zst
    # 解压 zst 格式


tar xxx.zst | tar -xvf
    # 解压 zst 格式


tar -tf in.tar
    # 列出所包含的文件


find . -name '*.mkv' | tar -cvjf my.tar --files-from -
    # 批量提取指定文件


tar -xvf xxx.tar.zst -C /tmp
    # 解压 zst 到 /tmp


pv in.tar.zst |




tar -xvf in.tar -C /tmp
    # 解压 in.tar 到 /tmp


tar -acf in.tar.zst in
    # 打包目录  绝对路径


tar -acf in.tar.zst -C /tmp in
    # 打包目录  相对路径
    # where path = /tmp/in


tar -tf in.tar
    # 列出文件


tar -xf in.tar
    # 提取特定文件


tar -xvf in.tar | head -n10
    # 提取前十行的文件


tar -xvf in.tar ou.txt
    # 提取指定文件


tar --exclude="*/*/*" -tf in.tar
        # --exclude :  遍历的深度
        # -tf :  预览内容
```
