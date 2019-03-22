---
layout: page
title:  FTL
author: jevon
date:   2012-08-23 21:32:44 +12:00
tags:
  - Java
  - Template Languages
---

Also known as [Freemarker Templates](Freemarker_Templates.md).

**freemarker.core.NonStringException: Error on line 12, column 31 in my.ftl: Expecting a string, date or number here, Expression p.enabled is instead a freemarker.template.TemplateBooleanModel$2**

Here the problem is that you are trying to write a boolean (true, false) without first casting it to a string. For example:

`"var": "${var}"`

You instead need to write:

`"var": "${var?string("true", "false")}"`
