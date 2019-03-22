---
layout: page
title:  From HTML 4 to XHTML 1
author: jevon
date:   2005-12-09 08:14:42 +13:00
tags:
  - Article
  - HTML
redirect_from:
  - "/wiki/From HTML 4 to XHTML 1"
---

[Articles](Articles.md)

Recently I made a [Journals](Journals.md) style that had to be valid to [XHTML](xhtml.md) (strict) instead of just [HTML](html.md). While working on this, I made a couple of observations.

## DOCTYPE
The doctype for [XHTML](xhtml.md) strict documents:
`<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">`

## IFRAME
_IFRAME_ is no longer permitted in [XHTML](xhtml.md), but you can do the same thing with the _OBJECT_ tag (<a href="http://archivist.incutio.com/viewlist/css-discuss/42402">source</a>):
```
<object data="sourcefile.html" type="text/html">
(text for other browsers)
</object>
```

## NOBR
_NOBR_ was never part of the [HTML](html.md) 4.0 standard anyway. To do the same thing in [CSS](CSS.md):
`.nobr { white-space: nowrap; }`

## IMG
The _align="absmiddle"_ attribute is not supported in XHTML, but using _middle_ seems to work just as well. Also, you can't use a _border_ attribute on an _IMG_ tag (use [CSS](CSS.md) instead).
