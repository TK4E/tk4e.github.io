---
title:
date: 2021-07-13 14:44:57
update:
author: TK4E
tags:
  -

---


```sh
-crf <1..51>
    # 动态比特率(我通常用 [16-18] 或 [21-28])
    # 如果你有两个体积不同(1G 与 7G) 但内容相同的视频
      # 在你使用相同的 -crf 后  压制出来的两个文件体积很可能相差无几
      # 所以千万不要因为视频体积大就贸然的使用过大的 -crf 值
-b:v <>
    # 静态比特率(除特殊情况外不使用)
-c:v libx265
    # 使用 x265 编码器
-pix_fmt yuv420p10le
    # 10bit色彩深(值越大支持的颜色就越多  当然体积也越大)  (x265 下通常用 10bit 因为这个在压缩率方面特别优化过  且支持的色彩一般够用)
-vframes number (output)
    # 设置录制视频帧的个数这是 -frames:v 的别名
-r[:stream_specifier] fps (input/output,per-stream)
    # 设置帧率(Hz 值   分数或缩写)
-s[:stream_specifier] size (input/output,per-stream)
    # 设置帧大小格式为 wxh (默认与源相同)
-aspect[:stream_specifier] aspect (output,per-stream)
    # 设置视频显示长宽比
-vn (output)
    # 忽略视频流
-vcodec codec (output)
    # 设置视频 codec这是 -c:v 的别名
-pass[:stream_specifier] n (output,per-stream)
    # 选择pass number (1 or 2)用来进行双行程视频编码。
-passlogfile[:stream_specifier] prefix (output,per-stream)
    # 设置 two-pass 日志文件名前缀  默认为"ffmpeg2pass"
-vf filtergraph (output)
    # 创建 filtergraph 指定的过滤图  并使用它来过滤流
-pix_fmt[:stream_specifier] format (input/output,per-stream)
    # 设置像素格式
-sws_flags flags (input/output)
    # 设置软缩放标志
-vdt n
    # 丢弃阈值
-psnr
    # 计算压缩帧的 PSNR
-vstats
    # 复制视频编码统计信息到vstats_HHMMSS.log
-vstats_file file
    # 复制视频编码统计信息到 file
-force_key_frames[:stream_specifier] time[,time...] (output,per-stream)
-force_key_frames[:stream_specifier] expr:expr (output,per-stream)
    # 在指定的时间戳强制关键帧
-copyinkf[:stream_specifier] (output,per-stream)
    # 当进行流拷贝时  同时拷贝开头的非关键帧
-hwaccel[:stream_specifier] hwaccel (input,per-stream)
    # 使用硬件加速来解码匹配的流
-hwaccel_device[:stream_specifier] hwaccel_device (input,per-stream)
    # 选择硬件加速所使用的设备该选项只有-hwaccel同时指定时才有意义。




ABR
    # 平均码率(基本不用)

CBR
    # 静态码率(基本不用)

VBR
    # 动态码率(推荐使用)
    -qmin 900k -qmax 1800k -qdiff 5000k

VBV
    # 约束码率(我喜欢用)
    -crf 24 -maxrate 10000k -bufsize 10000k
      # -crf 决定下限  -maxrate 决定上限(在 约束 前加个 尽量 可能表达的更正确)
        # 不是太懂 -bufsize 这玩意  当他对于 3*maxrate 时  视频欠码(明显)  当等于 5*maxrate 时  貌似没有欠码  但如果等于 1*maxrate 视频没有欠码(日本动画)
        # 看了 wiki 后感觉这个功能是  把多个帧放到一个盒子里  以给其他功能做参考  而盒子的大小(能放多少帧) 则取决于 值 的大小(好像有些问题)
        # 播放视频视频时好像 必须先填充满缓冲区 才可以播放  不然就要等待缓冲(经常见到的小圆圈)
        # 而缓冲区的大小又和解码时 CPU/GPU 的压力大小成正比  但缓冲区过大  硬件的压力过高  为缓解压力  解码时丢帧

VFR
    # 动态帧率(基本不用)
    -vsync 2

2-Pass
    # 利用第一次编码视频生成的数据为参考进行2次编码  非常耗时
    # 也许只对高画质视频有好处  低画质视频不建议用





ffmpeg -i "concat:1x11.ts|ts/1x11-2.ts" -c copy 1x11.mkv
    # 拼接视频文件


ffmpeg -i in.mp4 -vf "setpts=1.25*PTS" -fps 30 -r 23.97 ou.mp4
    # 输出 帧率为 23.97 的视频
  # -fps 30  以每秒最多可编码30帧
  # -r 23.97  设置输出的视频帧率为 23.97



ffmpeg -i 02.mkv -i 02.opus -c copy -map 0 -map 1 -y 002.mkv
    # 合并音频与视频


ffmpeg -ss 10 -t 15 -i in.mkv -c copy -strict experimental ou.mkv
    # 精准切割时间戳


ffmpeg -i in.m3u8 -c copy ou.ts
    # 下载 m3u8 的视频


ffmpeg -i "concat:1.ts|2.ts|3.ts" -c copy n.ts
    # 将文件 1 2 3 合并为 n.ts
  # -c copy 直接复制流 (音频与视频)
  # -c:v 只复制视频流
  # -c:a 只复制音频流


ffmpeg -i v.mkv -i a.wav \
-map 0 -map 1:a \
-c copy -shortest n.ts
    # 合并视频流与音频流


ffmpeg -i "1.ts" \
-map 0:0 \
-map 0:2 \
-map 0:1 \
-c copy n.ts
    # 调换 流0:2 与 流0:1 的顺序  流0:0 保持不变


ffmpeg -ss 00:00:20 -to 00:00:30 -i 1.mkv -c copy n.ts
    # 精准切割(耗时)
  # -ss
  # 启始位置  00:00:00.000 (default)
  # hh:mm:ss.xxx 时:分:秒.xxx
  # -t 持续时长 格式同上
  # -to 结束位置 同上
  # 使用 -ss xxx -to xxx 的组合容易操作
  # -t 与 -to 互斥  不要同时使用


ffmpeg -i 1.mkv -ss 00:00:20 -to 00:00:30 -c copy n.ts
    # 非精准切割(省时)
    # 两者之间的不同在于 -i 的位置


ffmpeg -i input.mp4 -vf “setpts=0.5*PTS” output.mp4
    # 加速视频


ffmpeg -i input.mp4 -vf “setpts=2.0*PTS” output.mp4
    # 减速视频


ffmpeg -i 02.mkv -i 02.opus -c copy -map 0 -map 1 -y 002.mkv

```
