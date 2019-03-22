---
layout: page
title:  JET
author: jevon
date:   2010-04-16 11:27:32 +12:00
tags:
  - Java
  - Technology
---

[JET](jet.md) stands for **Java Emitter Templates** that is based entirely in [Eclipse](eclipse.md). It is meant to be run with workspaces. This example **.javajet** is what a JET template <a href="http://code.google.com/p/iaml/source/browse/trunk/org.openiaml.model/templates-emf/model/FactoryClass.javajet?spec=svn1905&r=1905">can look like</a> (from [EMF](emf.md)).

Some more articles:
1. [Setting up an EMF/JET testing project with JUnit and Eclipse](setting-up-an-emf/jet-testing-project-with-junit-and-eclipse.md)

## Creating a JET code generation plugin for an [EMF](emf.md) model
JET transforms are stored as Eclipse plugin projects, so you need to make a new plugin project first.

1. Select New > _EMFT JET Transformation Project_.
1. This project will automatically add some basic templates (dump.jet) and plugin.xml.
1. To plugin.xml, add:

```
<plugin>
   <extension
         id=""
         name=""
         point="org.eclipse.jet.transform">
      <transform
            modelExtension="model"
            modelLoader="org.eclipse.jet.emf"
            startTemplate="templates/main.jet"
            templateLoaderClass="org.eclipse.jet.compiled._jet_transformation">
         <description></description>
         <tagLibraries>
            <importLibrary id="org.eclipse.jet.controlTags" usePrefix="c" autoImport="true"/>
            <importLibrary id="org.eclipse.jet.javaTags" usePrefix="java" autoImport="true"/>
            <importLibrary id="org.eclipse.jet.formatTags" usePrefix="f" autoImport="true"/>
            <importLibrary id="org.eclipse.jet.workspaceTags" usePrefix="ws" autoImport="false"/>
         </tagLibraries>
      </transform>
   </extension>
</plugin>
```

1. This will add the imported libraries. Most importantly is that you set _modelExtension_ to the extension of your [EMF](emf.md) models, and _modelLoader_ to the EMF loader -- **org.eclipse.jet.emf**.

{% include tag-todo.md comment="add link to real world project on SVN" %}

The rest of these instructions are for making a contribution to [Eclipse](eclipse.md) to add a Right Click menu to files in order to generate code.

1. Create a new project (or edit the existing project).
1. Add the _org.eclipse.jet_ dependency to required plug-ins.
1. Add to the _org.eclipse.ui.popupMenus_ extension point (in plugin.xml) a menu item that points to a _IViewActionDelegate_.
1. Use the following code to call a JET template programatically:

```
private IStatus generateCodeFrom(IFile o, IAction action, IProgressMonitor monitor) {
  if (o.getFileExtension().equals("model")) {
    Map<String,Object> variables = new HashMap<String,Object>();
    variables.put("somevar", "a variable");
    return JET2Platform.runTransformOnResource("org.openiaml.test.uml3.generate.ejet", o, variables, monitor);
  }

  return null;
}
```

The full implementation of this can be accessed on SVN:
1. http://iaml.svn.sourceforge.net/viewvc/iaml/trunk/examples/jet/GenerateCodeAction.java?view=markup (Java)
1. http://iaml.svn.sourceforge.net/viewvc/iaml/trunk/examples/jet/plugin.xml?view=markup (plugin.xml)

(See more code examples at [GMF Code Samples](gmf-code-samples.md).)

{% include tag-todo.md comment="add link to real world project on SVN" %}

## Could not load JET template loader
Look at your Error Log in Eclipse to try and find out what the problem is. If you don't get any error logs, you can start a new workspace in debug mode, and debug from there. The line you are looking for is 
`org.eclipse.jet.internal.runtime.JETBundleManager.getTemplateLoader(java.lang.String) line: 454`

For example, I got this exception stack trace:
`java.lang.ClassNotFoundException: Cannot load "org.eclipse.jet.compiled._jet_transformation" because the bundle "file:C:/Documents and Settings/Jevon/runtime-uml3debug/org.openiaml.test.uml3.generate.ejet" cannot be resolved.`

Which I then found out, that by looking at my development environment, I was getting these errors:
```
Could not find matching bundle for Require-Bundle: org.eclipse.core.runtime; bundle-version="[3.4.0,4.0.0)"
Could not find matching bundle for Require-Bundle: org.eclipse.emf.edit.ui; bundle-version="[2.4.0,3.0.0)"
...
```

Since I am running Eclipse 3.3, it means that JET is looking for the wrong version of the Eclipse plugin.
