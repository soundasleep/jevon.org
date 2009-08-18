---
layout: page
title:  "Unable to Create EcoreEditorID Editor"
author: jevon
date:   2009-08-19 11:09:42 +1200
---

[[Eclipse]]

'''Unable to create editor ID org.eclipse.emf.ecore.presentation.EcoreEditorID: org.apache.xerces.jaxp.SAXParserFactoryImpl cannot be cast to javax.xml.parsers.SAXParserFactory'''

[code]java.lang.ClassCastException: org.apache.xerces.jaxp.SAXParserFactoryImpl cannot be cast to javax.xml.parsers.SAXParserFactory
at javax.xml.parsers.SAXParserFactory.newInstance(Unknown Source)
at org.eclipse.emf.ecore.plugin.EcorePlugin.computePlatformPluginToPlatformResourceMap(EcorePlugin.java:302)
at org.eclipse.emf.ecore.plugin.EcorePlugin.computePlatformURIMap(EcorePlugin.java:424)
...[/code]

It looks like this occurs when two plugins register two different ''SaxParserFactory''s.

In my case, it seems it was that I had both the [[Ecore]] and [[ATL]] plugins installed at the same time; removing the ATL plugin resolved this error.

[[Category:Java]]
[[Category:Eclipse]]