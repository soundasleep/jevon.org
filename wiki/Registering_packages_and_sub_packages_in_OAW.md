---
layout: page
title:  Registering packages and sub packages in OAW
author: jevon
date:   2008-10-21 08:05:03 +13:00
tags:
  - Technology
  - OAW
  - Article
  - Code Sample
redirect_from:
  - "/wiki/Registering packages and sub packages in OAW"
---

[OpenArchitectureWare](openArchitectureWare.md)

I was having troubles with trying to register a metamodel in OAW; in particular,
1. My saved model files did not have the <a href="http://www.openarchitectureware.org/forum/print.php?id=9122">_xsi:<!-- -->schemaLocation_ attribute set</a>, so OAW couldn't find it in them
1. I wanted to use an external .ecore file to specify the metamodel
1. My .ecore consisted of multiple sub packages {% include tag-Todo.md comment="add link from 'my ecore file' to a pretty visual representation of the IAML ecore file" %}
1. Ideally, I would like to have used the .ecore from a separate Eclipse plugin
1. I was using < EMF 2.4 so I couldn't use <a href="http://www.eclipsezone.com/eclipse/forums/t107146.html">org.eclipse.emf.ecore.dynamic_package</a>

The solution was to add the generated model code plugin as a dependency of the OAW plugin, and register the root model Package (<a href="http://www.mmrotzek.de/software-development/model-driven/generate-html-report-of-a-model-transformation-tracing-model/trackback">inspiration</a>):

```
<bean class="org.eclipse.mwe.emf.StandaloneSetup">
  <platformUri value=".."/>
  <registerGeneratedEPackage value="org.openiaml.model.model.ModelPackage" />
</bean>
```

There is no need to do something like this, because it will register sub-packages automatically:

```
<!-- not needed -->
  <registerGeneratedEPackage value="org.openiaml.model.model.visual.VisualPackage" />
```

This didn't work, because it couldn't load sub-EPackages:

```
<!-- doesn't load sub packages: -->
  <registerEcoreFile value="src/metamodel/iaml.ecore"/>
```

You can also see my <a href="http://code.google.com/p/iaml/source/diff?spec=svn216&r=216&format=side&path=/branches/2008-10-codegen-oaw/org.openiaml.model.codegen.oaw/src/workflow/generator.oaw">workflow file directly</a>.
