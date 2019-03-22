---
layout: page
title:  Resolving Proxy EMF Elements
author: jevon
date:   2011-05-01 15:09:57 +12:00
tags:
  - EMF
redirect_from:
  - "/wiki/Resolving Proxy EMF Elements"
---

[EMF](EMF.md) / [Ecore](Ecore.md) / [openArchitectureWare](openArchitectureWare.md)

EMF supports cross-referencing between documents; these elements will be provided at runtime as EObjects with eProxyURI set. You can try and resolve the proxy object using `EcoreUtil.resolve(EObject, Resource)`, but this might not always work.

As the EMF book fails to describe, <a href="http://dev.eclipse.org/newslists/news.eclipse.tools.emf/msg32975.html">but the newsgroup does</a>, a common mistake is to load the original Resource using a relative URI instead of an absolute URI.

That is:
```
String filename = "model/test.model";
ResourceSet resourceSet = new ResourceSetImpl();
URI uri = URI.createFileURI(filename);
Resource resource = resourceSet.getResource(uri, true);
```

Should be:
```
String filename = new File("model/test.model").getAbsolutePath();
ResourceSet resourceSet = new ResourceSetImpl();
URI uri = URI.createFileURI(filename);
Resource resource = resourceSet.getResource(uri, true);
```
