---
title:
date: 2021-07-09 08:51:44
update:
author: TK4E
tags:
  -

---

# gstreamer

```sh
gst-launch-1.0 audiotestsrc ! audioconvert ! audioresample ! alsasink
    # audio test
  # [directsoundsink, esdsink, alsasink, osxaudiosink, artsdsink, osssink]


gst-launch-1.0 videotestsrc ! ximagesink
    # video test
  # [xvimagesink, d3dvideosink, ximagesink, sdlvideosink, osxvideosink, aasink]


gst-launch-1.0 playbin uri=file:///dev/shm/music.opus
    # auto play audio/video

```
