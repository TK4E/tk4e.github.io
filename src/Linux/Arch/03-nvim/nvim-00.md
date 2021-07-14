---
title:
date: 2021-07-09 09:09:29
update:
author: TK4E
tags:
  -

---

# nvim-00


## regex

```text
# 交换字符位置 {
> 处理前
abcd

:%s/(a)(.*)(c)(d)/\1\2\4\3\/g
    # 每个 () 表示一组

> 处理后
abdc

# }



# 为所有行加上行号 {

:%!cat -n

:%s/^/\=line(".").",\t"/

:let i=0|g/^/s//\=i.','/ |let i+=1

:g/^/exec "s/^/".strpart(line(".")."   ", 0, 4)

:g/^/exec "s/^/".line(".")."\t"

:%s/^/\=printf('%04d', line('.'))/

# }

```



---
## folding
```text
zc 关闭当前打开的折叠
zo 打开当前的折叠
zm 关闭所有折叠
zM 关闭所有折叠及其嵌套的折叠
zr 打开所有折叠
zR 打开所有折叠及其嵌套的折叠
zd 删除当前折叠
zE 删除所有折叠
zj 移动至下一个折叠
zk 移动至上一个折叠
zn 禁用折叠
zN 启用折叠
```

---
## Global

```text
:v/text/d
    # 删除不包含 text 的行


:g!/text/d
    # 删除不包含 text 的行


:g/^\s\+<frame>\(frame\)\@!\_.*<\/frame>
 xml 相关


:g/\<dog\>/ .w! >> dog.txt | d
    提取包含 dog 的行


:g/^/m0
   上下反转文本


:g/pattern/d _
   删除匹配的所有行


:v/./,/./-j
   合并重复的空白行


:v_._,/./-1join
   合并重复的空白行
```
