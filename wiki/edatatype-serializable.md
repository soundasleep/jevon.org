---
layout: page
title:  "EDataType Serializable"
author: jevon
date:   2011-04-29 13:15:40 +1200
tags:   [EMF, Java]
---

[EMF](emf.md)

**''boolean org.eclipse.emf.ecore.EDataType.isSerializable()**
Returns the value of the 'Serializable' attribute. The default value is "true". 

It represents whether values of this type will be serialized. For a serializable data type, there will be factory methods of the form: 

```
String convertXyzToString(EDataType metaObject, Object instanceValue)
  Object createXyzFromString(EDataType metaObject, String initialValue)
```

in the generated factory implementation. Clients will typically need to hand write the bodies of these generated methods.''
(<a href="http://download.eclipse.org/modeling/emf/emf/javadoc/2.5.0/org/eclipse/emf/ecore/EDataType.html#isSerializable%28%29">reference</a>)
