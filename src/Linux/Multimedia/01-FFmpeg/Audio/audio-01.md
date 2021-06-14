-b:a <>
    # 静态/动态比特率 (具体情况取决于所用音频编码器的设置)
-c:a libopus
    # 使用 libopus 编码器  ( libopus 默认使用动态比特率)
-af "channelmap=channel_layout=5.1" -mapping_family 1      
    # 处理 5.1杜比 的音频(针对 libopus   一次只能处理一条音轨)
-aframes number (output)
    # 设置录制音频帧的个数这是 -frames:a 的别名
-ar[:stream_specifier] freq (input/output,per-stream)
    # 设置音频采样率
-aq q (output)
    # 设置音频质量这是 -q:a 的别名
-ac[:stream_specifier] channels (input/output,per-stream)
    # 设置音频通道数
-an (output)
    # 禁止音频录制
-acodec codec (input/output)
    # 设置音频codec这是-c:a的别名
-sample_fmt[:stream_specifier] sample_fmt (output,per-stream)
    # 设置音频采样格式
-af filtergraph (output)
    # 创建filtergraph 所指定的过滤图  并使用它来过滤流




# 拆分音频
らびりんず - 夢路らびりんす.log

     Track |   Start  |  Length  | Start sector | End sector 
    ---------------------------------------------------------
        1  |  0:00.00 |  4:03.02 |         0    |    18226   
        2  |  4:03.02 |  4:17.59 |     18227    |    37560   
        3  |  8:20.61 |  4:02.19 |     37561    |    55729   
        4  | 12:23.05 |  4:02.34 |     55730    |    73913   
        5  | 16:25.39 |  4:02.26 |     73914    |    92089   
        6  | 20:27.65 |  4:03.21 |     92090    |   110335   
        7  | 24:31.11 |  4:02.25 |    110336    |   128510   
        8  | 28:33.36 |  4:16.18 |    128511    |   147728   


ffmpeg -i i.wav -segment_times \
00:04:03.02,\
00:08:20.61,\
00:12:23.05,\
00:16:25.39,\
00:20:27.65,\
00:24:31.11,\
00:28:33.36 \
-c copy -f segment %03d.wav
    # 开头和结尾时间不需要写
    # 00: 表示小时  如果流的时长不足一小时可省略
    # 例  如果流的时长为 72分钟 则须写成 01:12:00   其他同理



    # 最近发生一件怪事  这样切割的文件多出了一段无效的部分 (切成其他格式依旧如此)
    # 于是在切割之前先把他们转为 ts 格式  之后再去分割  最后再转换一遍格式

ffmpeg -i i.flac -c:a libopus -b:a 96k -map 0:0 o.ts

ffmpeg -i o.ts -segment_times \
00:04:03.02,\
00:08:20.61,\
00:12:23.05,\
00:16:25.39,\
00:20:27.65,\
00:24:31.11,\
00:28:33.36 \
-c copy -f segment %03d.ts

for f in * ;do ffmpeg -i "$f" -c copy "${f%.*}.opus";done

    # 在这之前我也对之前成功分割的文件进行了测试  结果还是失败  
    # 可能 ffmpeg 出了啥问题吧
    # 好像又是opus的问题
    # 算了  以后再管
    # 在命令里添加 -reset_timestamps 1 就可以了


ffmpeg -i i.wav \
-map 0:a -segment_times \
00:04:03.02,\
00:08:20.61,\
00:12:23.05,\
00:16:25.39,\
00:20:27.65,\
00:24:31.11,\
00:28:33.36 \
-reset_timestamps 1 \
-c:a libopus -b:a 96k -f segment %03d.opus




ffmpeg -i in.flac -af lowpass=3000,highpass=200 -c copy ou.flac
    # 指定 音频Hz范围 截取某段音频  人声频率范围介于300Hz-3000Hz之间 


ffmpeg -lavfi showspectrumpic=s=1920x1080 -i in.flac ou.jpg
    # 音频分贝图


for f in *; do ffmpeg -i $f -c:a libopus -b:a 96k ${f%.*}.opus; done
    # 批量处理


find */*flac -type f -print0 | parallel -0 --load 90 --retries 3 ffmpeg -i {} -c:a libopus -b:a 96k  {.}.opus &
    # 批量处理  针对子目录下的文件


for f in ./*; do ffmpeg -i "$f" -b:a "$1"k -c:a "$2" ./m/"${f%.*}."$2""; done
    # 压缩音频


ffmpeg -i input.aac -i input.mkv ou.mkv
    # 合并音频与视频流


# 拆分音频
ffmpeg -i in.wav -segment_times \
02:03.33,\
03:36.70,\
05:41.44,\
52:10.75 \
-c copy -map 0 -f segment -reset_timestamps 1 %03d.wav


# 保留所有视频流和第三个音频流  序号从 0 开始
for f in *; do ffmpeg -y -i "$f" -c:v copy -c:a libopus -b:a 82k -map 0:v -map 0:m:language:jpn ./0/"${f%.*}_v0.mkv"; done
for f in *; do ffmpeg -y -i "$f" -c:v copy -c:a libopus -b:a 82k -map 0:v -map 0:a:0 ./0/"${f%.*}_v0.mkv"; done
for f in *; do ffmpeg -y -i "$f" -c:v copy -c:a libopus -b:a 82k -map 0:0 -map 0:1 ./0/"${f%.*}_v0.mkv"; done
for f in *; do ffmpeg -y -i "$f" -c:v copy -c:a libopus -b:a 82k -map 0:0 -map 0:2 ./0/"${f%.*}_v0.mkv"; done


find */*flac  -type f -print0 | parallel -0 --load 90 --retries 3 ffmpeg -i {} -c:a libopus -b:a 96k {.}.opus &
    # 并行批量转换格式为 opus


