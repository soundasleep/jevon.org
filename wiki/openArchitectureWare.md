---
layout: page
title:  "openArchitectureWare"
author: jevon
date:   2011-05-02 14:40:17 +1200
tags:   [Technology, OAW]
---

A [Java](Java.md)-based project to "simplify" the use of [EMF](EMF.md) in generating code in Eclipse from models using [MDA](mda.md).

The easiest way to play around with OAW is to:

1. Install the plugin from an update site (http://www.openarchitectureware.org/updatesite/milestone/site.xml)
1. Create a new OAW project and use it to generate the sample code
1. Modify this project to handle your new metamodel

You can see what changes I needed to do in order to <a href="http://code.google.com/p/iaml/source/detail?r=216">support my custom metamodel</a>.

1. [Registering packages and sub packages in OAW](Registering_packages_and_sub_packages_in_OAW.md)
1. [Throwing exceptions in OAW](Throwing_exceptions_in_OAW.md)
1. [Controlling logging in OAW](Controlling_logging_in_OAW.md)
1. [Accessing the AST of a OAW checks file](Accessing_the_AST_of_a_OAW_checks_file.md)
1. [Improving the performance of OAW](Improving_the_performance_of_OAW.md)
1. [Ambiguous templates in OAW](Ambiguous_templates_in_OAW.md)
1. [Resolving Proxy EMF Elements](Resolving_Proxy_EMF_Elements.md)
1. [Checks Pygments Style](Checks_Pygments_Style.md)
1. [Xtend Pygments Style](Xtend_Pygments_Style.md)

External notes:
1. <a href="http://www.openarchitectureware.org/pub/documentation/4.3.1/html/contents/r52.html">Integrating OAW checks into the GMF Validation Framework</a>
1. <a href="http://code.google.com/p/iaml/source/browse/trunk/org.openiaml.model.codegen.oaw/src/org/openiaml/model/codegen/oaw/IACleanerBeautifier.java">Using iacleaner to clean up web application generated code in OAW</a>

## Referencing ecore packages in .xpt files
I was trying, unsuccessfully, to reference to my **org.name.blah/test.ecore** file from a **templates/test.xpt** file, by trying something like this:

`«DEFINE Root FOR org::name::blah::test::ObjectRoot»`

The solution is actually to copy your **test.ecore** file into your **src** folder. A horrible solution but the only one I know so far. That way you can do this:

`«DEFINE Root FOR test::ObjectRoot»`

## Additional documentation
The Sourceforge package at https://sourceforge.net/project/showfiles.php?group_id=88344&package_id=133207 contains:
1. 0-Requirements.pdf
1. 1-AppDeveloperTutorial.pdf
1. 2-DomainDesign.pdf
1. 3-GeneratorTutorial.pdf

## Class not found: 'org.eclipse.mwe.emf.Reader'
```
WARNING: Cannot resolve keyword class org.eclipse.mwe.emf.Reader
WARNING: Cannot resolve keyword class org.eclipse.mwe.emf.Writer
SEVERE: Class not found: 'org.eclipse.mwe.emf.StandaloneSetup'
SEVERE: Class not found: 'org.eclipse.mwe.emf.Reader'
SEVERE: Class not found: 'org.eclipse.m2t.type.emf.EmfRegistryMetaModel'
```

Try adding the **org.openarchitectureware.emftools** dependency to your plug-in.

## "Couldn't find operation '+(String)' for type 'ecore::EString'"
This intermittent error seems to strike randomly, I haven't been able to work out when it occurs or how to fix it. It might be something due to project build orders, plugin dependencies, workflow configuration, simply restarting Eclipse, or rebuilding all of your plugins. (<a href="http://www.openarchitectureware.org/forum/viewtopic.php?showtopic=2997">reference</a>)

Or, you can use something like this in your extensions file:

```
String safeNameString(String s) :
  s;

String safeNameString(ecore::EString s) :
  s;
```

## oaw.xpand2.output.XmlBeautifier has no effect

According to the OAW documentation, this beautifier no longer exists. However, I've also found that `<postprocessor class="org.openarchitectureware.xpand2.output.XMLBeautifier"/>` may not work either (cannot find class).

In any case, <a href="http://code.google.com/p/iaml/source/detail?r=2758">I wrote my own XML Beautifier</a> (`XMLBeautifier`) based on the Java XML interface.
