---
layout: page
title:  "EMF"
author: jevon
date:   2011-05-17 12:39:27 +1200
---

[[EMF]] is the [[Eclipse]] Modelling Framework. It is based on the [[Ecore]] metamodelling language. Also have a look at [[GMF]] for the Graphical Modelling Framework. Also see [[openArchitectureWare]].

# [[Combine Multiple Ecore Models Together]]
# [[Using EOpposite in GMF]]
# [[Getting IDs on EMF model elements]]
# [[Using XPath to find EMF elements]]
# [[Improving EMF Model Loading Performance]]
# [[Loading EMF XSD Models at Runtime]]
# [[Dynamic Templates in EMF]]
# <a href="http://www.ibm.com/developerworks/library/os-eclipse-emfmetamodel/index.html">Extending Ecore to define a new M3</a>
# [[Resolving Proxy EMF Elements]]
# [[EMF Validation Framework]]

==Upper Bound in EMF==
To set the upper bound of an association to unbounded/unlimited, instead of using "*" or "many" or "n", use "-1". :roll:

==Convert ecore_diagram to ecore==
It doesn't appear that you can export an '''ecore_diagram''' file to an '''ecore''' file, but that's because the '''ecore_diagram''' file is already based on an existing '''ecore''' file. For example, editing the '''default.ecore_diagram''' file automatically updates '''default.ecore''' with the model changes.

==Convert ecore to xsd/[[XML Schema]]==
# Right click on the .genmodel and select Export Model, and you should be able to export it there.
# If you set ''Model > Generate Schema'' to ''true'' in the .genmodel, the XSD files will be automatically generated when you Generate Model Code. (<a href="http://www.eclipsezone.com/eclipse/forums/t102204.html">ref</a>)
# If you get the message that no model exporters exist, try installing the [[XSD]] features from [[Eclipse]]. (<a href="http://dev.eclipse.org/newslists/news.eclipse.tools.emf/msg28789.html">ref</a>)

==Meaning of Ecore Attributes==

# '''Volatile''' means that no variables/fields are generated and you will write all the accessor methods by hand. (<a href="http://dev.eclipse.org/newslists/news.eclipse.tools.emf/msg23918.html">ref</a>)
# '''Transient''' means it will not be serialized, i.e., it's not persistent. (<a href="http://dev.eclipse.org/newslists/news.eclipse.tools.emf/msg23918.html">ref</a>)
# '''Derived''' features are assumed to be computed from other features and hence are typically transient as well.  Derived features are not copied by EcoreUtil.copy. (<a href="http://dev.eclipse.org/newslists/news.eclipse.tools.emf/msg23918.html">ref</a>)
# '''Resolve Proxies''' means, at least, that if the model element is moved into a new resource (model file), the eContainer will be preserved. (<a href="http://dev.eclipse.org/mhonarc/newsLists/news.eclipse.tools.emf/msg43218.html">ref</a>)

==EcoreEditPlugin==
# org.eclipse.emf.ecore.provider.EcoreEditPlugin: part of the '''org.eclipse.emf.ecore.edit''' plugin.
# org.eclipse.emf.codegen.ecore.genmodel.provider.GenModelEditPlugin: part of the '''org.eclipse.emf.codegen.ecore.ui''' plugin.

==EMF Documentation annotations==
To add documentation to your generated EMF classes, add an EAnnotation with the following details:

[code]Source: http://www.eclipse.org/emf/2002/GenModel[/code]

And to this EAnnotation, add a details entry:

[code]Key: documentation
Value: Any documentation you'd like included[/code]

If you want to access this information at runtime (e.g. ''EClass.getEAnnotation'') you will need to set ''Model > Suppress GenModel Annotations'' in your .genmodel to '''true'''.

==Cannot create a resource for XXX; a registered resource factory is needed==
I got this message while developing a [[JUnit]] Plug-in Test for [[Eclipse]]. You can either <a href="http://dev.eclipse.org/newslists/news.eclipse.tools.emf/msg00613.html">register an external Resource factory</a>, or if your source model is using XMI, you can just add the '''org.eclipse.emf.ecore.xmi''' plug-in as a dependency of your current plugin.

==Extending Ecore==
I had an interesting experience trying to extend another Ecore model: in particular, I was trying to define a MyClass extends Custom, which was loaded from another Ecore model in the environment.

The generating implementation class file was extending EObjectImpl and not CustomImpl, meaning that a lot of fields were duplicated and some operations were not implemented, as they were in CustomImpl.

The problem was that my object was extending other objects. '''Only the first element is used as the base class''' for the implementation class. Moving Custom as the first superType meant that MyClassImpl extended CustomImpl and not EObjectImpl.

[[Category:Technology]]