---
layout: page
title:  "Eclipse Pygments Style"
author: jevon
date:   2010-06-14 13:51:25 +1200
---

[[Latex]] / [[Python]]

{{template:Pygments styles}}

{{gmf-css}}<a href="http://pygments.org/docs/styles/">Pygments</a> is a [[Python]]-based colour syntax highlighter, which can also be connected via <a href="http://tug.ctan.org/tex-archive/macros/latex/contrib/minted/">Minted</a> to perform colour syntax highlighting for [[Latex]]. I wanted a style similar to the [[Eclipse]] style:

<img src="/img/gmf/pygmentize.png" class="gmf-left">

This was done in [[Latex]] with the following:

[code]\usepackage{minted}

...

\begin{document}

\usemintedstyle{eclipse}
\begin{minted}[fontsize=\small]{java}
... [java code here] ...
\end{minted}[/code]

I achieved this by creating <a href="http://code.google.com/p/iaml/source/browse/trunk/org.openiaml.docs.tools/latex/eclipse.py?spec=svn2289&r=2289">a new eclipse.py style</a>.

Yes, it is very messy :P. Someone should take the above and clean it up, and install it into Pygments correctly. You can also see what it looks like in a [[PDF]] with both [[Java]] and [[XML]]: <a href="/img/gmf/partial-code-sample.pdf">partial-code-sample.pdf</a>.

[[Category:Latex]]
[[Category:Python]]
[[Category:Code Snippets]]