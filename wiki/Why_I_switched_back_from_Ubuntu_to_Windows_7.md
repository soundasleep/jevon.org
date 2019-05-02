---
layout: page
title:  Why I switched back from Ubuntu to Windows 7
author: jevon
date:   2015-02-11 17:46:50 +13:00
tags:
  - Ubuntu
redirect_from:
  - "/wiki/Why I switched back from Ubuntu to Windows 7"
---

I tried [Ubuntu](Ubuntu.md) 14.04 LTS at work pretty seriously for a couple of months on my [Lenovo T430s laptop](Computer.md). I really wanted it to work out and found <a href="https://delicious.com/jevonwright/ubuntu">a lot of tricks and guides</a> to clean up the default install; [Ruby](Ruby.md) development on [Windows](Windows.md) is a pain and package management with `apt` is very comfortable.

It has some awesome things.

1. `apt` package management is great. No more clicking through multiple dialogs to install new software; just one line.
1. `git` works correctly and as-designed, without having to use HTTPS workarounds on Windows, because [Git](Git.md) on Windows doesn't come with a SSH keychain.
1. I could set up Winkey keyboard shortcuts directly from the operating system.
1. Writing macrons and other extended characters is <a href="http://blog.triumphovermadness.com/2010/05/easy-macron-input-in-ubuntu-ubuntu.html">extremely pleasurable</a>.
1. Font rendering is sometimes better for smaller font sizes.
1. The `terminator` terminal emulator is amazing and very smooth.
1. It's much easier than setting up a VM and trying to get it to play nicely with Windows.
1. [Firefox](Firefox.md) is much faster and [Firebug](firebug.md) does not bug out as much.
1. [Ruby](Ruby.md) tools such as [HAML](haml.md) and [SASS](SASS.md) launch instantly and do not have to go through weird spawn processes to run. This can make build processes much faster.
1. [Ruby](Ruby.md) tools such as [SASS](SASS.md) are less likely to have really weird and hard-to-track bugs <a href="https://github.com/gruntjs/grunt-contrib-sass/issues/189">like this one</a>

However I've decided that Ubuntu just isn't ready for me. It's lots of little, tiny things that cause my productivity to plummet, both regularly and randomly during the day.

1. Every time I started the machine up, I'd get a <a href="http://askubuntu.com/questions/230670/apportcheckresume-recurring-error-and-gnome-shell-fixations">"system error occurred"</a> dialog, but after a software update, asking the dialog to submit the error would cause the dialog to just disappear silently.
1. It was extremely difficult to turn mouse acceleration off. I had to set up a <a href="http://askubuntu.com/questions/22589/how-to-change-my-mouse-wheel-scroll-rate">script to fix it</a> on every login.
1. The interface simultaneously suffers from too many options and not enough options. I was always fighting with the user interface, trying to make it more [Windows](Windows.md)-like. Installing _CompizConfig Settings Manager_ helps a lot, but can make your user interface extremely unstable. Some of these options should probably be defaults in the operating system.
1. Mapping a keyboard shortcut to an application would, if the application was already open, just cause the application to wiggle in the taskbar ("launcher"); it wouldn't actually bring the application to the front.
1. Using the Ubuntu file/application searcher/loader thing would jump around a lot as search results came in, had to be customised to turn off all the advertising introduced by default, and sometimes not be able to find what you're looking for.
1. For some reason [Firefox](Firefox.md) insisted on opening _all_ downloaded files (when opened within Firefox) with the Packer program (which is designed for ZIPs). JPEGs should probably be displayed with an image viewer, Firefox.
1. Pinning an application to the launcher didn't work the same way as [Windows](Windows.md); it was possible to have two groups of the same application open.
1. Most of my laptop hardware keys didn't work, and <a href="http://askubuntu.com/questions/469791/14-04-thinkpad-edge-volume-buttons-stopped-working/534262#534262">some stopped working after an update</a>.
1. Closing my laptop to hibernate the machine would either work fine; not work, running the battery out; shut down the machine, but mouse settings would be all messed up when opening it again; or shut down instead of hibernate.
1. Sometimes, applications will just freeze for ~10-30 seconds, grey up and not take any input. Firefox was really good at doing this.
1. Sometimes, the entire system would freeze for ~10-30 seconds, and one character in a font would become corrupt across all applications permanently. Only logout would fix this.
1. `alt-tab` and `shift-~`, argh. Why is it not possible to get [Windows](Windows.md) style `alt-tab`, which swaps between _all_ windows in the system? On Ubuntu, `alt-tab` just switches between different _applications_ on the system; you have to use a combination of `alt-tab` and `shift-~`, which switches between different _windows_ of the current application.
1. Hold down `alt-tab` and after a delay, would suddenly switch to switching between different instances of the selected application, and there's no way to get back to the previous `alt-tab` behaviour. This is extremely frustrating for a Windows user who uses `alt-tab` a _lot_.
1. When using `alt-tab`, don't try and use the mouse as well to select screens. There will be a lot of fighting and boxing with the interface.
1. Sometimes, windows would simply disappear from the screen. They'd still be listed in the launcher, but you cannot access them at all. You have to restart the application completely.
1. System file dialogs. Why does typing in `".."` cause the file dialog to navigate to some arbitrary, random location on your disk, rather than the parent folder (as it does in [Windows](Windows.md))?
1. System file dialogs did not use the same favourites/left-hand navigation across all instances.
1. File dialogs would sort icons in different orders for seemingly no reason. Sometimes they'd be sorted alphabetically, sometimes they'd be sorted by character, sometimes they'd be sorted by hidden status. Sometimes dialogs would remember your last location; sometimes they'd be using your cwd. Every time a file dialog would open, I'd have to step back and identify _where_ I was, _how_ the files were being displayed, and _how_ I could possibly get to where I wanted to  go.
1. On [Windows](Windows.md) I can easily copy/paste the current folder location from any Explorer window (just click on the address). On Ubuntu there seems to be no way to copy/paste the current folder location.
1. No way to move close buttons from the left-hand side of the top window, to the right-hand side. Surely this shouldn't be that difficult to add as a feature.
1. Sometimes maximizing a window would not actually integrate the menu into the top menu bar, and I'd have two menu bars for the same application, stacked on top of each other. The whole concept of the top menu bar is an abomination when coming from Windows.
1. Chromium crashed. A lot. So much that I couldn't rely on it being stable.
1. GIMP is difficult. I still prefer being productive with my old photo editor.
1. Running Hangouts as a standalone application on Ubuntu was a mess. Somehow I managed to get it to always run maximized and I couldn't restore it.
1. [Ruby](Ruby.md) development is actually about as awkward on Ubuntu as it is on Windows, having to deal with binaries across multiple platforms. It seems Ruby is only for MacOS, and Ruby/MySQL is a very awkward combination.

I've now switched back to Windows and I'm using a <a href="https://twitter.com/soundasleep/status/557663609011339266">combination of terminal software</a> to achieve the same excellent terminal experience. ~~Still need to fix [Git](Git.md) though~~ See [Getting Git to work over SSH in Windows](Getting_Git_to_work_over_SSH_in_Windows.md).
