---
layout: page
title:  NoClassDefFoundError when running JUnit Plug-in Tests with JARs
author: jevon
date:   2009-07-23 10:38:45 +12:00
tags:
  - Eclipse
  - Java
redirect_from:
  - "/wiki/noclassdeffounderror_when_running_junit_plug-in_tests_with_jars"
  - "/wiki/Noclassdeffounderror When Running Junit Plug-in Tests With Jars"
  - "/wiki/noclassdeffounderror when running junit plug-in tests with jars"
  - "/wiki/Noclassdeffounderror_When_Running_Junit_Plug-in_Tests_With_Jars"
---

[Eclipse](Eclipse.md)

If you are running a JUnit plug-in test within an Eclipse environment that requires .jar libraries, then you can't just add them to the build path through right click > add to build path.

You have to add them to the **plug-in classpath** by editing _MANIFEST.MF_. Otherwise the Eclipse classloader won't be able to find them (it ignores the Eclipse classpath when running a new environment).
