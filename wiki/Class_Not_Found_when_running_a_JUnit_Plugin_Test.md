---
layout: page
title:  Class Not Found when running a JUnit Plugin Test
author: jevon
date:   2010-02-11 12:00:36 +13:00
tags:
  - Java
  - Testing
  - Troubleshooting
redirect_from:
  - "/wiki/class_not_found_when_running_a_junit_plugin_test"
  - "/wiki/Class Not Found When Running A Junit Plugin Test"
  - "/wiki/class not found when running a junit plugin test"
  - "/wiki/Class_Not_Found_When_Running_A_Junit_Plugin_Test"
---

[Eclipse](Eclipse.md) / [JUnit](junit.md)

I was getting the following stack trace from trying to run a JUnit Plugin Test in [Eclipse](Eclipse.md):

```
Class not found org.openiaml.model.tests.inference.model0_4.LoginHandlerKey
java.lang.ClassNotFoundException: org.openiaml.model.tests.inference.model0_4.LoginHandlerKey
  at org.eclipse.osgi.internal.loader.BundleLoader.findClassInternal(BundleLoader.java:489)
  at org.eclipse.osgi.internal.loader.BundleLoader.findClass(BundleLoader.java:405)
  at org.eclipse.osgi.internal.loader.BundleLoader.findClass(BundleLoader.java:393)
  at org.eclipse.osgi.internal.baseadaptor.DefaultClassLoader.loadClass(DefaultClassLoader.java:105)
  at java.lang.ClassLoader.loadClass(Unknown Source)
  at org.eclipse.osgi.internal.loader.BundleLoader.loadClass(BundleLoader.java:321)
  at org.eclipse.osgi.framework.internal.core.BundleHost.loadClass(BundleHost.java:231)
  at org.eclipse.osgi.framework.internal.core.AbstractBundle.loadClass(AbstractBundle.java:1193)
  at org.eclipse.pde.internal.junit.runtime.RemotePluginTestRunner$BundleClassLoader.findClass(RemotePluginTestRunner.java:38)
  at java.lang.ClassLoader.loadClass(Unknown Source)
  at java.lang.ClassLoader.loadClass(Unknown Source)
  at org.eclipse.jdt.internal.junit.runner.RemoteTestRunner.loadClass(RemoteTestRunner.java:693)
  at org.eclipse.jdt.internal.junit.runner.RemoteTestRunner.loadClasses(RemoteTestRunner.java:429)
  at org.eclipse.jdt.internal.junit.runner.RemoteTestRunner.runTests(RemoteTestRunner.java:452)
  at org.eclipse.jdt.internal.junit.runner.RemoteTestRunner.runTests(RemoteTestRunner.java:683)
  at org.eclipse.jdt.internal.junit.runner.RemoteTestRunner.run(RemoteTestRunner.java:390)
  at org.eclipse.pde.internal.junit.runtime.RemotePluginTestRunner.main(RemotePluginTestRunner.java:62)
  at org.eclipse.pde.internal.junit.runtime.NonUIThreadTestApplication.runTests(NonUIThreadTestApplication.java:23)
  at org.eclipse.ui.internal.testing.WorkbenchTestable$1.run(WorkbenchTestable.java:71)
  at java.lang.Thread.run(Unknown Source)
```

After about two hours of searches turned up nothing, I finally managed to find the solution. Somehow, the "source" entry in my **build.properties** in the given project had been deleted. The solution was to add the following line to **build.properties**:

`source.. = src/`
