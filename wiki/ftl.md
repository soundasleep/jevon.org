---
layout: page
title:  "FTL"
author: jevon
date:   2012-08-23 21:32:44 +1200
---

Also known as [[Freemarker Templates]].

'''freemarker.core.NonStringException: Error on line 12, column 31 in my.ftl: Expecting a string, date or number here, Expression p.enabled is instead a freemarker.template.TemplateBooleanModel$2'''

Here the problem is that you are trying to write a boolean (true, false) without first casting it to a string. For example:

[code]"var": "${var}"[/code]

You instead need to write:

[code]"var": "${var?string("true", "false")}"[/code]

[[Category:Java]]
[[Category:Template Languages]]