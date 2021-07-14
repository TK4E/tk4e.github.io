---
title:
date: 2021-07-09 08:53:59
update:
author: TK4E
tags:
  -

---

# cat

```sh
cat << done
    # 输入文本  遇到 done 后退出


cat << done >> ou.txt
    # 在 done 之后追加内容


cat << done >> ou.txt > a > b > c
    # 往 ou.txt 中追加文本  并覆盖 a b c 中的内容


cat << eof > q.rs && rustc q.rs && ./q
    # 写一些代码

```
