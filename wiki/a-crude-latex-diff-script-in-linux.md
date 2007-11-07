---
layout: page
title:  "A Crude Latex Diff Script in Linux"
author: jevon
date:   2007-11-08 08:25:18 +1300
---

[[Articles]] > [[Latex]]

Here's a quick and crude script to create a diff .tex file in [[Linux]] between two [[Latex]] revisions. It will highlight new and changed pargraphs in red, and ignore the removed ones. Make sure you use \usepackage{color}.

[code]$ diff [original].tex [latest].tex -u | 
sed 's/^+\([^+%\].\+\)/+\\textcolor{red}{\1}/g' | 
patch -u [original].tex -o [output].tex[/code]

[[Category:Article]]
[[Category:Latex]]
[[Category:Linux]]