---
layout: page
title:  Slow Subversion Performance over HTTPS
author: jevon
date:   2010-04-19 11:55:56 +12:00
tags:
  - Troubleshooting
  - Windows
redirect_from:
  - "/wiki/slow_subversion_performance_over_https"
  - "/wiki/Slow Subversion Performance Over Https"
  - "/wiki/slow subversion performance over https"
  - "/wiki/Slow_Subversion_Performance_Over_Https"
---

[SVN](SVN.md)

I had a long, and mysterious, problem where trying to execute [SVN](SVN.md) commands on a [Windows](Windows.md) machine over HTTP would execute normally, whereas over HTTPS they would be extremely slow, but only for particular repositories:

```
svn info http://iaml.svn.sourceforge.net/svnroot/iaml : 14 seconds
svn info https://iaml.svn.sourceforge.net/svnroot/iaml : 14 seconds
```

```
svn info http://iaml.googlecode.com/svn/trunk : 7 seconds
svn info https://iaml.googlecode.com/svn/trunk : 37 seconds
```

This would only occur while I was at [Massey](massey.md), and only while I was at my machine. <a href="http://code.google.com/p/support/issues/detail?id=2635#c11">I asked the Google Code side</a> and they assured me it was not a problem on their side.

Eventually, a system administrator came to help me solve the problem. Using <a href="http://live.sysinternals.com/Procmon.exe">Process Monitor</a>, we kept a trace of **svn.exe** and tried to debug how it worked.

It turned out there was a major delay when trying to execute something through **cryptnet.dll**. After disabling cryptnet.dll (and allowing [Windows](Windows.md) to complain), the problem vanished.

Some researching indicated this <a href="http://blogs.msdn.com/dougste/archive/2008/02/29/should-i-authenticode-sign-my-net-assembly.aspx">problem had occurred before</a>: cryptnet.dll was timing out because the machine was not connected to the Internet.

We have to use a proxy in order to use the Internet at Massey. I went into my Internet Connection settings for Windows, and saw that the proxy was being resolved to a script, rather than an actual proxy address. I switched it to a proxy manually, and the problem has gone! Hooray!
