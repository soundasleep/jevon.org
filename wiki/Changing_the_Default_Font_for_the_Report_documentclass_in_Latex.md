---
layout: page
title:  Changing the Default Font for the Report documentclass in Latex
author: jevon
date:   2010-01-27 13:20:29 +13:00
tags:
  - Latex
redirect_from:
  - "/wiki/Changing the Default Font for the Report documentclass in Latex"
---

[Latex](Latex.md)

I've spent the last five hours trying to format my Latex document; in particular, trying to get a **\documentclass{report}** to all be in the Times font.

This is because using something like `\documentclass[12pt,times]{report}` does nothing (i.e. it does not select **times**, as it does for **{article}** and other document classes).

After an incredible amount of searching, and being inspired by <a href="http://blog.leosoto.com/2007/09/how-to-use-arial-font-in-latex.html">this blog post</a> and <a href="http://www.cl.cam.ac.uk/~rf10/pstex/latexcommands.htm">this reference</a>, the solution is to add this before your **\begin{document}**:

```
\usepackage{mathptmx} % - sets \rmdefault to 'ptm', i.e. times
\renewcommand{\familydefault}{ptm} % using \rmdefault here doesn't work
```

This changes all fonts (headings, equations, bibliography references) to the _times_ font. A list of all of the magic font codes can be found at <a href="http://www.tug.dk/FontCatalogue/">Latex Font Catalogue</a>.

I also noticed that when I managed to change fonts, my bibliography style - _IEEEtran_ - did not correctly use the new default font for its URLs. However, the correct font is still used elsewhere in the document. Thus, I had to disable using _IEEEtran_.
