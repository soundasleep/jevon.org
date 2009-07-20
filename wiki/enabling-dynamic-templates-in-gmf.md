---
layout: page
title:  "Enabling Dynamic Templates in GMF"
author: jevon
date:   2009-07-20 12:46:41 +1200
---

Also known as [[Aspect Oriented Programming]], [[GMF]] allows you to specify a location for custom ''dynamic templates'', which are compiled and added to your plugin when the .gmfgen is being used to generate the diagram code.

This is based on two references: A really good <a href="http://eclipsezilla.eclipsecon.org/php/attachment.php?bugid=3739">presentation</a> (see page 17), and a <a href="http://dev.eclipse.org/newslists/news.eclipse.modeling.gmf/msg07700.html">news posting</a>. This example is based on GMF 2.0.1, but it should work fine with GMF 2.2 as well.

In this example, we want to change our '''getDestroyElementCommand()''' in '''my.diagram.edit.policies.PageItemSemanticEditPolicy''':

[code]/**
 * @generated
 */
protected Command getDestroyElementCommand(DestroyElementRequest req) {
  CompoundCommand cc = getDestroyEdgesCommand();
  addDestroyShortcutsCommand(cc);
  cc.add(getGEFWrapper(new DestroyElementCommand(req)));
  return cc.unwrap();
}[/code]

To:

[code]/**
 * @generated
 */
protected Command getDestroyElementCommand(DestroyElementRequest req) {
  CompoundCommand cc = getDestroyEdgesCommand();
  addDestroyShortcutsCommand(cc);
  cc.add(getGEFWrapper(new DestroyElementCommand(req)));
  System.out.println("hello, world!");
  return cc.unwrap();
}[/code]

# Get the GMF Codegen source (includes the actual templates used to generate your plugin) and extract it somewhere.
# Search through the templates for ''getDestroyElementCommand''
# Hunt around until you find a template that looks useful: in my case, I found '''xpt/diagram/editpolicies/NodeItemSemanticEditPolicy.xpt'''.
# Look in this template to find the ''DEFINE'' that make up this command: in my case, I decided to modify '''destroySemanticElement''' which was part of the code used to create ''getDestroyElementCommand'':

[code]«DEFINE destroySemanticElement FOR gmfgen::GenNode-»
	«EXPAND fixElementToDeleteIfShortcut-»
cc.add(getGEFWrapper(new org.eclipse.gmf.runtime.emf.type.core.commands.DestroyElementCommand(req)));
«ENDDEFINE»
[/code]

# Create a new .xpt file like so (note: the IMPORT statement is for '''[[GMF]] 2.2'''):

[code]«IMPORT 'http://www.eclipse.org/gmf/2009/GenModel'»
«EXTENSION xpt::diagram::Utils»
«EXTENSION xpt::GenModelUtils»

«AROUND destroySemanticElement FOR gmfgen::GenNode-»
   «targetDef.proceed()»
   System.out.println("hello, world!");
«ENDAROUND»[/code]

# You will notice above: ''AROUND'' is used to specify that we don't want to replace the original element, we want to modify it.
# Also, ''«targetDef.proceed()»'' is the terminology to include the original template code (so we don't lose functionality).
# Save this file into '''templates/aspects/xpt/diagram/editpolicies/NodeItemSemanticEditPolicy.xpt'''. This is a copy of the original template location, but notice the ''aspects'' part of the directory! 
# Go into your ''.gmfgen''
# Change ''Gen Editor Generator'' > ''Dynamic Templates'' to ''true''
# Change ''Gen Editor Generator'' > ''Template Directory'' to ''/my.model/templates/''
# You can now generate modified templates!

I did all of this in my own project, which you can <a href="http://code.google.com/p/iaml/source/detail?r=156">view the diff</a> on Google Code to see what I did

[[Category:GMF]]
