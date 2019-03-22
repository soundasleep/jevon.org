---
layout: page
title:  Enabling Dynamic Templates in GMF
author: jevon
date:   2009-07-20 12:46:41 +12:00
tags:
  - GMF
redirect_from:
  - "/wiki/Enabling Dynamic Templates in GMF"
---

Also known as [Aspect Oriented Programming](aspect-oriented-programming.md), [GMF](GMF.md) allows you to specify a location for custom _dynamic templates_, which are compiled and added to your plugin when the .gmfgen is being used to generate the diagram code.

This is based on two references: A really good <a href="http://eclipsezilla.eclipsecon.org/php/attachment.php?bugid=3739">presentation</a> (see page 17), and a <a href="http://dev.eclipse.org/newslists/news.eclipse.modeling.gmf/msg07700.html">news posting</a>. This example is based on GMF 2.0.1, but it should work fine with GMF 2.2 as well.

In this example, we want to change our **getDestroyElementCommand()** in **my.diagram.edit.policies.PageItemSemanticEditPolicy**:

```
/**
 * @generated
 */
protected Command getDestroyElementCommand(DestroyElementRequest req) {
  CompoundCommand cc = getDestroyEdgesCommand();
  addDestroyShortcutsCommand(cc);
  cc.add(getGEFWrapper(new DestroyElementCommand(req)));
  return cc.unwrap();
}
```

To:

```
/**
 * @generated
 */
protected Command getDestroyElementCommand(DestroyElementRequest req) {
  CompoundCommand cc = getDestroyEdgesCommand();
  addDestroyShortcutsCommand(cc);
  cc.add(getGEFWrapper(new DestroyElementCommand(req)));
  System.out.println("hello, world!");
  return cc.unwrap();
}
```

1. Get the GMF Codegen source (includes the actual templates used to generate your plugin) and extract it somewhere.
1. Search through the templates for _getDestroyElementCommand_
1. Hunt around until you find a template that looks useful: in my case, I found **xpt/diagram/editpolicies/NodeItemSemanticEditPolicy.xpt**.
1. Look in this template to find the _DEFINE_ that make up this command: in my case, I decided to modify **destroySemanticElement** which was part of the code used to create _getDestroyElementCommand_:

```
«DEFINE destroySemanticElement FOR gmfgen::GenNode-»
	«EXPAND fixElementToDeleteIfShortcut-»
cc.add(getGEFWrapper(new org.eclipse.gmf.runtime.emf.type.core.commands.DestroyElementCommand(req)));
«ENDDEFINE»
```

1. Create a new .xpt file like so (note: the IMPORT statement is for **[GMF](GMF.md) 2.2**):

```
«IMPORT 'http://www.eclipse.org/gmf/2009/GenModel'»
«EXTENSION xpt::diagram::Utils»
«EXTENSION xpt::GenModelUtils»

«AROUND destroySemanticElement FOR gmfgen::GenNode-»
   «targetDef.proceed()»
   System.out.println("hello, world!");
«ENDAROUND»
```

1. You will notice above: _AROUND_ is used to specify that we don't want to replace the original element, we want to modify it.
1. Also, _«targetDef.proceed()»_ is the terminology to include the original template code (so we don't lose functionality).
1. Save this file into **templates/aspects/xpt/diagram/editpolicies/NodeItemSemanticEditPolicy.xpt**. This is a copy of the original template location, but notice the _aspects_ part of the directory! 
1. Go into your _.gmfgen_
1. Change _Gen Editor Generator_ > _Dynamic Templates_ to _true_
1. Change _Gen Editor Generator_ > _Template Directory_ to _/my.model/templates/_
1. You can now generate modified templates!

I did all of this in my own project, which you can <a href="http://code.google.com/p/iaml/source/detail?r=156">view the diff</a> on Google Code to see what I did
