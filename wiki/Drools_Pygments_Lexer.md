---
layout: page
title:  Drools Pygments Lexer
author: jevon
date:   2010-06-14 13:58:21 +12:00
tags:
  - Code Snippets
redirect_from:
  - "/wiki/Drools Pygments Lexer"
  - "/wiki/Drools Pygments Style"
  - "/wiki/Drools_Pygments_Style"
---

[Python](Python.md) / [Latex](Latex.md)

{% include template-pygments-styles.md %}

I hacked together a very quick [Eclipse Pygments Style](Eclipse_Pygments_Style.md) for [Drools](Drools.md). It's basically a direct copy of the [Java](Java.md) lexer, except that it has the <a href="http://downloads.jboss.com/drools/docs/4.0.4.17825.GA/html_single/index.html#d0e2641">Drools keywords</a> included. You can download it from <a href="http://code.google.com/p/iaml/source/browse/trunk/org.openiaml.docs.tools/latex/pygments-drools/">the IAML site</a>.

It creates a <a href="http://iaml.googlecode.com/svn/trunk/org.openiaml.docs.tools/latex/pygments-drools/code-sample-drools.pdf">code sample like this</a> from <a href="http://code.google.com/p/iaml/source/browse/trunk/org.openiaml.docs.tools/latex/pygments-drools/code-sample.tex">this source .tex file</a>.
