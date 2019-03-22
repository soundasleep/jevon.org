---
layout: page
title:  Installing Soundblaster Live! Drivers in Windows XP
author: jevon
date:   2008-06-18 07:40:06 +12:00
tags:
  - Article
  - Troubleshooting
redirect_from:
  - "/wiki/installing_soundblaster_live!_drivers_in_windows_xp"
  - "/wiki/Installing Soundblaster Live! Drivers In Windows Xp"
  - "/wiki/installing soundblaster live! drivers in windows xp"
  - "/wiki/Installing_Soundblaster_Live!_Drivers_In_Windows_Xp"
---

[Articles](Articles.md)

Well, you wouldn't think this is difficult, but holy crap, it's taken me two hours to get to this solution.

I was having problems installing the soundcard drivers for my Soundblaster Live! 5.1 Value on Windows XP SP2, because it kept returning a **"ctdevcon.dll has returned an error"** message when I tried to open up the Creative Surround Mixer (which you need to enable 4 channel sound for some reason). It may have something to do with the fact that I also have onboard sound... but I'd like this enabled as well. (Don't ask.)

## My Solution

**A: Completely clear up all drivers from your system**
1a: Go into Add/Remove Programs and uninstall the drivers. Click No to if you want to restart.
1b: Go into Device Manager and disable ALL other audio devices, including onboard. If any Soundblaster entries are still in there, _uninstall_ them.
1c: Restart.

2: Once restarted, Windows might decide it knows better and reinstall the drivers you were just trying to clean out. Cancel this if you can; if, like me, Windows doesn't even give you that option, just let it do what it wants, but don't restart when it asks you to, and continue.
(NOTE: The WDM drivers that are on Windows Update for the Soundblaster are pretty useless. They don't give you access to the advanced features that you can only get with the proper driver pack.)
2b: Go back into Device Manager, and once again, uninstall all Soundblaster devices and disable all the other audio devices.
2c: You now need to find the **"CtZap"** program. In the "LiveDrvUni" pack that you download, you can find this in **"Audio\Drivers\Ctzapxx.exe"**, if you extract this .exe into a folder (or open it with Winzip/Winrar).
2d: Run this CtZap program, and specify it to _Uninstall_ the drivers. Click OK and restart your computer once it's done.

**B: Install the real drivers**
3a: Once restarted, Windows might _once again_ decide it knows better. Whatever. Ignore it this time.
3b: You can now install the **"LiveDrvUni"** driver pack directly. Install everything etc.
3c: Restart when prompted.

**C: Test**
4: We're now into our fourth boot. But, if you go into the Surround Mixer now, it should work fine. (I first ran AudioHQ and then Surround Mixer.) Try it out and click the Test button. (Hopefully) success!

**D: Enable other devices**
5: I then decided to cheat death and _go back and re-enable the onboard sound_. This step is entirely optional.
5a: Go back into Device Manager and re-enable it.
5b: Close surround mixer and re-open it; test it to see if it works. Nervous!
5c: Cautiously restart. Test it again. Hooray!

It's completely insane that it takes this long to try and get some good drivers for your Soundblaster. But hopefully this helps anyone in the future. I tried a lot of these steps in a lazy fashion but I think you _have_ to do it in this _exact_ order to get it to work. Good luck!
