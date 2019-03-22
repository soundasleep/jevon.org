---
layout: page
title:  "Dynamic Templates in EMF"
author: jevon
date:   2010-04-16 12:35:25 +1200
tags:   [Java, EMF, Code Snippets]
---

This is the ability to use [Dynamic Templates](Dynamic_Templates.md) when generating the model generated automatically by the [EMF](EMF.md) framework. 

Compared to [Enabling Dynamic Templates in GMF](enabling-dynamic-templates-in-GMF.md), the EMF approach <strike>uses</strike> sometime uses the [JET](JET.md) language instead of [Xpand](xpand.md), so it is not possible to use an aspect-oriented to modify the generated model; instead, we have to copy the entire template verbatim and use this.

In some cases, templates can include a sub-template, allowing us to <a href="http://code.google.com/p/iaml/source/browse/trunk/org.openiaml.model/templates-emf/model/Class/insert.javajetinc?r=1907">insert code directly</a>:

`<%@ include file="Class/insert.javajetinc" fail="silent" %>`

To implement, follow <a href="http://wiki.eclipse.org/index.php/EMF-FAQ#What_are_Dynamic_Templates.3F">the instructions in the EMF FAQ</a>.

This was implemented to resolve <a href="http://code.google.com/p/iaml/issues/detail?id=165">issue 165 in IAML</a>, through <a href="http://code.google.com/p/iaml/source/detail?r=1905">these changes in the code</a>.
