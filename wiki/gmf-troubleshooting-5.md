---
layout: page
title:  "GMF Troubleshooting 5"
author: jevon
date:   2009-05-01 12:43:17 +1200
---

[[GMF]]

{{gmf-troubleshooting}}

''' Ambiguous definitions Runtime::fqn FOR LabeledContainer and Runtime::fqn FOR Label for param types []'''

In your .gmfgraph, you have a ''Basic Font'' attribute that has an empty ''Face Name''.

---
'''Ambiguous definitions Runtime::fqn FOR FlowLayout and Runtime::fqn FOR PolylineDecoration for param types []'''

In your .gmfgraph, you have a ''Child Access'' that has an empty ''Figure''.

---
'''"The method getFigureDomainObjectNameFigure() is undefined for the type InputFormEditPart.InputFormFigure" in EditPart.addFixedChild(EditPart childEditPart)'''

This can be caused when your ''Label Feature Mapping'' in .gmfmap is set to render a different attribute to the one that is available. For example, an InputForm trying to render the name attribute of a DomainObject rather than the InputForm itself. Check your .gmfmap's ''Label Feature Mapping'''s ''Diagram Label'' properties.

---
'''When using [[GMF Diagram Partitioning]] on a diagram editor that has multiple sub-elements, I can only get one diagram editor to work.'''

For example, you have a Root node that contains Pages and Classes, but when double clicking either Page or Class, you only get the Class editor.

The problem is that the OpenEditPolicy for your Root diagram editor is being overwritten; go into ''.gmfgen > Gen Editor Generator > Gen Diagram > the appropriate Top Level Node'' and make sure each ''Open Diagram Behaviour'' has a unique ''Edit Policy Class Name''.

---
'''My links are going backwards!'''

E.g. you are getting this:
[code]- A
- B
  - link to: A[/code]

instead of:
[code]- A
  - link to: B
- B[/code]

You probably have a mistake in your .gmfmap, where the ''Source Meta Feature'' and ''Target Meta Feature''s of the links are reversed.


---
'''Error: Can't find genClass for class 'XYZ' in package xyz.'''

Your .genmodel may be invalid or old - recreate it.

I also came across this problem when my ''.gmfmap > Canvas Mapping > Domain Model'' package property was set to a package that did not contain the canvas element specified in ''Element''.

This problem also occured when my entire ''.gmfmap'' was pointing to the wrong .ecore file in my workspace.

---
'''Error: Plug-in XYZ.diagram was unable to load class XYZ.diagram.part.SomeWizard'''

You may have not recently generated your Model and Edit code from your .genmodel. Regenerate them.

---
'''Steps required to rename an element (e.g. A -> B)'''

# Edit the .ecore to change the element name
# Reload the .genmodel
# Regenerate the Model and Edit Code
# Organise the imports in the Model and Edit code to make sure you aren't referring to old imports
# Load each .gmfmap
# Look for previous references to the old element: its likely the containment feature has been set to null
# Save each .gmfmap
# Diff each .gmfmap to make sure you haven't lost any changes
# Regenerate the code for each plugin
# Organise the imports in each plugin to make sure you aren't referring to old imports

---
'''Unexpected state came across, have no idea how to deal with that'''

Make sure that you aren't trying to generate code into an Eclipse project which is currently closed :)

---
'''I can't create links between some shortcut elements'''

I had this problem when I had a model like so:

[code]- Edge
- A
  - aEdges: 0..* Edge
- B
  - bEdges: 0..* Edge[/code]

I did this because otherwise I couldn't tell the difference between A.edges and B.edges while working on my gmfmap. But as a result, if I went into A's editor and dragged B's on, I couldn't create links starting from shortcut B's. 

After some investigation I found it was because since the gmfmap for A set the containment feature to aEdges, apparently you couldn't drag a link on and it would automatically know to place it in bEdges.

The straightforward - and possibly correct - solution was to do this:

[code]- Edge
- abstract ContainsEdges
  - edges: 0..*
- A <- ContainsEdges
- B <- ContainsEdges[/code]

By doing this, it seems, EMF can store the connections in either A or B without any problem; since they both refer to the same element (ContainsEdges.edges), you can now create shortcuts between the elements in either diagram.

[[Category:GMF]]
[[Category:Technology]]