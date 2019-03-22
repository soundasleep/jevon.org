---
layout: page
title:  XVID
author: jevon
date:   2007-01-01 10:32:28 +13:00
tags:
  - Technology
redirect_from:
  - "/wiki/xvid"
  - "/wiki/Xvid"
---

If you are trying to load an mplayer/mencoder-created AVI into VirtualDub and you get this error:

**_Couldn't locate decompressor for format 'FMP4' (unknown)**_
_VirtualDub requires a Video for Windows (VFW) compatible codec to decompress video. DirectShow codecs, such as those used by Windows Media Player, are not suitable. Only 'Direct Stream Copy' is available for this video._

This may be because mencoder's libavcodec sets the AVI's [fourcc](fourcc.md) code to FMP4. (Perhaps you don't have a decompressor for FMP4 exactly?) A hack is to force it to use XVID, which is practically identical:

**mencoder input.avi -o output.avi -ovc copy -oac copy -ffourcc XVID**

Source: http://wiki.multimedia.cx/index.php?title=FMP4
