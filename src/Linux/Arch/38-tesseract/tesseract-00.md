---
title:
date: 2021-07-13 14:23:13
update:
author: TK4E
tags:
  -

---
# tesseract-00

```sh
tesseract --help-extra
    # 帮助


tesseract -l jpn foo.png -
    # 输出到终端
        # -l :: 选择需要识别的语言


tesseract -l jpn foo.png bar.txt
    # 输出到文件



tesseract -l jpn_vert --oem 3 foo.png -
        # --oem :: 选择识别算法
            # --oem 3 :: 自动选择识别算法


tesseract -l jpn_vert --oem 3 --psm 5 foo.png -
        # --psm :: 需识别的文本的格式
            # --psm 5 :: 垂直文本


# data {
https://github.com/tesseract-ocr/tessdata_best

# }
```
