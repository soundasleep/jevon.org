---
layout: page
title:  "Horizonal Spacing in Latex Tables"
author: jevon
date:   2011-03-16 08:31:01 +1300
---

[[Latex]]

I wanted the alternative to <a href="http://www.msu.edu/~harris41/latex_tablespacing.html">vertical spacing in latex tables</a>. I was trying to reduce some of the unnecessary whitespace in [[Labelled Frames in Latex]]. It turns out the (almost) analogy to `\arraystretch` is `\tabcolsep`: 

[code]\begin{figure}[tb]
  \renewcommand\arraystretch{1.0}
  \renewcommand\tabcolsep{0pt}
  \centering
  \begin{tabular}{lr}
    
   ...

  \end{tabular}
  \caption{Caption}
  \label{fig:label}
\end{figure}[/code]

This will make a very small table.

[[Category:Latex]]