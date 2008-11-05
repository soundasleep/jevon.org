---
layout: page
title:  "Extending java.text.MessageFormat"
author: jevon
date:   2008-11-06 10:34:19 +1300
---

[[Java]]

I had a problem where I was required to use ''java.text.MessageFormat'', but this formatter doesn't allow for formatting boolean values. However, it is possible to add new formatters to an existing MessageFormat instance, if they are instances of ''java.text.ChoiceFormat'':

[code]String actualPattern = "{0}";
MessageFormat mf = new MessageFormat(actualPattern);
mf.setFormat(0, new MyFormatter());
// proceed with formatting[/code]

You can see my custom formatter, which returns "/" on true, "" on false, <a href="http://code.google.com/p/iaml/source/browse/trunk/org.openiaml.model/src/org/openiaml/model/diagramextensions/IsGeneratedFormat.java">directly on SVN</a>.

[[Category:Java]]
[[Category:Technology]]
[[Category:Code Samples]]