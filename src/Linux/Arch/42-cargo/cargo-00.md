---
title:
date: 2021-07-13 14:36:54
update:
author: TK4E
tags:
  -

---

# cargo-00

```sh
rustup default nightly
rustup component add llvm-tools-preview
RUSTFLAGS='-C linker=lld' cargo bootimage
qemu-system-x86_64 -drive format=raw,file=/tmp/cargo/target/x86_64-blog_os/debug/bootimage-blog_os.bin


```
