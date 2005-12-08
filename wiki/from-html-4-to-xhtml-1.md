---
layout: page
title:  "From HTML 4 to XHTML 1"
author: jevon
date:   2005-12-09 08:14:42 +1300
---

[[Articles]]

Recently I made a [[Journals]] style that had to be valid to [[XHTML]] (strict) instead of just [[HTML]]. While working on this, I made a couple of observations.

==DOCTYPE==
The doctype for [[XHTML]] strict documents:
[code]<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">[/code]

==IFRAME==
''IFRAME'' is no longer permitted in [[XHTML]], but you can do the same thing with the ''OBJECT'' tag (<a href="http://archivist.incutio.com/viewlist/css-discuss/42402">source</a>):
[code]<object data="sourcefile.html" type="text/html">
(text for other browsers)
</object>[/code]

==NOBR==
''NOBR'' was never part of the [[HTML]] 4.0 standard anyway. To do the same thing in [[CSS]]:
[code].nobr { white-space: nowrap; }[/code]

==IMG==
The ''align="absmiddle"'' attribute is not supported in XHTML, but using ''middle'' seems to work just as well. Also, you can't use a ''border'' attribute on an ''IMG'' tag (use [[CSS]] instead).

[[Category:Article]]
[[Category:HTML]]