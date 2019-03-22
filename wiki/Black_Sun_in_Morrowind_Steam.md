---
layout: page
title:  Black Sun in Morrowind Steam
author: jevon
date:   2013-02-17 20:36:36 +13:00
tags:
  - Games
redirect_from:
  - "/wiki/Black Sun in Morrowind Steam"
---

[Morrowind](morrowind.md) is a computer game. When I bought my copy off [Steam](steam.md), I had "the issue" with the sun appearing black. After some time, this is what was finally necessary to run it in [widescreen](widescreen.md) on [Windows 7](windows-7.md), and without the black sun:

1. Make sure Morrowind can run
1. Download the <a href="http://www.lowgenius.net/post/2008/05/23/Morrowind-FPS-Optimizer.aspx">Morrowind FPS optimizer</a>, install, and get it working
1. Use the Morrowind FPS optimizer to change the resolution to the widescreen resolution
1. <a href="http://www.bethsoft.com/bgsforums/index.php?s=&showtopic=1066028&view=findpost&p=15491605">Disable the Steam in-game overlay</a> (in Steam, go File > Settings > In-game)
1. Download the MGE 3.8 SVN (you will need a copy of 7zip to extract), <a href="http://sourceforge.net/apps/mediawiki/morrgraphext/index.php?title=Installing_MGE_correctly">install according to instructions</a>
1. Run MGEgui **as an administrator**
1. <a href="http://forums.steampowered.com/forums/showthread.php?p=12907295#2">Follow the instructions here</a> to disable the broken Morrowind sun texture, and replace it with a new shader
1. You need to change the timestamp of the _Data Files/Textures/tx_sun_flash_grey_05.DDS_ file to some time _after_ the timestamp of the root .bsa files. To do this, you can use PHP or Cygwin's touch, but I used the <a href="http://www.petges.lu/index.html">Attribute Changer</a>

MGE 3.8 SVN did not change the resolution of Morrowind, no matter how much I tried.

In order to check that MGE is actually running, add one of the random shaders (e.g. "64 colours") to the shader chain. This will change the colours of Morrowind and will be easily noticed.

If MGEgui crashes with a .Net System.NullReferenceException, make sure that you have properly copied over the **d3d8.dll** and **d8input.dll** from the MGE download.

Finally, you can play Morrowind.
