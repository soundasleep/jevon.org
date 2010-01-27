---
layout: page
title:  "Removing the Coloured Boxes around Hyperref links in Latex"
author: jevon
date:   2010-01-27 13:16:34 +1300
---

[[Latex]]

If you (can) use the '''hyperref''' package in [[Latex]] to correctly format your URLs, they are by default created with a coloured box around them. This is achieved in your document header as follows:

[code]\usepackage{hyperref}[/code]

There are two ways to modify the output of coloured boxes:

==1. Change coloured boxes into coloured links==
By adding the ''colorlinks=true'' parameter, the coloured boxes will be removed, and the linked text will become coloured. However, these colours will show up in printing!

[code]\usepackage[colorlinks=true]{hyperref}[/code]

==2. Remove the coloured boxes but keep the hyperlinks==
So one option is to replace all the coloured links to the default colour (in this case, black). However, make sure that the default text colour is actually black; for example, '''\documentclass{report}''' is actually a dark shade of gray.

[code]\usepackage[colorlinks=true,linkcolor=black,anchorcolor=black,citecolor=black,filecolor=black,menucolor=black,runcolor=black,urlcolor=black]{hyperref}[/code]

[[Category:Latex]]