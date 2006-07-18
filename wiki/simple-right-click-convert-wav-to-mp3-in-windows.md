---
layout: page
title:  "Simple Right Click Convert WAV to MP3 in Windows"
author: anonymous
date:   2006-07-18 19:27:43 +1200
---

==Problem==
There's no easy way to convert [[WAV]] files to [[MP3]] files instantly - usually you have to open up an audio application, load the WAV file, export it as MP3... too much work!

==Solution==
# Download '''lame encoder''' from http://www.free-codecs.com/Lame_Encoder_download.htm
# Extract '''lame.exe''' to somewhere sensible (e.g. ''C:\Program Files\lame.exe'')
# In an Explorer window, go '''Tools > Folder Options'''
# Click on the '''File Types''' tab
# Scroll down to '''WAV'''; select it
# Click on the '''Advanced''' button
# Click '''New...''' to add a new right click association
# In '''Action''', type in ''Lame MP3 128kbps'' (or something descriptive)
# In '''Application used''', type in ''"C:\Program Files\lame.exe" -b 128 -h "%1" "%1-mp3.mp3"'' (including quotes)
# Click '''OK''', '''OK''', '''Close'''
# Voila!

[[Category:Article]]
[[Category:Technology]]