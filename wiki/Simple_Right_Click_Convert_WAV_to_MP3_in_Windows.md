---
layout: page
title:  Simple Right Click Convert WAV to MP3 in Windows
author: jevon
date:   2015-02-20 12:25:07 +13:00
tags:
  - Article
  - Technology
redirect_from:
  - "/wiki/Simple Right Click Convert WAV to MP3 in Windows"
---

## Problem
There's no easy way to convert [WAV](wav.md) files to [MP3](mp3.md) files instantly - usually you have to open up an audio application, load the WAV file, export it as MP3... too much work!

## Solution
1. Download **lame encoder** from <a href="http://www.free-codecs.com/Lame_Encoder_download.htm">http://www.free-codecs.com/Lame_Encoder_download.htm</a>
1. Extract **lame.exe** to somewhere sensible (e.g. `C:/Program Files/lame.exe`)
1. In an Explorer window, go **Tools > Folder Options**
1. Click on the **File Types** tab
1. Scroll down to **WAV**; select it
1. Click on the **Advanced** button
1. Click **New...** to add a new right click association
1. In **Action**, type in _Lame MP3 128kbps_ (or something descriptive)
1. In **Application used**, type in the following (including quotes): `"C:/Program Files/lame.exe" -b 128 -h "%1" "%1-mp3.mp3"`
1. Click **OK**, **OK**, **Close**
1. Voila! You can now right click [WAV](wav.md) files in [Windows](Windows.md), and an option will appear to convert it automatically into an [MP3](mp3.md). You can also do this for batch conversion.

## Solution 2
If you have [Winamp](Winamp.md) installed, you can use the _Format Converter_ built-in. Simply drop the file into your playlist, right click it and select "Send To > Format Converter".
