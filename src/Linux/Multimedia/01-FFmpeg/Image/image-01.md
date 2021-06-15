```sh
ffmpeg -f image2 -r 1 -i ./%4d.jpg -r 1 -pix_fmt yuv420p10le -c:v libx265 ou.mkv
    # 把图片合成为视频
  # %4d.jpg  格式为 00001.jpg 00002.jpg 的文件
  # -pix_fmt yuv420p10le  设置视频色深为10bit
  # -c:v libx265  使用 x265编码器


ffmpeg -f image2 -pattern_type glob -framerate 1 -i 'foo-*.jpeg' ou.mkv
    # 在 shell 里也可以这样


ffmpeg -i in.png -vf smartblur=1:1:0 -y ou.png
    # 对付漫画扫图所造成的网纹(模糊图像)


ffmpeg -i ia.jpg -i ib.jpg -filter_complex vstack oab.jpg
    # 纵向(上下) 拼接图片


ffmpeg -i ia.jpg -i ib.jpg -filter_complex hstack oab.jpg
    # 横向(左右) 拼接图片


ffmpeg -r 1 -f image2 -i 00000%3d.jpg -crf 21 -c:v libx265 -pix_fmt yuv420p10le -vf "scale=trunc(iw/2)*2:trunc(ih/2)*2" t.mkv
    # 图片转视频


ffmpeg -loop 1 -i OchiColorTest_v2.png -c:v libx264 -colorspace bt709 -color_trc bt709 -to 0:10 output.mp4
    # 色彩空间转换


for f in *gif;do ffmpeg -f gif -i "$f" -c:v libx264 -crf 21 -pix_fmt yuv420p -vf "scale=trunc(iw/2)*2:trunc(ih/2)*2" "${f%.*}".mkv;done
    # gif to mkv


for f in *jpg ;do ffmpeg -i "$f" -vf "crop=iw/2:ih:0:0" "${f%}_1.jpeg" -i "$f" -vf "crop=iw/2:ih:iw/2:0" "${f%}_2.jpeg";done
    # 左右分割图片
    # iw/2 是指 把输入文件的宽度除2
    # ih 是指 高


ffmpeg -i in.png -s 1245x1786 ou.png
    # 压缩 in.png 的图片尺寸为 1245x1786
    # 注意 这不是通过裁剪的方式处理  而是压缩尺寸
    # 裁剪图片可参考 https://video.stackexchange.com/questions/4563/how-can-i-crop-a-video-with-ffmpeg


ffmpeg -i 1.jpg -i 2.jpg \
-filter_complex "blend=all_mode=difference" ou.jpg
    # 比较图片
    # 需要图片尺寸一样


for f in *; do cd $f; ffmpeg -r 1 -f image2 -pattern_type glob -i '*.jpg' -vf "scale=trunc(iw/2)*2:trunc(ih/2)*2" -crf 21 -c:v libx265 -pix_fmt yuv420p10le $f.mkv; cd ..; done
    # -pattern_type glob 的语法 [] 会因为文件名受到影响  遂使用 cd 来处理


```


---
## plotframes (分析视频比特率并输出为 svg )

```sh
pacman -Sy gnuplot perl-json
curl -OLJ https://raw.githubusercontent.com/FFmpeg/FFmpeg/master/tools/plotframes && chmod +x plotframes
./plotframes -t svg -o output.svg -i input.mkv
ffmpeg --input input.mp4 -map "0:v:0" -codec:v "copy" -frames:v 900 -f "mp4" -movflags "faststart" temp.mp4
plotframes --input temp.mp4 --stream "v:0" --terminal "svg" --output prettygraph.svg
    # 绘制前900帧

```
