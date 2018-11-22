---
layout: page
title:  "Loading EMF XSD Models at Runtime"
author: jevon
date:   2010-04-11 16:22:13 +1200
tags:   [Java, EMF, Code Snippets]
---

[EMF](emf.md) [XML Schema](xml-schema.md) [XSD](xsd.md)

I wanted to be able to get the _XSDSimpleTypeDefinition_ of a particular defined XSD type in my [Eclipse](eclipse.md) plugin environment, i.e.

`http://openiaml.org/model/datatypes#iamlInteger`

Which was stored in an XSD file

`org.openiaml.model/model/datatypes.xsd`

The solution is to load the XSD file (through a [URI](uri.md)) at runtime using [EMF](emf.md), and then iterating through this file to find the relevant data types. These can then be saved and referred to as necessary.

```
URI uri = URI.createURI("platform:/plugin/org.openiaml.model/model/datatypes.xsd");
EObject root = ModelLoader.load(uri);
XSDSchema schema = (XSDSchema) root;
for (XSDTypeDefinition type : schema.getTypeDefinitions()) {
  // ... checks with getURI()
}
```

<a href="http://code.google.com/p/iaml/source/browse/trunk/org.openiaml.model/src/org/openiaml/model/datatypes/BuiltinDataTypes.java?spec=svn1878&r=1878#111">See how I implemented this</a> in [IAML](iaml.md).
