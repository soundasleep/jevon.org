---
layout: page
title:  "Using XPath to find EMF elements"
author: jevon
date:   2011-03-08 11:50:43 +1300
---

[[EMF]] / [[XPath]]

Using <a href="http://www.eclipticalsoftware.com/emf/xpath/">Ecliptical's XPath Support for EMF</a> plugin, you can browse through an [[EMF]] document using [[XPath]] syntax.

It extends [[Jaxen]] to wrap around a given EClass. But unfortunately it loses all concept of attributes, so ''ns:root[@ns:name='foo']'' has to become ''ns:root[ns:name='foo']''.

However, as of March 2011 this update site has vanished. Since it is licensed under the [[EPL]], a mirror of the plugin is provided through the <a href="http://iaml.googlecode.com/svn/trunk/org.openiaml.update/">IAML update site</a>. (<a href="http://code.google.com/p/iaml/wiki/Installation">IAML Installation Instructions</a>)

==Accessing types in Ecliptical XPath==
If you are trying to access the type of an EMF node, you could expect something like this to work:

[code]EMFXPath xpath = new EMFXPath("//iaml:children[contains(xsi:type, 'SyncWire')]");
xpath.addNamespace("iaml", ModelPackage.eNS_URI);
xpath.addNamespace("xsi", "http://www.w3.org/2001/XMLSchema-instance");
return xpath.selectNodes(root);[/code]

However, since we are adapting around an existing [[EMF]] model and not the source [[XML]] file, this property is not available. The solution is to use the ''eClass()'' function:

[code]EMFXPath xpath = new EMFXPath("//iaml:children[contains(eClass(), 'SyncWire')]");[/code]

This additional function is provided to [[Jaxen]] as ''ca.ecliptical.emf.internal.xpath.EClassFunction''.

[[Category:EMF]]
[[Category:XML]]