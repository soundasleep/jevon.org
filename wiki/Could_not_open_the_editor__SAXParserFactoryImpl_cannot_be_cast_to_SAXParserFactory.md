---
layout: page
title:  "Could not open the editor: SAXParserFactoryImpl cannot be cast to SAXParserFactory"
author: jevon
date:   2009-10-08 10:45:16 +1300
tags:   [Java, Eclipse, Troubleshooting]
---

[Eclipse](Eclipse.md)

**Could not open the editor: org.apache.xerces.jaxp.SAXParserFactoryImpl cannot be cast to javax.xml.parsers.SAXParserFactory**

This occurs when is more than one SAX parser in your current classpath heirarchy, e.g. the calling plugin requires a SAXParser but one has already been created in another plugin which cannot be accessed through the classpath.

**Solution**: You may have two Xerces plugins in your environment. Use the Plug-in Registry (Window > Show View > Plug-in Development > Plug-in Registry) to find out which plugins are causing this. In my case, I had two plugins which both contributed a _xerces.jar_.
