---
layout: page
title:  "Adding UML Guillemots in Latex"
author: jevon
date:   2011-07-19 15:20:58 +1200
---

[[Latex]]{{gmf-css}}

==Within Text==
<img src="/img/gmf/minted-1.png" class="gmf">
[code]\usepackage{aeguill}
\newcommand{\stereotype}[1]{
	\guillemotleft {#1}\guillemotright
}[/code]

You can now use [code]\stereotype{class}[/code] to create «class».

==Within Verbatim==
<img src="/img/gmf/minted-2.png" class="gmf">If you want to add a special symbol within the `verbatim` environment, things get a lot more interesting. First, you have to add a package to add the `\text` command in math mode:

[code]% for \text in math mode
\usepackage{amstext}[/code]

Now, you need to <a href="http://stackoverflow.com/questions/682201/latex-tildes-and-verbatim-mode">tell verbatim to allow specific characters to be escaped</a>:

[code]\begin{verbatim}[commandchars=\\\{\}]
\stereotype{class}
or \text{\guillemotleft}class\text{\guillemotright}
\end{verbatim}[/code]

BUT, this also means that all other \'s in your environment will now be LaTeX-enabled. Good luck working out how to turn that off ;)

==Within Minted==
<img src="/img/gmf/minted-3.png" class="gmf">[[Minted]] is a fantastic package for adding colour formatting to source code listings. But it can't handle special characters. Internally, it uses the same "commandchars" tag for `verbatim` as above; the problem is that Pygments automatically escapes all \s in the text.

My nasty solution is to define special escape characters for \, { and }:

* `\!!\` becomes `\`
* `\!!{` becomes `{`
* `\!!}` becomes `}`

You can then patch your `Pygments\formatters\latex.py` with <a href="http://code.google.com/p/iaml/source/browse/trunk/org.openiaml.docs.tools/latex/latex.py.patch">the following patch</a>.

Finally, with a mode that is defined to '''mathescape=true''', you can use the technique above to finally get special symbols:

[code]\begin{xmlcode}
\!!\stereotype\!!{class\!!}
or \!!\text\!!{\!!\guillemotleft\!!}class\!!\text\!!{\!!\guillemotright\!!}
\end{xmlcode}[/code]

Note that this doesn't work in all environments; for example, the [[Java]] environment automatically reformats the \s before LaTeX is given a chance to. The effort necessary to disable this might resemble something <a href="http://code.google.com/p/iaml/source/detail?r=3019">like this revision</a>, which disabled `Operators` and redefined the meaning of `Text`.

From here, you could write a batch script to automatically insert these symbols in, or you could redefine the special escape phrases, etc.

[[Category:Latex]]