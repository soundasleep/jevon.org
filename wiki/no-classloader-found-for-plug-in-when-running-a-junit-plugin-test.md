---
layout: page
title:  "No Classloader Found for Plug-in when running a JUnit Plugin Test"
author: jevon
date:   2011-01-31 06:05:10 +1300
tags:   [JUnit, Java]
---

[JUnit](junit.md) / [Eclipse](eclipse.md)

**No Classloader Found for Plug-in XXX**

If you get this error while you are trying to run [JUnit](junit.md) plugin tests in [Eclipse](eclipse.md), you are missing the required JUnit plugins from your environment.

In your run configuration, go into the 'Plug-ins' tab and add (at the very least) <a href="https://bugs.eclipse.org/bugs/show_bug.cgi?id=216946#c2">the following plugins</a> (<a href="http://dev.eclipse.org/newslists/news.eclipse.tools.jdt/msg23502.html">discussion</a>):

* org.eclipse.pde.junit.runtime
* org.eclipse.jdt.junit
* org.eclipse.jdt.junit.runtime
* org.eclipse.jdt.junit4.runtime

If you have already got the JUnit plugins in your environment, try cleaning and re-building all of your projects.

**at org.eclipse.pde.internal.junit.runtime.RemotePluginTestRunner.getClassLoader**

If this is part of the failure message, you may be having a problem with <a href="https://bugs.eclipse.org/bugs/show_bug.cgi?id=307076">bug 307076</a>: the bundle you are trying to run actually has unresolved dependencies. Make sure all dependencies are available, have no errors (including files out-of-sync) and available in the classpath.
