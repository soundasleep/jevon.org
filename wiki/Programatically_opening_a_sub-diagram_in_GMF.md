---
layout: page
title:  Programatically opening a sub-diagram in GMF
author: jevon
date:   2008-11-11 06:54:36 +13:00
tags:
  - GMF
  - Technology
redirect_from:
  - "/wiki/Programatically opening a sub-diagram in GMF"
---

[GMF](GMF.md)

This is an extension to [GMF Diagram Partitioning](GMF_Diagram_Partitioning.md): In this case, the desired outcome is going from a ShapeNodeEditPart, and emulating a double-click to open the sub-diagram in a new editor. Here is a partial listing of the [code required](GMF_Code_Samples.md).

First we have to [load the target file](GMF_Troubleshooting_6.md), then get the loaded editor, and finally emulate double clicking it.

```
// get the target diagram file
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
store.performRequest(request);
```

You can also see this <a href="http://code.google.com/p/iaml/source/browse/trunk/org.openiaml.model.tests/src/org/openiaml/model/tests/eclipse/EclipseTestCase.java?spec=svn322&r=322#123">code on SVN</a>.
