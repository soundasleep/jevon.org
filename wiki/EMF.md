---
layout: page
title:  EMF
author: jevon
date:   2013-02-17 20:40:48 +13:00
tags:
  - Technology
redirect_from:
  - "/wiki/emf"
  - "/wiki/Emf"
---

[EMF](emf.md) is the [Eclipse](eclipse.md) Modelling Framework. It is based on the [Ecore](ecore.md) metamodelling language. Also have a look at [GMF](gmf.md) for the Graphical Modelling Framework. Also see [openArchitectureWare](openarchitectureware.md).

1. [Combine Multiple Ecore Models Together](combine-multiple-ecore-models-together.md)
1. [Using EOpposite in GMF](using-eopposite-in-gmf.md)
1. [Getting IDs on EMF model elements](getting-ids-on-emf-model-elements.md)
1. [Using XPath to find EMF elements](using-xpath-to-find-emf-elements.md)
1. [Improving EMF Model Loading Performance](improving-emf-model-loading-performance.md)
1. [Loading EMF XSD Models at Runtime](loading-emf-xsd-models-at-runtime.md)
1. [Dynamic Templates in EMF](dynamic-templates-in-emf.md)
1. <a href="http://www.ibm.com/developerworks/library/os-eclipse-emfmetamodel/index.html">Extending Ecore to define a new M3</a>
1. [Resolving Proxy EMF Elements](resolving-proxy-emf-elements.md)
1. [EMF Validation Framework](emf-validation-framework.md)
1. <a href="http://www.delicious.com/jevonwright/emf" class="delicious">Other pages tagged as "emf"</a>

## Upper Bound in EMF
To set the upper bound of an association to unbounded/unlimited, instead of using "*" or "many" or "n", use "-1". :roll:

## Convert ecore_diagram to ecore
It doesn't appear that you can export an **ecore_diagram** file to an **ecore** file, but that's because the **ecore_diagram** file is already based on an existing **ecore** file. For example, editing the **default.ecore_diagram** file automatically updates **default.ecore** with the model changes.

## Convert ecore to xsd/[XML Schema](xml-schema.md)
1. Right click on the .genmodel and select Export Model, and you should be able to export it there.
1. If you set _Model > Generate Schema_ to _true_ in the .genmodel, the XSD files will be automatically generated when you Generate Model Code. (<a href="http://www.eclipsezone.com/eclipse/forums/t102204.html">ref</a>)
1. If you get the message that no model exporters exist, try installing the [XSD](xsd.md) features from [Eclipse](eclipse.md). (<a href="http://dev.eclipse.org/newslists/news.eclipse.tools.emf/msg28789.html">ref</a>)

## Meaning of Ecore Attributes

1. **Volatile** means that no variables/fields are generated and you will write all the accessor methods by hand. (<a href="http://dev.eclipse.org/newslists/news.eclipse.tools.emf/msg23918.html">ref</a>)
1. **Transient** means it will not be serialized, i.e., it's not persistent. (<a href="http://dev.eclipse.org/newslists/news.eclipse.tools.emf/msg23918.html">ref</a>)
1. **Derived** features are assumed to be computed from other features and hence are typically transient as well.  Derived features are not copied by EcoreUtil.copy. (<a href="http://dev.eclipse.org/newslists/news.eclipse.tools.emf/msg23918.html">ref</a>)
1. **Resolve Proxies** means, at least, that if the model element is moved into a new resource (model file), the eContainer will be preserved. (<a href="http://dev.eclipse.org/mhonarc/newsLists/news.eclipse.tools.emf/msg43218.html">ref</a>)

## EcoreEditPlugin
1. org.eclipse.emf.ecore.provider.EcoreEditPlugin: part of the **org.eclipse.emf.ecore.edit** plugin.
1. org.eclipse.emf.codegen.ecore.genmodel.provider.GenModelEditPlugin: part of the **org.eclipse.emf.codegen.ecore.ui** plugin.

## EMF Documentation annotations
To add documentation to your generated EMF classes, add an EAnnotation with the following details:

`Source: http://www.eclipse.org/emf/2002/GenModel`

And to this EAnnotation, add a details entry:

```
Key: documentation
Value: Any documentation you'd like included
```

If you want to access this information at runtime (e.g. _EClass.getEAnnotation_) you will need to set _Model > Suppress GenModel Annotations_ in your .genmodel to **true**.

## Cannot create a resource for XXX; a registered resource factory is needed
I got this message while developing a [JUnit](junit.md) Plug-in Test for [Eclipse](eclipse.md). You can either <a href="http://dev.eclipse.org/newslists/news.eclipse.tools.emf/msg00613.html">register an external Resource factory</a>, or if your source model is using XMI, you can just add the **org.eclipse.emf.ecore.xmi** plug-in as a dependency of your current plugin.

## Extending Ecore
I had an interesting experience trying to extend another Ecore model: in particular, I was trying to define a MyClass extends Custom, which was loaded from another Ecore model in the environment.

The generating implementation class file was extending EObjectImpl and not CustomImpl, meaning that a lot of fields were duplicated and some operations were not implemented, as they were in CustomImpl.

The problem was that my object was extending other objects. **Only the first element is used as the base class** for the implementation class. Moving Custom as the first superType meant that MyClassImpl extended CustomImpl and not EObjectImpl.
