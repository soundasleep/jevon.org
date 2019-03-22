---
layout: page
title:  "GMF Troubleshooting 4"
author: jevon
date:   2008-09-23 11:38:49 +1200
tags:   [GMF, Technology]
---

Some helpful tips for working with [GMF](GMF.md).

{% include gmf-troubleshooting.md %}

**I get a ClassNotFoundException for a package/class which I removed a long time ago!**
AKA:
**I get the following exception:**
```
org.osgi.framework.BundleException: Exception in org.openiaml.model.model.diagram.part.IamlDiagramEditorPlugin.start() of bundle org.openiaml.model.diagram.
at org.eclipse.osgi.framework.internal.core.BundleContextImpl.startActivator(BundleContextImpl.java:1018)
...
Caused by: java.lang.ExceptionInInitializerError
at org.openiaml.model.model.util.ModelSwitch.<init>(ModelSwitch.java:46)
...
Caused by: org.eclipse.emf.common.util.WrappedException: java.lang.ClassNotFoundException: model.ModelPackage
at org.eclipse.emf.ecore.plugin.RegistryReader$EPackageDescriptor.getEPackage(RegistryReader.java:215)
...
Caused by: java.lang.ClassNotFoundException: model.ModelPackage
at java.lang.ClassLoader.findClass(Unknown Source)
...
Root exception:
java.lang.ExceptionInInitializerError
at org.openiaml.model.model.util.ModelSwitch.<init>(ModelSwitch.java:46)
...
```

Try the following solutions:
1. Deleting all your generated code from .gmfgen and re-generating it
1. Editing plugin.xml - your old package/class may be referenced there!
