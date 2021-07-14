---
title:
date: 2021-07-13 14:43:36
update:
author: TK4E
tags:
  -

---

```sh
##  https
openssl req -newkey rsa:4096 \
           -x509 \
           -sha256 \
           -days 3650 \
           -nodes \
           -out example.crt \
           -keyout example.key \
           -subj "/C=CN/ST=GD/L=GZ/O=no/OU=no Department/CN=127.0.0.1"
```

