---
layout: page
title:  XML
author: jevon
date:   2012-08-12 20:03:18 +12:00
tags:
  - Technology
---

Related XML technologies:

1. [XPath](XPath.md)
1. [RDF](rdf.md)
1. [OWL](OWL.md)
1. [XMI](xmi.md)
1. [XSL](xsl.md)
1. [RSS](rss.md)

Some XML articles:

1. [Disabling DTD validation for Ant xmlvalidate task within Eclipse](Disabling_DTD_validation_for_Ant_xmlvalidate_task_within_Eclipse.md)
1. <a href="http://code.google.com/p/iaml/source/browse/branches/2008-11-versioning/org.openiaml.model.diagram.custom/src/org/openiaml/model/diagram/custom/actions/MigrateModelAction.java?spec=svn337&r=337#189">Loading an XML DOM Document from an InputStream or IFile</a> (from [Java](Java.md))
1. <a href="http://code.google.com/p/iaml/source/browse/branches/2008-11-versioning/org.openiaml.model.diagram.custom/src/org/openiaml/model/diagram/custom/migrate/Migrate0To1.java?spec=svn337&r=337#72">Writing an XML DOM Document into an InputStream or IFile</a> (from [Java](Java.md))
1. <a href="http://code.google.com/p/iaml/source/browse/branches/2008-11-versioning/org.openiaml.model.diagram.custom/src/org/openiaml/model/diagram/custom/migrate/Migrate0To1.java?spec=svn337&r=337#192">Traversing an XML DOM document and creating new elements</a> (from [Java](Java.md))

## Generate Sample XML data from an XSD schema

1. A commercial tool is [XMLSpy](XMLSpy.md).
1. A freeware tool is <a href="http://www.liquid-technologies.com/Product_XmlStudio_Features.aspx">Liquid XML Studio</a> (freeware community edition), although the installer isn't too intelligent, and the product isn't very robust!

## Adding Arbitrary Namespaces to an XML document root in W3C DOM for Java

If you want to add multiple namespaces to an XML document in W3C [Java](Java.md), you can use code similar to the following (<a href="http://techxplorer.com/2010/01/07/creating-an-xml-document-in-java-with-multiple-namespaces/">inspired by this post</a>):

```
Element root = document.getDocumentElement();
root.setAttributeNS("http://www.w3.org/2000/xmlns/", "xmlns:foo", "http://bar.com/ns");
```

## Content Type of RSS
Much of the Internet suggests that the _Content-type_ for [RSS](rss.md) should be `application/rss+xml`.

However, [Firefox](Firefox.md) doesn't know how to handle this format, and as such, asks you to save it to disk rather than displaying it inline.

Upon further investigation I found out the problem is that `application/rss+xml` isn't actually a <a href="http://www.iana.org/assignments/media-types/index.html">valid registered MIME type</a>!

Even though it has more of a description than simply `application/xml`, <a href="https://bugzilla.mozilla.org/show_bug.cgi?id=155730">Firefox doesn't recognise */*+xml as generic XML documents</a> (an outstanding bug). So in the meantime, `application/xml` is the best format.
