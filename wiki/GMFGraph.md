---
layout: page
title:  GMFGraph
author: jevon
date:   2009-10-19 17:48:15 +13:00
tags:
  - Java
  - GMF
---

[GMFGraph](GMFGraph.md) is the specification of the nodes for graphical editors generated by [GMF](GMF.md).{% include gmf-css.md %}

## Margin Border
_Margin Border_ allows you to add a border/padding to a graphical node. Consider a .gmfgraph node like following:

```
Figure Descriptor XXXFigure
  Rectangle XXXFigure
    Flow Layout true
    ...
    Margin Border
      Insets 3
  Child Access XXXNameFigure
  ...
```

<img src="/img/gmf/margin-border.png" class="gmf">This will add a transparent border of 3px around the sides of the image (generally). However, by default there seems to be a 0px border at the top of the image, 2px bottom, 1px left and 1px right, so <a href="http://code.google.com/p/iaml/issues/detail?id=54">in IAML I use</a> an Inset of the following. This achieves a border effect similar to the one on the right.

```
Bottom = 3
Left = 2
Right = 5
Top = 3
```
