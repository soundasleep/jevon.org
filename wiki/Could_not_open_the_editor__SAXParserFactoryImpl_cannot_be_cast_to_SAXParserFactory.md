---
layout: page
title:  'Could not open the editor: SAXParserFactoryImpl cannot be cast to SAXParserFactory'
author: jevon
date:   2009-10-08 10:45:16 +13:00
tags:
  - Java
  - Eclipse
  - Troubleshooting
redirect_from:
  - "/wiki/could_not_open_the_editor__saxparserfactoryimpl_cannot_be_cast_to_saxparserfactory"
  - "/wiki/Could Not Open The Editor  Saxparserfactoryimpl Cannot Be Cast To Saxparserfactory"
  - "/wiki/could not open the editor  saxparserfactoryimpl cannot be cast to saxparserfactory"
  - "/wiki/Could_Not_Open_The_Editor__Saxparserfactoryimpl_Cannot_Be_Cast_To_Saxparserfactory"
---

[Eclipse](Eclipse.md)

**Could not open the editor: org.apache.xerces.jaxp.SAXParserFactoryImpl cannot be cast to javax.xml.parsers.SAXParserFactory**

This occurs when is more than one SAX parser in your current classpath heirarchy, e.g. the calling plugin requires a SAXParser but one has already been created in another plugin which cannot be accessed through the classpath.

**Solution**: You may have two Xerces plugins in your environment. Use the Plug-in Registry (Window > Show View > Plug-in Development > Plug-in Registry) to find out which plugins are causing this. In my case, I had two plugins which both contributed a _xerces.jar_.
