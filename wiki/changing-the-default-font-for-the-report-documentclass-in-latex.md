---
layout: page
title:  "Changing the Default Font for the Report documentclass in Latex"
author: jevon
date:   2010-01-27 13:20:29 +1300
---

[[Latex]]

I've spent the last five hours trying to format my Latex document; in particular, trying to get a '''\documentclass{report}''' to all be in the Times font.

This is because using something like [code]\documentclass[12pt,times]{report}[/code] does nothing (i.e. it does not select '''times''', as it does for '''{article}''' and other document classes).

After an incredible amount of searching, and being inspired by <a href="http://blog.leosoto.com/2007/09/how-to-use-arial-font-in-latex.html">this blog post</a> and <a href="http://www.cl.cam.ac.uk/~rf10/pstex/latexcommands.htm">this reference</a>, the solution is to add this before your '''\begin{document}''':

[code]\usepackage{mathptmx} % - sets \rmdefault to 'ptm', i.e. times
\renewcommand{\familydefault}{ptm} % using \rmdefault here doesn't work[/code]

This changes all fonts (headings, equations, bibliography references) to the ''times'' font. A list of all of the magic font codes can be found at <a href="http://www.tug.dk/FontCatalogue/">Latex Font Catalogue</a>.

I also noticed that when I managed to change fonts, my bibliography style - ''IEEEtran'' - did not correctly use the new default font for its URLs. However, the correct font is still used elsewhere in the document. Thus, I had to disable using ''IEEEtran''.

[[Category:Latex]]