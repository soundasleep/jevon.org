---
layout: page
title:  "Maximum Width of Table Captions in LaTeX"
author: jevon
date:   2011-09-23 14:27:35 +1200
---

[[LaTeX]]

By default, table and figure captions in LaTeX will wrap to the full page width. If you are using the `caption` package, it is fairly straightforward to <a href="http://stackoverflow.com/questions/3322563/make-latex-table-caption-same-width-as-table/3322990#3322990">set a smaller maximum width</a>:

[code]\captionsetup{width=100mm}[/code]

Or, you can set it to a ratio of your actual page width:

[code]\captionsetup{width=0.9\textwidth}[/code]

[[Category:LaTeX]]