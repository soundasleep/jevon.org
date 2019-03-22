---
layout: page
title:  A Crude Latex Diff Script in Linux
author: jevon
date:   2007-11-08 08:25:18 +13:00
tags:
  - Article
  - Latex
  - Linux
redirect_from:
  - "/wiki/a_crude_latex_diff_script_in_linux"
  - "/wiki/A Crude Latex Diff Script In Linux"
  - "/wiki/a crude latex diff script in linux"
  - "/wiki/A_Crude_Latex_Diff_Script_In_Linux"
---

[Articles](Articles.md) > [Latex](Latex.md)

Here's a quick and crude script to create a diff .tex file in [Linux](Linux.md) between two [Latex](Latex.md) revisions. It will highlight new and changed pargraphs in red, and ignore the removed ones. Make sure you use \usepackage{color}.

```
$ diff [original].tex [latest].tex -u | 
sed 's/^+\([^+%\].\+\)/+\\textcolor{red}{\1}/g' | 
patch -u [original].tex -o [output].tex
```
