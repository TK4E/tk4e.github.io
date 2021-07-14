# Linux

> linux 中 <br />
> 文件名最长为 255个字符 <br />
> 文件路径最大长度为 4096个字符 <br />





## log

```sh
/var/log/cron
    # 记录crond计划任务产生的事件信息

/var/log/dmesg
    # 记录Linux系统在引导过程中的各种事件信息

/var/log/maillog
    # 记录进入或发出系统的电子邮件活动

/var/log/lastlog
    # 记录每个用户最近的登录时间

/var/log/secure
    # 记录用户认证相关的安全事件信息

/var/log/wtmp
    # 记录每个用户登录  注销及系统启动和停机事件

/var/log/btmp
    # 记录失败的  错误的登录尝试及验证事件

```



## Cache

```sh
echo 3 > /proc/sys/vm/drop_caches
    # 会清理系统的cache

1
  - free pagecache
2
  - free dentries and inodes
3
  - free pagecache, dentries and inodes

```



## 时间钟

```
进程的三种状态为 阻塞 就绪 运行

时钟时间 = 阻塞时间 + 就绪时间 + 运行时间
用户CPU时间 = 运行状态下用户空间的时间
系统CPU

```


## RAM

```sh
cat /proc/meminfo
cat /proc/slabinfo

ps -A --sort -rss -o comm,pmem | head -n 11
ps auxf

```
