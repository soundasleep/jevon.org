---
layout: page
title:  "Incompatible List can't be Unboxed in LaTeX"
author: jevon
date:   2011-10-13 16:06:52 +1300
---

[[LaTeX]]

I was getting the following error from [[LaTeX]]:

[code]! Incompatible list can't be unboxed.
\pdf@rect ...\else \expandafter \box \fi \pdf@box 
                                                  \ifdim \dimen@ =\z@ \liter...
l.157 ...tion, \(hyperpage{17}, \hyperpage{16--18}
                                                  , 19,[/code]

One search result mentioned that the problem may be <a href="http://www.tug.org/pipermail/texhax/2006-August/006747.html">tables/floats that are too large to fit on the page</a>. But that wasn't the problem.

The `\hyperpage{16--18}` context suggests that it is a problem with indexing in LaTeX; and yes, the problem was that I was nesting the same index element twice:

[code]
\index{model completion!implementation|(}

% ... more

\index{model completion!implementation|(}

% ... more 

\index{model completion!implementation|)}

% ... more 

\index{model completion!implementation|)}[/code]

[[Category:LaTeX]]