---
layout: page
title:  "Fancy Quotation Boxes in Latex"
author: jevon
date:   2010-12-21 12:23:24 +1300
---

[[Latex]]

{{gmf-css}}<img src="/img/gmf/latex-fancy-quote.png" class="gmf">I wanted to have some fancy boxes for displaying particular definitions - in my case, formal definitions - that would be readable, span pages, and easy to use. I wanted a left-hand margin border and background shading for the entire box.

After much searching and modification, I found that the '''framed''' package worked well, after some modifications. I can then use the following [[Latex]] code:

[code]\begin{formal}
Some text goes here.
\end{formal}[/code]

Which will produce an output similar to that at the right.

The definition for the `formal` environment is as follows:

[code]% for adjustwidth environment
\usepackage[strict]{changepage}

% for formal definitions
\usepackage{framed}

% environment derived from framed.sty: see leftbar environment definition
\definecolor{formalshade}{rgb}{0.95,0.95,1}

\newenvironment{formal}{%
  \def\FrameCommand{%
    \hspace{1pt}%
    {\color{darkblue}\vrule width 2pt}%
    {\color{formalshade}\vrule width 4pt}%
    \colorbox{formalshade}%
  }%
  \MakeFramed{\advance\hsize-\width\FrameRestore}%
  \noindent\hspace{-4.55pt}% disable indenting first paragraph
  \begin{adjustwidth}{}{7pt}%
  \vspace{2pt}\vspace{2pt}%
}
{%
  \vspace{2pt}\end{adjustwidth}\endMakeFramed%
}[/code]

[[Category:Latex]]
[[Category:Article]]