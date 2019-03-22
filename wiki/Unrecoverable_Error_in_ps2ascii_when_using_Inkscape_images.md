---
layout: page
title:  Unrecoverable Error in ps2ascii when using Inkscape images
author: jevon
date:   2011-01-12 15:16:13 +13:00
tags:
  - Latex
  - Inkscape
  - Articles
redirect_from:
  - "/wiki/unrecoverable_error_in_ps2ascii_when_using_inkscape_images"
  - "/wiki/Unrecoverable Error In Ps2ascii When Using Inkscape Images"
  - "/wiki/unrecoverable error in ps2ascii when using inkscape images"
  - "/wiki/Unrecoverable_Error_In_Ps2ascii_When_Using_Inkscape_Images"
---

[Articles](Articles.md) > [Latex](Latex.md)

I was having a problem where I couldn't use `ps2ascii` on one of my [Postscript](postscript.md) files:

```
> ps2ascii partial-test.ps  1>partial-test.txt
MiKTeX GPL Ghostscript 8.60: Unrecoverable error, exit code 1
```

I looked into the output, and it was displaying:

`Error: /undefined in --.noteimage--`

This [Postscript](postscript.md) file was being generated as part of my [Latex](Latex.md) compilation script. In particular, it had an image at the location it was failing, which was originally a [SVG](svg.md) image exported into [Postscript](postscript.md).

It turned out that the problem was that the image was being exported to PS Level 3, not PS Level 2. So one solution is to export your image at PS Level 2.

However, I didn't have this option available. So instead I wrote a [PHP](PHP.md) script to <a href="http://code.google.com/p/iaml/source/browse/trunk/org.openiaml.docs.tools/latex/strip_cairo_images.php?spec=svn2546&r=2546">strip Cairo images from the PS file</a>, allowing it to be successfully passed to `ps2ascii`.

This script can then successfully be used to strip the Cairo-generated images away from the postscript.

```
$ php -f strip_cairo_images.php partial-test.ps > stripped.ps
$ ps2ascii stripped.ps > stripped.txt
```
