---
layout: page
title:  Having Multiple Containments of the Same Domain Element in GMF
author: jevon
date:   2010-02-24 13:17:22 +13:00
tags:
  - GMF
  - Java
redirect_from:
  - "/wiki/Having Multiple Containments of the Same Domain Element in GMF"
---

{% include gmf-css.md %}[GMF](GMF.md)

I wanted to be able to specify an [Ecore](Ecore.md) language that would allow me to specify the following:

```
Object
  - onAccess : 0..1 Event
  - onEdit : 0..1 Event
  - onUpdate : 0..1 Event
```

That is, a single object can contain multiple separate containments of the same domain element (Event, in this case). While [EMF](EMF.md) handles this perfectly, [GMF](GMF.md) struggles if you try and implement it directly.

If you implement it in the most straight-forward manner - that is, by specifying each of these elements as a different visual tool (in [gmftool](gmftool.md)) and different containment feature (in [gmfmap](gmfmap.md)) - it will work in every aspect, except that GMF will not be able to render the different nodes. It will throw an exception similar to the following:

```
org.eclipse.core.commands.ExecutionException: While executing the operation, an exception occurred
at org.eclipse.core.commands.operations.DefaultOperationHistory.execute(DefaultOperationHistory.java:519)
...
Caused by: org.eclipse.core.runtime.AssertionFailedException: null argument:failed to create a view
at org.eclipse.core.runtime.Assert.isNotNull(Assert.java:85)
at org.eclipse.gmf.runtime.diagram.ui.commands.CreateCommand.doExecuteWithResult(CreateCommand.java:99)
at org.eclipse.gmf.runtime.emf.commands.core.command.AbstractTransactionalCommand.doExecute(AbstractTransactionalCommand.java:247)
...
```

Following a discussion on the GMF mailing list, the problem seems to be that in this case, GMF does not have the necessary [OCL](OCL.md) constraints in order to select which type of Event to display.

However, until <a href="https://bugs.eclipse.org/bugs/show_bug.cgi?id=256461">Eclipse bug 256461</a> is resolved, you cannot add an OCL constraint like the following:

`self.eContainingFeature().getName() = 'onClick'`

[GMF](GMF.md) supports adding constraints written in [Java](Java.md), so add a <a href="http://wiki.eclipse.org/GMF_Constraints#Java">**Java** constraint</a> to the Node definition in the .gmfmap with the following:

`return domainElement.eContainingFeature().getName().equals("onClick");`

And then specifying _gmfgen > Gen Expression Provider > Gen Java Expression Provider > Inject Expression Body_ to **true** in the generated .[gmfgen](gmfgen.md), the generated diagram editor will now correctly permit the desired functionality above.

<img src="/img/gmf/java-containment.png" class="gmf-left">
