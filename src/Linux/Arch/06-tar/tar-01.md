# tar

```sh
tar --totals -acf xxx.yyy xxx
    # 将 xxx 打包压缩为 yyy 格式
    --totals : 显示压缩时的进度条


tar -xvf xxx.tar.zst
    # 解压 zst 格式


tar xxx.zst | tar -xvf
    # 解压 zst 格式


tar -tf in.tar
    # 列出所包含的文件


find . -name '*.mkv' | tar -cvjf my.tar --files-from -
    # 批量提取指定文件


pv in.tar.zst |
```
