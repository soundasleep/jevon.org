---
layout: page
title:  Increasing Eclipse Plug-in Performance
author: jevon
date:   2010-04-20 07:37:16 +12:00
tags:
  - Eclipse
  - Java
redirect_from:
  - "/wiki/increasing_eclipse_plug-in_performance"
  - "/wiki/Increasing Eclipse Plug-in Performance"
  - "/wiki/increasing eclipse plug-in performance"
---

[Eclipse](Eclipse.md)

There is not much discussion on how to improve the performance of Eclipse plug-ins. I haven't yet got any real metrics, but some ideas suggested include:

1. In the launch window for running a JUnit test/application, select only the plugins required
1. Reduce the memory and permgen memory settings for a Junit test/application (**this made a big difference**)
1. Identify and remove unused dependencies in each plugin
1. "Apparently Eclipse prefers lots of small projects to one large one" - <a href="http://www.nagarro.com/blog/osgi-from-here-to-there-part-ii/">Split up existing plugins into bundles</a>
1. Reduce the minimum/maximum size of memory/heap size in your _eclipse.ini_
1. Uninstall Eclipse plugins that are not used

Another option is to split your project into multiple development environments. I have recently split a project into two environments - one full environment that requires everything, and a secondary environment which allows me to concentrate on code generation and inference. As a result, starting tests take significantly less time (40-80%, depending on the test).

Also see the <a href="http://www.ibm.com/developerworks/rational/library/05/517_radtip/">Rational Application Developer Performance Tips</a> guide, which is based on Eclipse.
