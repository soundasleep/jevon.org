---
layout: page
title:  "Converting MOV files to AVI files"
author: anonymous
date:   2007-03-16 08:16:50 +1300
---

[[Articles]]

It's pretty simple, actually. Download '''mplayer''' (which includes '''mencoder'''), set it up into your path, and then use this simple command line to convert .mov files into .avis (assuming, of course, mplayer can play them):

[quote]mencoder FILE.mov -o OUTPUT_NAME.avi -oac mp3lame -ovc x264[/quote]

This will convert it into an [[x264]] (mpeg-4 video codec)/lame [[mp3]] (mpeg-3 audio codec) .avi, which both mplayer and normal Windows Media codecs can play fine.

Hooray, no more crappy .mov files!

(Note, of course, that this will obviously degrade the quality of both the video and audio, so make backup of the source media.)

[[Category:Articles]]