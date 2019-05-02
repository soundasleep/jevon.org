---
layout: page
title:  Windows
author: jevon
date:   2015-11-15 09:49:19 +13:00
tags:
  - Windows
  - Troubleshooting
---

[Articles](Articles.md)

1. [Essential Software for Windows](Essential_Software_for_Windows.md)

## Failed to format the selected partition 0x8004242d

I came across this error while trying to install Windows 7. It wouldn't let me install over my previous install on a SSD disk, I think because it was BIOS formatted and I now had to install Windows 7 using UEFI. I also could not create a USB bootable disk that would allow BIOS startup (it would report just "Disk error"). How annoying!!

To fix this error, instead of trying to "format" the partition, I just deleted it and then created it new. Now I have three partitions: one System, one MSR (Reserved) and one Primary.

## Windows could not complete the installation. To install Windows on this computer, restart the installation.
This took me two hours to debug and finally resolve. This error can mean almost anything. There are some important tools that will help you solve this error:

* Shift-F10 - opens up a command prompt
* C:/windows/panther - contains setup logs
* mmc - opens up the management console, you can then add Computer Management (etc) snap-ins
* findstr - <a href="http://superuser.com/questions/300815/command-prompt-msdos-windows-7-grep-equivalent">a grep-ish string finder</a>, so you can `type file | findstr /r /c:"string" /i`

If you are installing Windows pre-SP1, the most common answer on the Internet is that a registry entry over 8KB is trying to be installed. There is a <a href="http://support.microsoft.com/kb/981542">hotfix available</a>, which you can install by copying onto a USB stick and accessing it via command line. Make sure you get the correct (x86 or x64) fix, x64 is hidden away on the captcha'd page. If you try to install over SP1 you will get "This update is not applicable for your computer."

You can also use `tracerpt` to translate the setup log (binary) <a href="http://theblownlightbulb.com/2011/01/03/fix-windows-could-not-finish-configuring-the-system-oobe-error-message/">into a human-readable format</a>, you can do this all within the command prompt. This can help you find invalid/bad registry keys that you can delete with `REG DELETE <key>`:

```
cd /windows/panther
tracerpt setup.etl -o logfile.csv -of CSV
```

Another option is to install Windows 7 <a href="http://social.technet.microsoft.com/Forums/en-US/w7itproinstall/thread/67b56539-d7e6-4642-890c-d4600ba7f6a1/">in legacy mode</a> instead of UEFI mode. I've never had a single problem installing Windows in legacy/BIOS mode. There are some <a href="http://superuser.com/questions/429003/sysprepped-image-will-not-complete-setup">other steps that didn't help me</a>.

But if you are post-SP1, there are significantly fewer options. The answer that worked for me <a href="http://answers.microsoft.com/en-us/windows/forum/windows_7-windows_install/windows-could-not-complete-the-installation-to/bf09c3c5-298b-459f-aed5-4f431b8398f5">was posted by MarkBeacom</a>:

> - Hit SHIFT-F10 to bring up command prompt.
> - type MMC
> - Click File -> Add/Remove Snap-in... (Or CTRL+M)
> - Select Computer Management (Double click and Finish on Local Computer)
> - Click OK
> - Double click Computer Management (Local) -> System Tools -> Local Users and Groups -> Users -> Double Click Administrator -> Uncheck Account is disabled -> OK
> - Now right click Administrator -> Set Password...  ->  Set a decent password to get started.
>
> Now, restart.  Should be good to go.
>
> If this doesn't work try next step:
>
> - SHIFT-F10 to bring up command prompt.
> - type:  CD C:/windows/system32/oobe
> - type msoobe
> - enter
> - Make a generic account and password.  hit finish (if it requests a product key and you have one, enter it now.  if OEM/No key required, just finish).  Set time/date.  Finish.
> - Restart.
> - Should be good to go.

My next idea after this was to check my BIOS settings and turn off any SSD performance options - my `setuperr.log` file was reporting only the following line (which I don't actually think was fatal):

```
2012-07-29 15:49:51, Error      [0x0606cc] IBS    ApplyDiskOperationUsingService: Failed to correctly apply disk operation of type [0xe]; hr = 0x8007009a[gle=0x0000009a]
2012-07-29 15:49:51, Error      [0x060492] IBS    PerformDiskOperation:Disk operation of type [14] failed; hr = 0x8007009a
```

My next three options after this were to:

* Disable UEFI, install using BIOS (I already tried this, I would only get a "disk error" on the command prompt)
* Try to Repair Install using the same install media (not confident this would have worked)
* Use a different install media (e.g. Windows 7 without SP1) to reinstall
* Re-slipstream the ISO image and add all of the device drivers specific to my new hardware (I would have had to learn how to slipstream drivers into an ISO), rewrite the ISO to USB and then reinstall - to verify that it wasn't a driver issue
* Install [Linux](Linux.md) instead.

A lot of the other solutions required access to another existing Windows 7 machine, which I did not have.

## Creating a symbolic directory link

Within a command prompt as administrator:

`mklink /j "c:/virtual directory" "c:/actual source directory"`
