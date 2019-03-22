---
layout: page
title:  Capital Letter Headings for Index in LaTeX with makeindex
author: jevon
date:   2011-09-29 13:36:35 +13:00
tags:
  - LaTeX
redirect_from:
  - "/wiki/Capital Letter Headings for Index in LaTeX with makeindex"
---

[LaTeX](Latex.md)

By default, `makeindex` will create an index that looks like this:

```
apple, 3

banana, 4
bubble, 5-6

carrot, 7
```

I wanted an index that looked like this:

```
A
apple, 3

B
banana, 4
bubble, 5-6

C
carrot, 7
```

The solution is to <a href="http://www.latex-community.org/forum/viewtopic.php?f=51&t=8096">specify an index style</a>, in an `.ist` file:

```
headings_flag 1
heading_prefix "\\textbf\{"
heading_suffix "\}"
```

And then specifying this file as a `-s` parameter to `makeindex`:

`makeindex -s index.ist input.idx`
