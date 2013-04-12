---
layout: page
title:  "Windows"
author: jevon
date:   2013-04-12 20:35:28 +1200
---

==Failed to format the selected partition 0x8004242d==

I came across this error while trying to install Windows 7. It wouldn't let me install over my previous install on a SSD disk, I think because it was BIOS formatted and I now had to install Windows 7 using UEFI. I also could not create a USB bootable disk that would allow BIOS startup (it would report just "Disk error"). How annoying!!

To fix this error, instead of trying to "format" the partition, I just deleted it and then created it new. Now I have three partitions: one System, one MSR (Reserved) and one Primary.

[[Category:Windows]]
[[Category:Troubleshooting]]