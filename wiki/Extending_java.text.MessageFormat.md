---
layout: page
title:  "Extending java.text.MessageFormat"
author: jevon
date:   2008-11-06 10:34:19 +1300
tags:   [Java, Technology, Code Samples]
---

[Java](Java.md)

I had a problem where I was required to use _java.text.MessageFormat_, but this formatter doesn't allow for formatting boolean values. However, it is possible to add new formatters to an existing MessageFormat instance, if they are instances of _java.text.ChoiceFormat_:

```
String actualPattern = "{0}";
MessageFormat mf = new MessageFormat(actualPattern);
mf.setFormat(0, new MyFormatter());
// proceed with formatting
```

You can see my custom formatter, which returns "/" on true, "" on false, <a href="http://code.google.com/p/iaml/source/browse/trunk/org.openiaml.model/src/org/openiaml/model/diagramextensions/IsGeneratedFormat.java">directly on SVN</a>.
