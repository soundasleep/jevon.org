---
layout: page
title:  "addcontentsline Doesn't Work in LaTeX"
author: jevon
date:   2011-10-13 10:04:57 +1300
---

[[LaTeX]]

{{gmf-css}}<img src="/img/gmf/addcontents.png" class="gmf" />I was having a problem with [[LaTeX]] where `\addcontentsline` wasn't correctly adding a bookmark entry in the resulting PDF. My original code was like this:

[code]\cleardoublepage
\phantomsection 
\addcontentsline{toc}{chapter}{Bibliography}

\bibliographystyle{thesis}
\bibliography{common/bibliography}

% finally, index
% necessary to add 'Index' to sidebar bookmarks
\cleardoublepage
\phantomsection 
\addcontentsline{toc}{chapter}{Index}
\printindex[/code]

With this code, the Bibliography was included as a bookmark entry, whereas the Index was not. I wanted a table of contents listed as the image to the right.

Strangely enough, if I added another `\addcontentsline` immediately after the Index, this contents line wouldn't be printed either -- ''unless'' there was some additional text following the command, then both contents line would be printed.

It turns out the problem is something to do with delayed output. <a href="http://tex.stackexchange.com/questions/13914/toc-numbering-problem">Following these instructions</a>, I could resolve this problem by defining a new command, `\immediateaddcontentsline`:

[code]\newcommand\immediateaddcontentsline[3]{%
  \begingroup
  \let\origwrite\write
  \def\write{\immediate\origwrite}%
  \addcontentsline{#1}{#2}{#3}%
  \endgroup
}

% finally, index
% necessary to add 'Index' to sidebar bookmarks
\cleardoublepage
\phantomsection 
\immediateaddcontentsline{toc}{chapter}{Index}
\printindex[/code]

It... it boggles the mind.

[[Category:LaTeX]]