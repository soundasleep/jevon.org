---
layout: page
title:  "Enumerate List Environment Whitespace in Latex"
author: jevon
date:   2011-07-13 13:24:34 +1200
---

[[Latex]]

{{gmf-css}}Here are a number of ways to reduce the horizontal and vertical whitespace around `enumerate` (and probably `itemize`) lists in [[LaTeX]]. These all assume you are using a list of `compactenum`.

==Default==

[code]\newenvironment{compactenum}{
  \begin{enumerate}
}{
  \end{enumerate}
}[/code]

<img src="/img/gmf/latex-enum1.png" class="gmf-left" />

==Smaller==

[code]\newenvironment{compactenum}{
  \begin{enumerate}[leftmargin=0.75cm,parsep=0pt,topsep=0pt]
}{
  \end{enumerate}
}[/code]

<img src="/img/gmf/latex-enum2.png" class="gmf-left" />

==Smallest==

[code]\newenvironment{compactenum}{
  \vspace{-4mm}
  \begin{enumerate}[leftmargin=0.5cm,parsep=0pt,topsep=0pt]
}{
  \end{enumerate}
  \vspace{-4mm}
}[/code]

<img src="/img/gmf/latex-enum3.png" class="gmf-left" />

[[Category:Latex]]