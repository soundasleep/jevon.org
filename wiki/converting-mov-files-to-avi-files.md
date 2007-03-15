---
layout: page
title:  "Converting MOV files to AVI files"
author: jevon
date:   2007-03-16 10:49:04 +1300
---

[[Articles]]

It's pretty simple, actually. Download '''<a href="http://www.mplayerhq.hu">mplayer</a>''' (which includes '''mencoder'''), set it up into your path, and then use this simple command line to convert .mov files into .avis (assuming, of course, mplayer can play them):

[code]mencoder FILE.mov -o OUTPUT_NAME.avi -oac mp3lame -ovc x264[/code]

This will convert it into an [[x264]] (mpeg-4 video codec)/lame [[mp3]] (mpeg-3 audio codec) .avi, which both mplayer and <a href="http://www.free-codecs.com/FFDShow_download.htm">normal Windows Media codecs</a> can play fine.

Hooray, no more crappy .mov files!

(Note, of course, that this will obviously degrade the quality of both the video and audio, so make backup of the source media.)

[[Category:Articles]]