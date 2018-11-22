---
layout: page
title:  "Eclipse Pygments Style"
author: jevon
date:   2010-06-14 13:51:25 +1200
tags:   [Latex, Python, Code Snippets]
---

[Latex](latex.md) / [Python](python.md)

{% include template-pygments-styles.md %}

{% include gmf-css.md %}<a href="http://pygments.org/docs/styles/">Pygments</a> is a [Python](python.md)-based colour syntax highlighter, which can also be connected via <a href="http://tug.ctan.org/tex-archive/macros/latex/contrib/minted/">Minted</a> to perform colour syntax highlighting for [Latex](latex.md). I wanted a style similar to the [Eclipse](eclipse.md) style:

<img src="/img/gmf/pygmentize.png" class="gmf-left">

This was done in [Latex](latex.md) with the following:

```
\usepackage{minted}

...

\begin{document}

\usemintedstyle{eclipse}
\begin{minted}[fontsize=\small]{java}
... [java code here] ...
\end{minted}
```

I achieved this by creating <a href="http://code.google.com/p/iaml/source/browse/trunk/org.openiaml.docs.tools/latex/eclipse.py?spec=svn2289&r=2289">a new eclipse.py style</a>.

Yes, it is very messy :P. Someone should take the above and clean it up, and install it into Pygments correctly. You can also see what it looks like in a [PDF](pdf.md) with both [Java](java.md) and [XML](xml.md): <a href="/img/gmf/partial-code-sample.pdf">partial-code-sample.pdf</a>.
