---
layout: page
title:  "Loading EMF XSD Models at Runtime"
author: jevon
date:   2010-04-11 16:22:13 +1200
---

[[EMF]] [[XML Schema]] [[XSD]]

I wanted to be able to get the ''XSDSimpleTypeDefinition'' of a particular defined XSD type in my [[Eclipse]] plugin environment, i.e.

[code]http://openiaml.org/model/datatypes#iamlInteger[/code]

Which was stored in an XSD file

[code]org.openiaml.model/model/datatypes.xsd[/code]

The solution is to load the XSD file (through a [[URI]]) at runtime using [[EMF]], and then iterating through this file to find the relevant data types. These can then be saved and referred to as necessary.

[code]URI uri = URI.createURI("platform:/plugin/org.openiaml.model/model/datatypes.xsd");
EObject root = ModelLoader.load(uri);
XSDSchema schema = (XSDSchema) root;
for (XSDTypeDefinition type : schema.getTypeDefinitions()) {
  // ... checks with getURI()
}[/code]

<a href="http://code.google.com/p/iaml/source/browse/trunk/org.openiaml.model/src/org/openiaml/model/datatypes/BuiltinDataTypes.java?spec=svn1878&r=1878#111">See how I implemented this</a> in [[IAML]].

[[Category:Java]]
[[Category:EMF]]
[[Category:Code Snippets]]