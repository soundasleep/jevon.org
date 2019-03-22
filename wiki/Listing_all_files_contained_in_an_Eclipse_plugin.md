---
layout: page
title:  Listing all files contained in an Eclipse plugin
author: jevon
date:   2009-07-26 19:19:59 +12:00
tags:
  - Eclipse
  - Code Snippets
  - Java
redirect_from:
  - "/wiki/listing_all_files_contained_in_an_eclipse_plugin"
  - "/wiki/Listing All Files Contained In An Eclipse Plugin"
  - "/wiki/listing all files contained in an eclipse plugin"
  - "/wiki/Listing_All_Files_Contained_In_An_Eclipse_Plugin"
---

[Eclipse](Eclipse.md)

Within a Plugin instance, the following code will return _all_ files (*) within the "src" directory (and recursively):

```
Enumeration<?> e = getBundle().findEntries("src", "*", true);
while (e.hasMoreElements()) {
  System.out.println(e.nextElement()); // returns URLs of type bundleentry://
}
```
