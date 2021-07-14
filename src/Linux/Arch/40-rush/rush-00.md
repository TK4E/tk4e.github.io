---
title:
date: 2021-07-13 14:35:25
update:
author: TK4E
tags:
  -

---

# rush-00

```sh
rush -j 3 -i in.txt 'rg a'
echo 'I;P;B' | rush -D ';' 'mediainfo --Details kz8Ee8AHMuEA.mp4 | rg "slice_type {}" | wc -l'
echo foo | rush -v v={} 'echo {v}'

```
