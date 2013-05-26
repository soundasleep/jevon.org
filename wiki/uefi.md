---
layout: page
title:  "UEFI"
author: jevon
date:   2013-05-27 01:12:57 +1200
---

==My experiences with Ubuntu 12.04 LTS and UEFI==

*Installing [[Ubuntu]] 12.04.2 via UEFI:* First <a href="https://bugs.launchpad.net/ubuntu/+source/debian-installer/+bug/1161771">didn't work on USB disk</a>, had to mount via ISO. 

It still wouldn't setup correctly. This took about two hours because my USB disks were only USB 1.0.

*Installing Ubuntu 12.04.1 via UEFI:* worked straight away (maybe a USB disk error? but the USB disk is brand new).

However I couldn't at all get the machine to boot straight into Ubuntu after install. The machine would get stuck on "Windows Boot Manager: The boot selection failed because a required device is inaccessible". Of course it was inaccessible - I reformatted the disk to install [[Linux]].

I did almost everything I could think of: update the [[Grub]] entries (but the problem occurs before Grub is even loaded), removed the boot entries using efibootmgr, even manually removing files from `/mnt/boot/efi/EFI/Microsoft` (which just broke it further). It seemed like there was a boot entry that couldn't be removed or reset by the BIOS (reset to defaults did nothing), and asserted that a [[Windows]] would _always_ exist.

<a href="http://sourceforge.net/p/boot-repair/home/Home/">Boot-repair</a> was often recommended, but this requires a GUI (i.e. X11) to run.

<a href="http://ubuntuforums.org/showthread.php?t=1857886">Another option</a> was to fix it using a [[Windows]] repair disk, but then you'd have to reinstall Grub afterwards anyway - didn't seem like a reliable option.

Finally I got some sense and disabled UEFI boot completely, and had to reinstall 12.04.1.

*Installing Ubuntu 12.04.1 without UEFI:* Straight away things were better: a graphical boot menu for install, rather than a text menu.

The rest of the install was identical. Now my machine boots perfectly into Ubuntu every time. It also means that my UEFI install is completely broken and I can never use UEFI for anything except Windows.

*Lesson:* Don't use UEFI unless you are absolutely certain you are only _ever_ going to use [[Windows]] on your machine. If you want to use Linux with UEFI, you HAVE to (somehow) remove the Windows UEFI boot manager before uninstalling Windows.

[[Category:Linux]]
[[Category:Ubuntu]]
[[Category:Troubleshooting]]