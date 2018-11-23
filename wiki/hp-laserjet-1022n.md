---
layout: page
title:  "HP LaserJet 1022n"
author: jevon
date:   2015-02-17 19:12:57 +1300
tags:   [Hardware]
---

A printer.

## HP LaserJet 1200n won't stop printing on [Windows](windows.md)

If you have your printer connected via network, it seems the key is to turn off _bidirectional communication_ on the TCP/IP port. <a href="http://www.tomshardware.com/forum/59912-3-1022n-printer-stop-printing#248490">reference</a>

You might also need to completely remove the printer, <a href="http://superuser.com/questions/525155/how-to-completely-remove-printer-from-windows-7">remove the printer drivers themselves</a>, and reinstall:

```
printui /s /t2          (run as administrator)
```
