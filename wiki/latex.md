---
layout: page
title:  "Latex"
author: jevon
date:   2011-10-14 14:16:30 +1300
---

[[Latex]] is both a great typesetting system which separates presentation from content, and also makes it as difficult as machinely possible to let you properly present your content.

[[Articles]]

# [[A Crude Latex Diff Script in Linux]]
# [[Images in Latex]]
# [[SVG in Latex]]
# <a href="http://www.msu.edu/~harris41/latex_tablespacing.html">Vertical Spacing in Latex Tables</a>
# [[Horizonal Spacing in Latex Tables]]
# <a href="http://amath.colorado.edu/documentation/LaTeX/reference/faq/bibstyles.pdf">A reference of different types of bibliography styles in Latex</a> {{pdf-icon}}
# <a href="http://www.imsc.res.in/Computer/symbols-letter.pdf">Comprehensive Latex Symbol List</a> {{pdf-icon}}
# [[My Latex Setup]]
# [[Changing the Default Font for the Report documentclass in Latex]]
# [[Removing the Coloured Boxes around Hyperref links in Latex]]
# [[Eclipse Pygments Style]]
# [[Labelled Frames in Latex]]
# <a href="http://stackoverflow.com/questions/2611276/latex-beamer-way-to-change-the-bullet-indentation/2613397#2613397">Changing list indent, spacing, etc, using `enumitem`</a>
# [[Aligning Images in Tables in Latex]]
# [[Fancy Quotation Boxes in Latex]]
# [[Unrecoverable Error in ps2ascii when using Inkscape images]]
# <a href="http://ask.metafilter.com/60851/How-to-center-vertically-in-a-LaTeX-table">Aligning table cells vertically center in LaTeX</a>
# [[Adding UML Guillemots in Latex]] and [[Adding UML Guillemots in Latex|Adding Special Symbols to Minted Environments]]
# [[Enumerate List Environment Whitespace in Latex]]
# [[Maximum Width of Table Captions in LaTeX]]
# [[Capital Letter Headings for Index in LaTeX with makeindex]]
# [[addcontentsline Doesn't Work in LaTeX]]
# [[Incompatible List can't be Unboxed in LaTeX]]
# <a href="http://elena.aut.ac.nz/ctan/macros/latex/contrib/tocloft/tocloft.pdf">Controlling the Whitespace and Layout of LaTeX Table of Contents</a> {{pdf-icon}}
# {{delicious}} <a href="http://delicious.com/jevonwright/latex">More Latex bookmarks on delicious</a>

My extensions to [[Pygments]] to support code formatting and highlighting for various lanuages in [[Latex]]:

{{template:Pygments styles}}

Here are some tips I've found when using [[Latex]].

==References==
Using the '''natbib''' package, you can use these commands... see the '''natbib.sty''' file for more details:

[code]\renewcommand{\cite}{\citep}    (makes \cite the same as \citep)
\cite{key}            => (Jones et al., 1990)
\citep{key}           => (Jones et al., 1990)
\citet{key}           => Jones et al. (1990)
\citep[pg. 34]{key}   => (Jones et al., 1990, pg. 34)
\citet[ABC:][]{key}   => (ABC: Jones et al., 1990)[/code]

==Remove Date from Titlepage==
When you use \maketitle, it uses the following attributes:
[code]\title
\author
\date[/code]

If you want to get rid of the date field, just add
[code]\date{}[/code]

==Clickable Wrapped URLs in Bibtex Bibliography==
Argh. For every hour you gain from abandoning [[Microsoft Word]], you lose trying to configure [[Latex]] to do things that would otherwise be trivial.

If you are using the '''latex > dvips > ps2pdf''' compilation route for your documents, you may have problems trying to <a href="http://www.tex.ac.uk/cgi-bin/texfaq2html?label=setURL">have URLs in your bibliography</a> that are very long. One option is to manually wrap them yourself (using a space). However, this is better, put at the end of your .tex preamble:

[code]% this package adds clickable links to http addresses and footnotes
\usepackage{hyperref}
% this package makes url's breakable with hyperref (but loses the cyan boxes)
\usepackage{breakurl}[/code]

==Word Count in Latex==
Just use this script somewhere in your compilation process:

[code]ps2ascii file.pdf | wc -w[/code]

(source: http://www.wlug.org.nz/LatexWordcount)

==Rotating Table Rows==
Add this to the prelude:

[code]% provides \rotatebox{}
\usepackage{graphics}

% provides multirow
\usepackage{multirow}[/code]

And then this to the table (this counts as one row):

[code]\multirow{4}{*}{\rotatebox{90}{hi there}}
	& a \\
  & b \\
  & c \\
  & d \\[/code]

==Changing the Font Size of a Table==

Just add the font size line in the Table:

[code]\begin{table}[hbt]
  \centering
  \small

  \begin{tabular}
    .. table content ...
  \end{tabular}
  \caption{caption}
\end{table}[/code]

==IEEE Formatting: 8.5 x 11-inch Proceedings Manuscripts==
For some reason, IEEE does not provide a Latex version of this publication format <a href="ftp://pubftp.computer.org/press/outgoing/proceedings/">on its FTP site</a>. However, this Latex file covers most of the basics of the format: http://cisedu.us/storage/old/cts07/doc/latexformat.htm

==-dEmbedAllFonts with ps2pdf==
I was having difficulty adding this command-line parameter to the ''ps2pdf'' script call. It appears that the equals operator '=' is not supported; instead you should use hash '#':

[code]ps2pdf -dEmbedAllFonts#true %1.ps %1.pdf >> create_pdf.log[/code]

==Embedding all fonts with ps2pdf==
I was having issue submitting an IEEE paper as they were saying that my fonts, ''Times-Roman'', ''Times-Italic'' etc were not being embedded. The solution is to use the following command line to ''ps2pdf'':

[code]ps2pdf -dEmbedAllFonts#true -dSubsetFonts#true -dPDFSETTINGS#/prepress %1.ps %1.pdf >> create_pdf.log[/code]

(<a href="https://mail.cs.drexel.edu/pipermail/unix-dev/2005-June/000875.html">reference</a>)

==Overriding and Re-using a Latex Command==
If you try to re-use a renewed command like so, Latex will crash with (essentially) an infinite loop:

[code]\renewcommand\foo{something \foo something}[/code]

As discussed by <a href="http://www-h.eng.cam.ac.uk/help/tpl/textprocessing/extending_latex.html">this document on extending Latex</a>, you can use the primitive '''\let''' to save a "snapshot" of the current command:

[code]\let\oldFoo\foo
\renewcommand\foo{something \oldFoo something}[/code]

==Making all URLs in Helvetica==
If you use the command [code]\urlstyle{sf}[/code] after the initial ''\begin{document}'', all URLs in the document (as specified by ''\url{...}'') will be rendered as a sans-serif font (i.e. Helvetica, or equivalent).

==Tick and Cross Symbols==
{{gmf-css}}<img src="/img/gmf/latex-ticks.png" class="gmf">Creating output similar to the right, I found the following symbols worked well:

[code]\usepackage{amsfonts}
\newcommand{\tickYes}{\checkmark}
\usepackage{pifont}
\newcommand{\tickNo}{\hspace{1pt}\ding{55}}[/code]

==pdflatex vs dvipdfm vs dvips-ps2pdf==
# '''pdflatex''': I couldn't get it to work with the `hyperref` package (to make bookmarks in Adobe), and it cannot include [[EPS]] images.
# '''dvipdfm''': I couldn't get it to work with the `hyperref` package (to make bookmarks in Adobe), and it threw a lot of warnings.
# '''dvips-ps2pdf''': Not possible to create Tagged PDFs (I think), cannot handle JPEG, PNG images (etc) directly

==Coloured Table Borders==
If you have a normal table, you can make borders coloured by <a href="http://dobrzanski.net/2007/04/10/latex-tables/#comment-32726">doing the following</a>. It will also work with '''\hline''' and '''\cline''':

[code]\usepackage{array,colortbl}
\begin{tabular}{lc}
\hline
\arrayrulecolor{green} %always at the beginning of a table row
...[/code]

If you are using '''\vline''', this won't work; you need to wrap the '''\vline''' with the colour explicitly:

[code]{\color{green}\vline}[/code]

==Cannot use -dPDFSETTINGS in Ghostscript==
On [[Windows]], you cannot use the '''=''' character <a href="http://pages.cs.wisc.edu/~ghost/doc/cvs/Use.htm#MS_Windows">in the command line</a>; <a href="http://freshmeat.net/articles/making-presentations-with-latex-and-prosper">you need to use '''#'''</a>. i.e.:

[code]ps2pdf -dPDFSETTINGS#/prepress %1.ps %1.pdf[/code]

==Bad Image Compression (JPEG-like) when using ps2pdf==
I had a frequently-recurring problem that my generated PDFs were resampling and compressing many of the bitmap images in my PDF into JPEGs.

The solution was to tell [[Ghostscript]] to use ''prepress'' [[PDF]] settings.

==@ (at sign) in LaTeX index==
I wanted an index entry with an `@` sign. After much stress, I found the <a href="http://linux.die.net/man/1/makeindex">man page for makeindex</a>, and found one solution:

[code]\index{"@@"@generated tag}[/code]

This will create an index entry named "@generated tag". I couldn't work out ''any'' way to also apply additional formatting, i.e. none of these worked:

[code]\index{generated tag@$@$\texttt{generated} tag}
\index{"@@"@generated tag@\texttt{"@@"@generated} tag}
\index{"@@"@generated tag@\texttt{@generated} tag}
\index{"@@"@generated tag@"@@"\texttt{@generated} tag}[/code]

Perhaps if you read the <a href="http://www.tex.ac.uk/tex-archive/indexing/makeindex/doc/makeindex.pdf" class="pdf">makeindex documentation</a> you might work it out ;)

==Disabling Footnotes==
It is fairly simple to remove all footnotes throughout your LaTeX document, just define the following command in the preamble:

[code]\renewcommand{\footnote}[1]{}[/code]

[[Category:Article]]
[[Category:Programming]]
[[Category:Latex]]