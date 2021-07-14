---
title:
date: 2021-07-13 14:43:12
update:
author: TK4E
tags:
  -

---

```sh
# mount {
rclone mount 233
  # Downloads \
--umask 0000 \
--default-permissions \
--allow-non-empty \
--allow-other \
--transfers 12 \
--buffer-size 64M \
--low-level-retries 200 --daemon -v --no-modtime
# }



# copy {
rclone copy /bt 233:/w --fast-list --transfers=40 --checkers=40 --tpslimit=10 --drive-chunk-size=1M --max-backlog 200000 --verbose --log-file=/l.log
# }
```
