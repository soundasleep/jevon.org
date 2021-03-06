---
layout: page
title:  Unable to Create EcoreEditorID Editor
author: jevon
date:   2009-08-19 11:09:42 +12:00
tags:
  - Java
  - Eclipse
redirect_from:
  - "/wiki/Unable to Create EcoreEditorID Editor"
---

[Eclipse](Eclipse.md)

**Unable to create editor ID org.eclipse.emf.ecore.presentation.EcoreEditorID: org.apache.xerces.jaxp.SAXParserFactoryImpl cannot be cast to javax.xml.parsers.SAXParserFactory**

```
java.lang.ClassCastException: org.apache.xerces.jaxp.SAXParserFactoryImpl cannot be cast to javax.xml.parsers.SAXParserFactory
at javax.xml.parsers.SAXParserFactory.newInstance(Unknown Source)
at org.eclipse.emf.ecore.plugin.EcorePlugin.computePlatformPluginToPlatformResourceMap(EcorePlugin.java:302)
at org.eclipse.emf.ecore.plugin.EcorePlugin.computePlatformURIMap(EcorePlugin.java:424)
...
```

It looks like this occurs when two plugins register two different _SaxParserFactory_s.

In my case, it seems it was that I had both the [Ecore](Ecore.md) and [ATL](ATL.md) plugins installed at the same time; removing the ATL plugin resolved this error.
