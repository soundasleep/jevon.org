---
layout: page
title:  "Windows XP Automatically Logs Out"
author: jevon
date:   2010-07-18 15:56:21 +1200
tags:   [Article, Windows]
---

[Articles](Articles.md)

I had a problem where trying to remotely log into a Windows XP machine would show the login process and play the login sound, but then instantly log off (and play the logout sound).

A bit of searching found the apparently culprit: The <a href="http://www.pctipsbox.com/windows-logs-off-automatically-while-login/">userinit.exe process was incorrectly referenced</a>:

1. Connect the infected computer to a network which has at least one healthy computer connected. Power on both of the computers
1. From the healthy computer, Go to _Start > Run_, type `regedit.exe` and press enter. This will launch the registry editor
1. Go to _File > Connect Network Registry_, by using this infected computer’s name or IP address
1. Locate this entry `HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon\`
1. At this entry there is a key names userinit, double click on the key and set its value to `C:\WINDOWS\System32\userinit.exe,`
1. Exit the registry editor, restart the infected computer.

However, my registry key was already this, and it was still failing after manually setting it.

It turned out the problem was that because I had recently cloned the hard drive, Windows had renamed the new drive from C: to E:. Consequently, while Windows could start (because there was only one boot partition), it couldn't find the location of the userinit.

I played around in the remote registry until I found out how to rename the new E: to C:

1. Open the registry remotely (as above)
1. Browse to `HKEY_LOCAL_MACHINE\SYSTEM\MountedDevices`
1. There should be at least two entries; one for C: and one for E:, under `\DosDevices\C:` and `\DosDevices\E:`
1. Rename the two keys around. Restart the machine and try logging in again.
