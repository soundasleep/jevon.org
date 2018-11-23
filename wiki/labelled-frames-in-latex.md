---
layout: page
title:  "Labelled Frames in Latex"
author: jevon
date:   2010-05-28 11:29:15 +1200
tags:   [Latex, Code Snippets]
---

[Articles](articles.md) > [Latex](latex.md)

{% include gmf-css.md %}<img src="/img/gmf/latex-frame.png" class="gmf">I wanted to have a frame with a label in [Latex](latex.md), as in the image to the right.

One solution provided by the <a href="http://ctan.tug.org/tex-archive/info/visualFAQ/visualFAQ.pdf">VisualFAQ</a> is to use the fancy verbatim class:

`\begin{Verbatim}[frame=single,label={\texttt{equidem.tex}}]`

However, I didn't want text; I wanted an image, and I wanted in a consistent font.

I found the solution was the following [Latex](latex.md):

```
\begin{figure}[htb]
\centering
  \begin{tabular}{@{}lllr@{}}
    
  & \multirow{2}{*}{Internet Application 'root'} & & \\
  \cline{1-1} \cline{3-4}
  \vline & & & \vline \\
  \vline & \multicolumn{2}{c}{\includegraphics[width=80mm]{models/Source.ps}} & \vline \\
    
  \hline
  \end{tabular}
  \caption{Figure Caption}
  \label{fig:reference}
\end{figure}
```

## Making it Coloured
I also wanted the frame to be a shade of gray. By using **\arrayrulecolor**, the \hlines of a table can be coloured:

`\arrayrulecolor{gray}`

Using **\color** directly allows you to change the colour of vertical lines (but NOT horizontal lines through **\cline**):

`{\color{gray}\vline}`

I also wanted to change the font of the label to a sans-serif font through **\sffamily**. My solution was thus:

```
\begin{figure}[htb]
\centering
  \begin{tabular}{@{}lllr@{}}
    
  & \multirow{2}{*}{\color{gray}\sffamily Internet Application 'root'} & & \\
  \arrayrulecolor{gray}
  \cline{1-1} \cline{3-4}
  \arrayrulecolor{gray}
  {\color{gray}\vline} & & & {\color{gray}\vline} \\
  \arrayrulecolor{gray}
  {\color{gray}\vline} & \multicolumn{2}{c}{\includegraphics[width=80mm]{models/Source.ps}} & {\color{gray}\vline} \\
    
  \hline
  \end{tabular}
  \caption{Figure Caption}
  \label{fig:reference}
\end{figure}
```

## Making it a Command
Finally, I wanted to make this a re-usable command:

```
\begin{figure}[htb]
  % param1: the frame caption
  % param2: the image width
  % param3: the image source
  % param4: the image caption
  % param5: the reference label
  \framedimage{Internet Application 'root'}
    {80mm}
    {models/autocomplete/Source.ps}
    {Autocomplete: Connecting a Domain Source}
    {fig:autocomplete-source2}
\end{figure}
```

This is achieved by adding <a href="http://code.google.com/p/iaml/source/browse/trunk/org.openiaml.docs.tools/latex/framedimage.tex?r=2306">the following source code</a> to your prelude.
