---
layout: page
title:  GMF Troubleshooting 3
author: jevon
date:   2008-09-23 11:37:28 +12:00
tags:
  - Todo
  - GMF
  - Technology
redirect_from:
  - "/wiki/GMF Troubleshooting 3"
---

Some helpful tips for working with [GMF](gmf.md).

{% include gmf-troubleshooting.md %}

{% include gmf-css.md %}<img src="/img/gmf/double-navigator.png" class="gmf">**I have duplicate [project navigator](project-navigator.md) listings for a given model file (right).**

You have more than one plugin trying to generate the Project Navigator items; set _.gmfgen > Editor > Navigator > Generate Domain Model Navigator_ for one of your editors to false.

---
**When trying to create this:**
```
root
  foo.1
  foo.2
  bar from:foo.1 to:foo.2
```
**I get this:**
```
root
  foo.1
    bar to:foo.2
  foo.2
```

This happens when the link you specify does not have two features that it links together, only one.
1. Look into your .gmfmap file at the relevant link: Both "Source Feature" and "Target Feature" items should be selected.
1. Also check your .gmfgen: Gen Editor > Diagram > Link > Link Model Facet should also have "Source Meat Feature" and "Target Meta Feature" set.

---

**One of my tool palette icons does not display anything except a little red square.**
OR
**I get an exception similar to this when opening up a diagram:**
{% include begin-exception.md %}java.lang.NullPointerException
  at diagram.providers.Uml3ElementTypes.getElement(XYZElementTypes.java:175)
  at diagram.providers.Uml3ElementTypes.getImageDescriptor(XYZElementTypes.java:151)
  at diagram.part.Uml3PaletteFactory.createComponent1CreationTool(XYZPaletteFactory.java:51)
  at diagram.part.Uml3PaletteFactory.createModel1Group(XYZPaletteFactory.java:34) ...{% include end-exception.md %}

Edit your .gmfgen file manually, and look for _Tool Entry_s in _Gen Editor > Gen Diagram > Palette > Tool Group_. If the parameters "largeIconPath" or "smallIconPath" are there, but empty, you could get this error message. Delete these attributes manually. (I guess there's no way to specify _null_ in EMF editors huh.) You can also try deleting and re-generating the diagram code again.

---
**Change the location of the wizard in the "Create New" dialog**

Try .gmfgen > Gen Editor > Gen Diagram, property Editor.Creation Wizard Category ID. (untested)

---
**Disable the "Outline View" of an editor**

Add this code to the getAdapter() method of diagram.part.FooDiagramEditor (<a href="http://www.eclipse.org/newsportal/article.php?id=14352&group=eclipse.modeling.gmf#14352">ref</a>):
```
public Object getAdapter(Class type) {
  if (type == IContentOutlinePage.class) {
     return null;
  }
...
```

---
<img src="/img/gmf/sub-ocl.png" class="gmf">**When trying to create an editor for a model with subclassed elements, the following exception is thrown when creating a subclassed element:**
{% include begin-exception.md %}org.eclipse.core.commands.ExecutionException: While executing the operation, an exception occurred
  at org.eclipse.core.commands.operations.DefaultOperationHistory.execute(DefaultOperationHistory.java:519)
  at org.eclipse.gmf.runtime.diagram.ui.parts.DiagramCommandStack.execute(DiagramCommandStack.java:205) ...
Caused by: org.eclipse.jface.util.Assert$AssertionFailedException: null argument;failed to create a view
  at org.eclipse.jface.util.Assert.isNotNull(Assert.java:153)
  at org.eclipse.gmf.runtime.diagram.ui.commands.CreateCommand.doExecuteWithResult(CreateCommand.java:99) ...{% include end-exception.md %}

This can occur when the .gmfmap doesn't know where the subclassed element should map to: should it map to the superclass or the subclass?

The solution is to add [OCL](ocl.md) to the superclass mapping (<a href="http://dev.eclipse.org/newslists/news.eclipse.modeling.gmf/msg11905.html">ref</a> and <a href="http://dev.eclipse.org/newslists/news.eclipse.modeling.gmf/msg13169.html">ocl ref</a>) like so:

`not self.oclIsTypeOf(SubclassName)`

---
**Could not initialize class org.eclipse.gmf.internal.bridge.trace.TracePackage$Literals**

You have an invalid or incomplete installation of GMF (I got this error when I was running a 2007 GMF with a 2008 GMF plugin still installed). Either reinstall GMF or go through the Manage Configuration to disable those plugins not necessary.

---
**Converting GEF Commands into GMF Commands**

`ICommand _org.eclipse.gmf.runtime.diagram.ui.parts.DiagramCommandStack_.getICommand(org.eclipse.gef.commands.Command command);`

---
**I can't get an edge/connection to appear between two shortcut elements**
(In particular, when using [GMF Diagram Partitioning](gmf-diagram-partitioning.md).)

<img src="/img/gmf/double-shortcut.png" class="gmf">This is entirely possible! Refer to the code below. But I had a lot of problems trying to get it to work - turns out that, because I had two different plugins generated from the same model, the _Connection_ model element referred to the wrong package (_foo.component.*_ instead of _foo.wire.*_).

1. http://iaml.svn.sourceforge.net/viewvc/iaml/trunk/examples/gmf/CreateMissingNavigateWireShortcutsCommand.java?view=markup

---
**When trying to generate my .gmfmap, my concrete nodes that subclass abstract supertypes which are contained in the root object are not displayed in the .gmfmap wizard!**

This can happen when, for example, you want:

```
- Root
  - children: Element
- abstract Element
- Page <- Element
- Form <- Element
```

In this case, in the .gmfmap editor where you select the nodes and links to generate, you may only see the option for the Page node and not for the Form node.

This is (somewhat) natural, because the wizard only knows how to generate the code for one of these element containers. You will need to edit the .gmfmap manually and add the new element by yourself, with an [OCL](ocl.md) constraint.

See http://wiki.eclipse.org/GMF_Tutorial_Part_2#Link_Constraints for adding constraints to the .gmfmap model.
