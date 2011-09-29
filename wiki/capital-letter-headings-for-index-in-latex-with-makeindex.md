---
layout: page
title:  "Capital Letter Headings for Index in LaTeX with makeindex"
author: jevon
date:   2011-09-29 13:36:35 +1300
---

[[LaTeX]]

By default, `makeindex` will create an index that looks like this:

[code]apple, 3

banana, 4
bubble, 5-6

carrot, 7[/code]

I wanted an index that looked like this:

[code]A
apple, 3

B
banana, 4
bubble, 5-6

C
carrot, 7[/code]

The solution is to <a href="http://www.latex-community.org/forum/viewtopic.php?f=51&t=8096">specify an index style</a>, in an `.ist` file:

[code]headings_flag 1
heading_prefix "\\textbf\{"
heading_suffix "\}"[/code]

And then specifying this file as a `-s` parameter to `makeindex`:

[code]makeindex -s index.ist input.idx[/code]

[[Category:LaTeX]]