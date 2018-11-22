---
layout: page
title:  "Using XPath to find EMF elements"
author: jevon
date:   2011-03-08 11:50:43 +1300
tags:   [EMF, XML]
---

[EMF](emf.md) / [XPath](xpath.md)

Using <a href="http://www.eclipticalsoftware.com/emf/xpath/">Ecliptical's XPath Support for EMF</a> plugin, you can browse through an [EMF](emf.md) document using [XPath](xpath.md) syntax.

It extends [Jaxen](jaxen.md) to wrap around a given EClass. But unfortunately it loses all concept of attributes, so _ns:root[@ns:name='foo']_ has to become _ns:root[ns:name='foo']_.

However, as of March 2011 this update site has vanished. Since it is licensed under the [EPL](epl.md), a mirror of the plugin is provided through the <a href="http://iaml.googlecode.com/svn/trunk/org.openiaml.update/">IAML update site</a>. (<a href="http://code.google.com/p/iaml/wiki/Installation">IAML Installation Instructions</a>)

## Accessing types in Ecliptical XPath
If you are trying to access the type of an EMF node, you could expect something like this to work:

```
EMFXPath xpath = new EMFXPath("//iaml:children[contains(xsi:type, 'SyncWire')]");
xpath.addNamespace("iaml", ModelPackage.eNS_URI);
xpath.addNamespace("xsi", "http://www.w3.org/2001/XMLSchema-instance");
return xpath.selectNodes(root);
```

However, since we are adapting around an existing [EMF](emf.md) model and not the source [XML](xml.md) file, this property is not available. The solution is to use the _eClass()_ function:

`EMFXPath xpath = new EMFXPath("//iaml:children[contains(eClass(), 'SyncWire')]");`

This additional function is provided to [Jaxen](jaxen.md) as _ca.ecliptical.emf.internal.xpath.EClassFunction_.
