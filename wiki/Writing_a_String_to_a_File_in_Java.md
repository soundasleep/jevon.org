---
layout: page
title:  "Writing a String to a File in Java"
author: jevon
date:   2009-05-11 10:55:20 +1200
tags:   [Java]
---

[Java](Java.md)

In particular, getting an InputStream from a String:

```
InputStream source = new ByteArrayInputStream(myString.getBytes("UTF-8")); 
IFile out = project.getFile(f + ".xml");
out.create(source, true, monitor);
```

This uses [Eclipse](Eclipse.md)'s IFiles to set the file contents.

The major problem is that InputStreams know nothing of character encoding, thus the deprecation to use StringReader instead. (<a href="http://www.velocityreviews.com/forums/t137011-stringreader-vs-stringbufferinputstream.html">ref</a>)

To achieve this without using Eclipse's framework, <a href="http://code.google.com/p/iaml/source/browse/trunk/org.openiaml.model.tests/src/org/openiaml/model/tests/XmlTestCase.java?spec=svn676&r=676#285">see this code</a>.


{% include tag-Todo.md comment="put into the proper categories, and rewrite to be Eclipse-based" %}
