---
layout: page
title:  No runnable methods with JUnit and Eclipse
author: jevon
date:   2009-08-10 10:05:29 +12:00
tags:
  - Troubleshooting
redirect_from:
  - "/wiki/no_runnable_methods_with_junit_and_eclipse"
  - "/wiki/No Runnable Methods With Junit And Eclipse"
  - "/wiki/no runnable methods with junit and eclipse"
  - "/wiki/No_Runnable_Methods_With_Junit_And_Eclipse"
---

[Eclipse](Eclipse.md) / [JUnit](junit.md)

I was having an issue with a JUnit plug-in test that I had just developed, throwing this exception:

`java.lang.Exception: No runnable methods`

The main reason for this error was that I was trying to run JUnit 4 tests on a JUnit 3 test case.

To resolve this, I found out I had a **junit-4.5.jar** that had been imported as part of the classpath, so I had to remove this.

I also had to edit the launch configuration manually to reset the test runner from JUnit 4 to JUnit 3.

(Also make sure you have the correct "required plugin" set, to _org.junit_ or _org.junit4_.)
