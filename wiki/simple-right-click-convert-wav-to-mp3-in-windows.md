---
layout: page
title:  "Simple Right Click Convert WAV to MP3 in Windows"
author: jevon
date:   2015-02-20 12:25:07 +1300
---

==Problem==
There's no easy way to convert [[WAV]] files to [[MP3]] files instantly - usually you have to open up an audio application, load the WAV file, export it as MP3... too much work!

==Solution==
# Download '''lame encoder''' from <a href="http://www.free-codecs.com/Lame_Encoder_download.htm">http://www.free-codecs.com/Lame_Encoder_download.htm</a>
# Extract '''lame.exe''' to somewhere sensible (e.g. `C:/Program Files/lame.exe`)
# In an Explorer window, go '''Tools > Folder Options'''
# Click on the '''File Types''' tab
# Scroll down to '''WAV'''; select it
# Click on the '''Advanced''' button
# Click '''New...''' to add a new right click association
# In '''Action''', type in ''Lame MP3 128kbps'' (or something descriptive)
# In '''Application used''', type in the following (including quotes): `"C:/Program Files/lame.exe" -b 128 -h "%1" "%1-mp3.mp3"`
# Click '''OK''', '''OK''', '''Close'''
# Voila! You can now right click [[WAV]] files in [[Windows]], and an option will appear to convert it automatically into an [[MP3]]. You can also do this for batch conversion.

==Solution 2==
If you have [[Winamp]] installed, you can use the ''Format Converter'' built-in. Simply drop the file into your playlist, right click it and select "Send To > Format Converter".

[[Category:Article]]
[[Category:Technology]]