---
title:
date: 2021-07-13 14:40:05
update:
author: TK4E
tags:
  -

---

```sh
sqlite3 in.db
sqlite> .read in.sql
    # 运行 .sql


sqlite3 in.db < in.sql
    # 运行 .sql


cat in.csv | sqlite3 in.db
    # 运行 .sql

```
