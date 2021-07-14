# xargs-00


```sh
# 从文本创建文件 {
<files.txt xargs -d'\n' touch
xargs -a files.txt -d'\n' touch
# }
```
