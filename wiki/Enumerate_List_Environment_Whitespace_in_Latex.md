---
layout: page
title:  "Enumerate List Environment Whitespace in Latex"
author: jevon
date:   2011-07-13 13:24:34 +1200
tags:   [Latex]
---

[Latex](Latex.md)

{% include gmf-CSS.md %}Here are a number of ways to reduce the horizontal and vertical whitespace around `enumerate` (and probably `itemize`) lists in [LaTeX](Latex.md). These all assume you are using a list of `compactenum`.

## Default

```
\newenvironment{compactenum}{
  \begin{enumerate}
}{
  \end{enumerate}
}
```

<img src="/img/gmf/latex-enum1.png" class="gmf-left" />

## Smaller

```
\newenvironment{compactenum}{
  \begin{enumerate}[leftmargin=0.75cm,parsep=0pt,topsep=0pt]
}{
  \end{enumerate}
}
```

<img src="/img/gmf/latex-enum2.png" class="gmf-left" />

## Smallest

```
\newenvironment{compactenum}{
  \vspace{-4mm}
  \begin{enumerate}[leftmargin=0.5cm,parsep=0pt,topsep=0pt]
}{
  \end{enumerate}
  \vspace{-4mm}
}
```

<img src="/img/gmf/latex-enum3.png" class="gmf-left" />
