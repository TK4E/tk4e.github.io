```sh
find -name "*mkv" | parallel rsync -avP {} /destination/directory/
    # 删除20分钟前的文件


find /home/prestat/bills/test -type f -mmin +20 -exec rm {} \;
    # 删除20天前的文件


find /home/prestat/bills/test -type f -mtime +20 -exec rm {} \;


find . -maxdepth 1 -type f -print0 | head -z -n 10 | xargs -0 -r -- cp -t "$destdir" --
    # 复制前10个文件



find ./ -inum "68122192"
    # Search by inode

```

---
```text
-amin n:   查找系统中最后N分钟访问的文件
-atime n:  查找系统中最后n*24小时访问的文件
-cmin n:   查找系统中最后N分钟被改变文件状态的文件
-ctime n:  查找系统中最后n*24小时被改变文件状态的文件
-mmin n:   查找系统中最后N分钟被改变文件数据的文件
-mtime n:  查找系统中最后n*24小时被改变文件数据的文件




```
