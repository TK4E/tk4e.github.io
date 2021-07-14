---
title:
date: 2021-07-09 09:05:16
update:
author: TK4E
tags:
  -

---

# sed

```sh
sed -n '/foo/{:start /bar/!{N;b start};/your_regex/p}' your_file
    # 跨行匹配


echo dog dog dos | sed -e 's:dog:log:g'


sed -n 30,40p in.txt
    # 显示 30 至 40 行

```
