---
title:
date: 2021-07-09 09:05:46
update:
author: TK4E
tags:
  -

---

# mplayer

```sh
mplayer dvdnav://1 -dumpstream -dvd-device 1.iso -dumpfile 1.ts
    # DVD to ts

mplayer dvdnav:// -frames 0 -identify -vo null -ao null -nocache -dvd-device 1.iso
    # show media

```
