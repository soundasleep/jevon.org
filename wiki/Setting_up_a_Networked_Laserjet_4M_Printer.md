---
layout: page
title:  "Setting up a Networked Laserjet 4M Printer"
author: jevon
date:   2007-04-12 12:27:18 +1200
tags:   [Article]
---

[Articles](Articles.md)

To set up a networked LaserJet 4M Plus printer, you need to have the printer's IP address. You can then use (in Windows XP) the Add Printer wizard:

1. Select a local printer (not a networked printer).
1. When it fails to find a Plug and Play printer, select Create a New Port; type of port should be a **Standard TCP/IP Port**.
1. Enter in the IP address of the Printer (in my case, 192.168.0.19).
1. Follow the rest of the wizard like normal.

It probably helps to have had the printer drivers installed previously.

----

To find out the IP address of your LaserJet 4M printer:

1. Take the printer offline by pressing the Online button once.
1. Press the Menu button until you come to Test Menu.
1. Press the Item button until you see Self Test.
1. Press the Enter button.
1. This will print a test page.
1. The IP address will be in one of the boxes and listed under TCP/IP Status.
