---
layout: page
title:  Groovy
author: jevon
date:   2022-04-06 11:35:00 +12:00
tags:
  - Technology
  - Languages
  - Programming Snippets
  - Java
---

Groovy is an extension to [Java](Java.md).

# ClassNotFoundException: groovy.xml.XmlUtil

You may get this error if you are trying to `toString()` an XML thing in Groovy, which annoyingly might also occur _within_ an exception block, 
making it exceptionally difficult to track this error down.

If using Gradle, you need to either use the `groovy-all` dependency, or include the `groovy-xml` dependency:

```gradle
  implementation "org.apache.groovy:groovy-jsr223:$groovyVersion"
  implementation "org.apache.groovy:groovy-xml:$groovyVersion" // for XmlUtil
```

Note that this won't work in [Java](Java.md) 11+ because of module shenanigans. Only Groovy 4+ supports Java 11's modules.
