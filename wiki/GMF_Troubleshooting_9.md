---
layout: page
title:  GMF Troubleshooting 9
author: jevon
date:   2011-07-21 10:57:03 +12:00
tags:
  - GMF
  - Technology
  - Code Snippets
redirect_from:
  - "/wiki/GMF Troubleshooting 9"
---

[GMF](GMF.md)

{% include gmf-troubleshooting.md %}

**Conflict for xxx.LoadResourceAction':HandlerActivation(commandId=xxx.LoadResourceAction, handler=xxx.part.LoadResourceAction, expression=,sourcePriority=0) HandlerActivation(commandId=xxx.LoadResourceAction, handler=xxx.part.LoadResourceAction, expression=,sourcePriority=0)**

This can occur if, in your generated _plugin.xml_, there are multiple _org.eclipse.ui.commands_ extensions with the same ID.

In my case this occured because my _.gmfgen_ had two _Gen Editor Generator_ > _Context Menu_ items. Perhaps this is from a previous migration. Removing them ensured the error would not happen again.

I wrote <a href="http://code.google.com/p/iaml/source/browse/trunk/org.openiaml.model.tests/src/org/openiaml/model/tests/release/GmfGenTestCase.java?spec=svn1123&r=1123#459">this test case</a> to check against existing gmfgen's to ensure this problem did not regress.

---
**Error initializing element type "org.eclipse.gmf.tests.runtime.emf.type.core.employee": element type with same ID already exists.**

<a href="http://dev.eclipse.org/mhonarc/newsLists/news.eclipse.modeling.gmf/msg01870.html">These errors can be ignored.</a> These errors come from the org.eclipse.gmf.tests.runtime.emf.type.core JUnit test plug-in, which can be removed from your launch configuration.

---
**java.lang.NullPointerException**
**at org.eclipse.gmf.runtime.diagram.ui.layout.FreeFormLayoutEx.layout(FreeFormLayoutEx.java:38)**

This occured when I upgraded to [GMF](GMF.md) 2.2.2. The problem is that I was adding an IFigure programatically to another IFigure without properly adding a new Constraint for the LayoutManager.

The solution was to add a new Rectangle constraint, as in <a href="http://code.google.com/p/iaml/source/detail?r=1740">r1740 of IAML</a>. This also removed the requirement to add a LayoutListener.

---
**Top level node 'Containment Feature' must be available in the diagram 'Domain Element' or its super-class**

This is a validation warning that you can ignore, but it is actually fatal. Trying to generate the diagram code from this .gmfgen will create an invalid line in XXXDiagramUpdater#getXXXSemanticChildren(), looking for a containment feature that doesn't exist.

---
**The "Appearance" Tab in my generated GMF editor is disabled, but only for some nodes.**
**I can't change the colour or font of a label or node in my GMF editor.**

If you specify your own Font style in a **.gmfgraph**, by default the generated **.gmfgen** will have "fixed font" set to **true** for this node, in _Gen Diagram > Gen Top Level Node XXXEditPart > Inner Class Viewmap XXXFigure > Style Attributes_.

If you set this to **false**, the font can now be modified. There was a request in 2007 to <a href="http://dev.eclipse.org/newslists/news.eclipse.modeling.gmf/msg09110.html">disable this "feature" by default</a>.

I added an automated test to remove this in <a href="http://code.google.com/p/iaml/source/detail?r=2302">r2302 of IAML</a>.

---
**Opening a GMF diagram editor is slow.** or
**Closing a GMF diagram editor is slow.** or
**generateUUID() is slow.**

The EMF `generateUUID()` method can be slow on Windows NT-based systems because the random number generator is seeded by listing all of the files in your temporary directory; and if you are like me, your temporary directory is filled with tens of thousands of files. Try emptying your temp folder.

You can also use a batch script: `C:\Documents and Settings\xxx\Local Settings\Temp>del * /s /q /f`

---
**When trying to generate the diagram editor from a .gmfgen file, I get the following exception:**
```
java.lang.NullPointerException
at org.eclipse.gmf.internal.common.codegen.GeneratorBase.doGenerateJavaClass(GeneratorBase.java:367)
at org.eclipse.gmf.internal.common.codegen.GeneratorBase.doGenerateJavaClass(GeneratorBase.java:321)
at org.eclipse.gmf.codegen.util.Generator.generateDomainNavigatorItem(Generator.java:726)
at org.eclipse.gmf.codegen.util.Generator.customRun(Generator.java:254)
at org.eclipse.gmf.internal.common.codegen.GeneratorBase$1.run(GeneratorBase.java:473)
```

The destination of the plugin you are trying to generate may be out of sync with Eclipse. Try refreshing the plugin directory (F5).

---
**Validation failed unexpectedly for 'Node Mapping'. See log for details.** -- **java.lang.ArrayStoreException**

See <a href="http://www.eclipse.org/forums/index.php?t=msg&th=208456">this newsgroup posting</a>.
