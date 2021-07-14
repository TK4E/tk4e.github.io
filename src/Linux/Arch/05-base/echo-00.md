---
title:
date: 2021-07-13 14:32:23
update:
author: TK4E
tags:
  -

---

# echo-00

```sh
# {
FILE="example.tar.gz"

echo "${FILE%%.*}"
example

echo "${FILE%.*}"
example.tar

echo "${FILE#*.}"
tar.gz

echo "${FILE##*.}"
gz

# }

```
