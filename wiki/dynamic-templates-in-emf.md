---
layout: page
title:  "Dynamic Templates in EMF"
author: jevon
date:   2010-04-16 12:35:25 +1200
---

This is the ability to use [[Dynamic Templates]] when generating the model generated automatically by the [[EMF]] framework. 

Compared to [[Enabling Dynamic Templates in GMF]], the EMF approach <strike>uses</strike> sometime uses the [[JET]] language instead of [[Xpand]], so it is not possible to use an aspect-oriented to modify the generated model; instead, we have to copy the entire template verbatim and use this.

In some cases, templates can include a sub-template, allowing us to <a href="http://code.google.com/p/iaml/source/browse/trunk/org.openiaml.model/templates-emf/model/Class/insert.javajetinc?r=1907">insert code directly</a>:

[code]<%@ include file="Class/insert.javajetinc" fail="silent" %>[/code]

To implement, follow <a href="http://wiki.eclipse.org/index.php/EMF-FAQ#What_are_Dynamic_Templates.3F">the instructions in the EMF FAQ</a>.

This was implemented to resolve <a href="http://code.google.com/p/iaml/issues/detail?id=165">issue 165 in IAML</a>, through <a href="http://code.google.com/p/iaml/source/detail?r=1905">these changes in the code</a>.

[[Category:Java]]
[[Category:EMF]]
[[Category:Code Snippets]]