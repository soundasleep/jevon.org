---
layout: page
title:  "Listing all files contained in an Eclipse plugin"
author: jevon
date:   2009-07-26 19:19:59 +1200
---

[[Eclipse]]

Within a Plugin instance, the following code will return ''all'' files (*) within the "src" directory (and recursively):

[code]Enumeration<?> e = getBundle().findEntries("src", "*", true);
while (e.hasMoreElements()) {
  System.out.println(e.nextElement()); // returns URLs of type bundleentry://
}[/code]

[[Category:Eclipse]]
[[Category:Code Snippets]]
[[Category:Java]]