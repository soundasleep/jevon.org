---
layout: page
title:  "GMF Troubleshooting 6"
author: jevon
date:   2008-12-09 12:46:25 +1300
---

[[GMF]]

{{gmf-troubleshooting}}

'''org.eclipse.emf.ecore.resource.impl.ResourceSetImpl$1DiagnosticWrappedException: java.net.MalformedURLException: unknown protocol: c'''

This exception can appear when trying to create a URI of the wrong type (the 'c' is from 'c:/foo/bar.txt'):

[code]IFile target = project.getFile("bar.txt");
ResourceSet resSet = new ResourceSetImpl();          
Resource res = resSet.getResource(URI.createURI(target.getLocation().toString()), true);[/code]

The solution is to use ''createFileURI'' instead:

[code]Resource res = resSet.getResource(URI.createFileURI(target.getLocation().toString()), true);[/code]

---
'''Converting from an IFile to an EMF resource in order to load a diagram file programatically'''

The code is strikingly similar to that above ;)

[code]IFile target = project.getFile("EclipseTestCase.iaml");
ResourceSet resSet = new ResourceSetImpl();          
Resource res = resSet.getResource(URI.createPlatformResourceURI(target.getFullPath().toString(), false), true);
IamlDiagramEditorUtil.openDiagram( res );[/code]

Note how it needs to use ''createPlatformResourceURI()'': This is because ''openDiagram()'' can only load project-relative paths.

You can <a href="http://code.google.com/p/iaml/source/browse/trunk/org.openiaml.model.tests/src/org/openiaml/model/tests/eclipse/EclipseTestCase.java?spec=svn319&r=319#48">see this code implemented</a> in the Eclipse IAML plugin. Also see <a href="http://blog.cypal-solutions.com/2008/03/converting-emf-resource-to-platform.html">converting a Resource back into an IFile</a>.

[[Category:GMF]]
[[Category:Technology]]
[[Category:Code Snippets]]