---
layout: page
title:  "Programatically opening a sub-diagram in GMF"
author: jevon
date:   2008-11-11 06:54:36 +1300
---

[[GMF]]

This is an extension to [[GMF Diagram Partitioning]]: In this case, the desired outcome is going from a ShapeNodeEditPart, and emulating a double-click to open the sub-diagram in a new editor. Here is a partial listing of the [[GMF Code Samples|code required]].

First we have to [[GMF Troubleshooting 6|load the target file]], then get the loaded editor, and finally emulate double clicking it.

[code]// get the target diagram file
IFile targetDiagram = project.getFile("generation-sync-multiple.iaml_diagram");

// try loading it up with Eclipse
ResourceSet resSet = new ResourceSetImpl();          
Resource res = resSet.getResource(URI.createPlatformResourceURI(targetDiagram.getFullPath().toString(), false), true);

// get the current loaded editor
IWorkbenchPage page = PlatformUI.getWorkbench()
  .getActiveWorkbenchWindow().getActivePage();
IEditorPart ep = page.getActiveEditor();
IamlDiagramEditor editor = (IamlDiagramEditor) ep;
ShapeNodeEditPart store = editor.getDiagramEditorPart().getChildren().get(0);

// double click the "store" element (assuming it exists)
// based on org.eclipse.gef.tools.SelectEditPartTracker#performOpen()
SelectionRequest request = new SelectionRequest();
request.setLocation(store.getLocation());
request.setModifiers(0 /*getCurrentInput().getModifiers()*/);
request.setType(RequestConstants.REQ_OPEN);
store.performRequest(request);[/code]

You can also see this <a href="http://code.google.com/p/iaml/source/browse/trunk/org.openiaml.model.tests/src/org/openiaml/model/tests/eclipse/EclipseTestCase.java?spec=svn322&r=322#123">code on SVN</a>.

[[Category:GMF]]
[[Category:Technology]]