---
layout: page
title:  Latex
author: jevon
date:   2014-04-21 16:49:18 +12:00
tags:
  - Article
  - Programming
  - Latex
redirect_from:
  - "/wiki/latex"
---

[Latex](latex.md) is both a great typesetting system which separates presentation from content, and also makes it as difficult as machinely possible to let you properly present your content.

[Articles](articles.md)

1. [A Crude Latex Diff Script in Linux](a-crude-latex-diff-script-in-linux.md)
1. [Images in Latex](images-in-latex.md)
1. [SVG in Latex](svg-in-latex.md)
1. <a href="http://www.msu.edu/~harris41/latex_tablespacing.html">Vertical Spacing in Latex Tables</a>
1. [Horizonal Spacing in Latex Tables](horizonal-spacing-in-latex-tables.md)
1. <a href="http://www.univie.ac.at/nuhag-php/bibtex/bibstyles.pdf">A reference of different types of bibliography styles in Latex</a> {% include pdf-icon.md %}
1. <a href="http://www.imsc.res.in/Computer/symbols-letter.pdf">Comprehensive Latex Symbol List</a> {% include pdf-icon.md %}
1. [My Latex Setup](my-latex-setup.md)
1. [Changing the Default Font for the Report documentclass in Latex](changing-the-default-font-for-the-report-documentclass-in-latex.md)
1. [Removing the Coloured Boxes around Hyperref links in Latex](removing-the-coloured-boxes-around-hyperref-links-in-latex.md)
1. [Eclipse Pygments Style](eclipse-pygments-style.md)
1. [Labelled Frames in Latex](labelled-frames-in-latex.md)
1. <a href="http://stackoverflow.com/questions/2611276/latex-beamer-way-to-change-the-bullet-indentation/2613397#2613397">Changing list indent, spacing, etc, using `enumitem`</a>
1. [Aligning Images in Tables in Latex](aligning-images-in-tables-in-latex.md)
1. [Fancy Quotation Boxes in Latex](fancy-quotation-boxes-in-latex.md)
1. [Unrecoverable Error in ps2ascii when using Inkscape images](unrecoverable-error-in-ps2ascii-when-using-inkscape-images.md)
1. <a href="http://ask.metafilter.com/60851/How-to-center-vertically-in-a-LaTeX-table">Aligning table cells vertically center in LaTeX</a>
1. [Adding UML Guillemots in Latex](adding-uml-guillemots-in-latex.md) and [Adding Special Symbols to Minted Environments](adding-uml-guillemots-in-latex.md)
1. [Enumerate List Environment Whitespace in Latex](enumerate-list-environment-whitespace-in-latex.md)
1. [Maximum Width of Table Captions in LaTeX](maximum-width-of-table-captions-in-latex.md)
1. [Capital Letter Headings for Index in LaTeX with makeindex](capital-letter-headings-for-index-in-latex-with-makeindex.md)
1. [addcontentsline Doesn't Work in LaTeX](addcontentsline-doesn-t-work-in-latex.md)
1. [Incompatible List can't be Unboxed in LaTeX](incompatible-list-can-t-be-unboxed-in-latex.md)
1. <a href="http://elena.aut.ac.nz/ctan/macros/latex/contrib/tocloft/tocloft.pdf">Controlling the Whitespace and Layout of LaTeX Table of Contents</a> {% include pdf-icon.md %}
1. {% include delicious.md %} <a href="http://delicious.com/jevonwright/latex">More Latex bookmarks on delicious</a>

My extensions to [Pygments](pygments.md) to support code formatting and highlighting for various lanuages in [Latex](latex.md):

{% include template-pygments-styles.md %}

Here are some tips I've found when using [Latex](latex.md).

## References
Using the **natbib** package, you can use these commands... see the **natbib.sty** file for more details:

```
renewcommand{cite}{citep}    (makes cite the same as citep)
cite{key}            => (Jones et al., 1990)
citep{key}           => (Jones et al., 1990)
citet{key}           => Jones et al. (1990)
citep[pg. 34]{key}   => (Jones et al., 1990, pg. 34)
citet[ABC:][]{key}   => (ABC: Jones et al., 1990)
```

## Remove Date from Titlepage
When you use maketitle, it uses the following attributes:
```
title
author
date
```

If you want to get rid of the date field, just add
`date{}`

## Clickable Wrapped URLs in Bibtex Bibliography
Argh. For every hour you gain from abandoning [Microsoft Word](microsoft-word.md), you lose trying to configure [Latex](latex.md) to do things that would otherwise be trivial.

If you are using the **latex > dvips > ps2pdf** compilation route for your documents, you may have problems trying to <a href="http://www.tex.ac.uk/cgi-bin/texfaq2html?label=setURL">have URLs in your bibliography</a> that are very long. One option is to manually wrap them yourself (using a space). However, this is better, put at the end of your .tex preamble:

```
% this package adds clickable links to http addresses and footnotes
usepackage{hyperref}
% this package makes url's breakable with hyperref (but loses the cyan boxes)
usepackage{breakurl}
```

## Word Count in Latex
Just use this script somewhere in your compilation process:

`ps2ascii file.pdf | wc -w`

(source: http://www.wlug.org.nz/LatexWordcount)

## Rotating Table Rows
Add this to the prelude:

```
% provides rotatebox{}
usepackage{graphics}

% provides multirow
usepackage{multirow}
```

And then this to the table (this counts as one row):

```
multirow{4}{*}{rotatebox{90}{hi there}}
	& a \
  & b \
  & c \
  & d \
```

## Changing the Font Size of a Table

Just add the font size line in the Table:

```
begin{table}[hbt]
  centering
  small

  begin{tabular}
    .. table content ...
  end{tabular}
  caption{caption}
end{table}
```

## IEEE Formatting: 8.5 x 11-inch Proceedings Manuscripts
For some reason, IEEE does not provide a Latex version of this publication format <a href="ftp://pubftp.computer.org/press/outgoing/proceedings/">on its FTP site</a>. However, this Latex file covers most of the basics of the format: http://cisedu.us/storage/old/cts07/doc/latexformat.htm

## -dEmbedAllFonts with ps2pdf
I was having difficulty adding this command-line parameter to the _ps2pdf_ script call. It appears that the equals operator '=' is not supported; instead you should use hash '#':

`ps2pdf -dEmbedAllFonts#true %1.ps %1.pdf >> create_pdf.log`

## Embedding all fonts with ps2pdf
I was having issue submitting an IEEE paper as they were saying that my fonts, _Times-Roman_, _Times-Italic_ etc were not being embedded. The solution is to use the following command line to _ps2pdf_:

`ps2pdf -dEmbedAllFonts#true -dSubsetFonts#true -dPDFSETTINGS#/prepress %1.ps %1.pdf >> create_pdf.log`

(<a href="https://mail.cs.drexel.edu/pipermail/unix-dev/2005-June/000875.html">reference</a>)

## Overriding and Re-using a Latex Command
If you try to re-use a renewed command like so, Latex will crash with (essentially) an infinite loop:

`renewcommandfoo{something foo something}`

As discussed by <a href="http://www-h.eng.cam.ac.uk/help/tpl/textprocessing/extending_latex.html">this document on extending Latex</a>, you can use the primitive **let** to save a "snapshot" of the current command:

```
letoldFoofoo
renewcommandfoo{something oldFoo something}
```

## Making all URLs in Helvetica
If you use the command `urlstyle{sf}` after the initial _begin{document}_, all URLs in the document (as specified by _url{...}_) will be rendered as a sans-serif font (i.e. Helvetica, or equivalent).

## Tick and Cross Symbols
{% include gmf-css.md %}<img src="/img/gmf/latex-ticks.png" class="gmf">Creating output similar to the right, I found the following symbols worked well:

```
usepackage{amsfonts}
newcommand{tickYes}{checkmark}
usepackage{pifont}
newcommand{tickNo}{hspace{1pt}ding{55}}
```

## pdflatex vs dvipdfm vs dvips-ps2pdf
1. **pdflatex**: I couldn't get it to work with the `hyperref` package (to make bookmarks in Adobe), and it cannot include [EPS](eps.md) images.
1. **dvipdfm**: I couldn't get it to work with the `hyperref` package (to make bookmarks in Adobe), and it threw a lot of warnings.
1. **dvips-ps2pdf**: Not possible to create Tagged PDFs (I think), cannot handle JPEG, PNG images (etc) directly

## Coloured Table Borders
If you have a normal table, you can make borders coloured by <a href="http://dobrzanski.net/2007/04/10/latex-tables/#comment-32726">doing the following</a>. It will also work with **hline** and **cline**:

```
usepackage{array,colortbl}
begin{tabular}{lc}
hline
arrayrulecolor{green} %always at the beginning of a table row
...
```

If you are using **vline**, this won't work; you need to wrap the **vline** with the colour explicitly:

`{color{green}vline}`

## Cannot use -dPDFSETTINGS in Ghostscript
On [Windows](windows.md), you cannot use the **=** character <a href="http://pages.cs.wisc.edu/~ghost/doc/cvs/Use.htm#MS_Windows">in the command line</a>; <a href="http://freshmeat.net/articles/making-presentations-with-latex-and-prosper">you need to use **#**</a>. i.e.:

`ps2pdf -dPDFSETTINGS#/prepress %1.ps %1.pdf`

## Bad Image Compression (JPEG-like) when using ps2pdf
I had a frequently-recurring problem that my generated PDFs were resampling and compressing many of the bitmap images in my PDF into JPEGs.

The solution was to tell [Ghostscript](ghostscript.md) to use _prepress_ [PDF](pdf.md) settings.

## @ (at sign) in LaTeX index
I wanted an index entry with an `@` sign. After much stress, I found the <a href="http://linux.die.net/man/1/makeindex">man page for makeindex</a>, and found one solution:

`index{"@@"@generated tag}`

This will create an index entry named "@generated tag". I couldn't work out _any_ way to also apply additional formatting, i.e. none of these worked:

```
index{generated tag@$@$texttt{generated} tag}
index{"@@"@generated tag@texttt{"@@"@generated} tag}
index{"@@"@generated tag@texttt{@generated} tag}
index{"@@"@generated tag@"@@"texttt{@generated} tag}
```

Perhaps if you read the <a href="http://www.tex.ac.uk/tex-archive/indexing/makeindex/doc/makeindex.pdf" class="pdf">makeindex documentation</a> you might work it out ;)

## Disabling Footnotes
It is fairly simple to remove all footnotes throughout your LaTeX document, just define the following command in the preamble:

`renewcommand{footnote}[1]{}`
