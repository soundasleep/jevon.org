---
layout: page
title:  "LTL Pygments Lexer"
author: jevon
date:   2011-10-06 14:21:46 +1300
tags:   [Code Snippets, Todo]
---

[Python](python.md) / [Latex](latex.md)

{% include template-pygments-styles.md %}

I hacked together a very quick [Eclipse Pygments Style](eclipse-pygments-style.md) for [LTL](ltl.md) and [NuSMV](nusmv.md). It's a very primitive version and currently only supports a few of the keywords that actually exist in the language; if you find missing keywords or other problems, <a href="http://code.google.com/p/iaml/issues/entry">please send through a patch</a> or a feature request. You can download it from <a href="http://code.google.com/p/iaml/source/browse/trunk/org.openiaml.docs.tools/latex/pygments-ltl/">the IAML site</a>.

It creates a <a href="http://iaml.googlecode.com/svn/trunk/org.openiaml.docs.tools/latex/pygments-ltl/code-sample-ltl.pdf">code sample like this</a> from <a href="http://code.google.com/p/iaml/source/browse/trunk/org.openiaml.docs.tools/latex/pygments-ltl/code-sample.tex">this source .tex file</a>.
