---
title:
date: 2021-07-09 08:58:16
update:
author: TK4E
tags:
  -

---

# iconv-00


```sh
mkdir v2; for f in *; do iconv -c -f utf-16 -t utf-8 "$f" > ./v2/"${f%.*}_v2.ass"; done
    # utf-16 to utf-8


```
