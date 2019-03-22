---
layout: page
title:  "Listing all files contained in an Eclipse plugin"
author: jevon
date:   2009-07-26 19:19:59 +1200
tags:   [Eclipse, Code Snippets, Java]
---

[Eclipse](Eclipse.md)

Within a Plugin instance, the following code will return _all_ files (*) within the "src" directory (and recursively):

```
Enumeration<?> e = getBundle().findEntries("src", "*", true);
while (e.hasMoreElements()) {
  System.out.println(e.nextElement()); // returns URLs of type bundleentry://
}
```
