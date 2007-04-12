---
layout: page
title:  "Setting up a Networked Laserjet 4M Printer"
author: jevon
date:   2007-04-12 12:27:18 +1200
---

[[Articles]]

To set up a networked LaserJet 4M Plus printer, you need to have the printer's IP address. You can then use (in Windows XP) the Add Printer wizard:

# Select a local printer (not a networked printer).
# When it fails to find a Plug and Play printer, select Create a New Port; type of port should be a '''Standard TCP/IP Port'''.
# Enter in the IP address of the Printer (in my case, 192.168.0.19).
# Follow the rest of the wizard like normal.

It probably helps to have had the printer drivers installed previously.

----

To find out the IP address of your LaserJet 4M printer:

# Take the printer offline by pressing the Online button once.
# Press the Menu button until you come to Test Menu.
# Press the Item button until you see Self Test.
# Press the Enter button.
# This will print a test page.
# The IP address will be in one of the boxes and listed under TCP/IP Status. 

[[Category:Article]]