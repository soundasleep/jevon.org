---
layout: page
title:  GMF Custom Figures
author: jevon
date:   2010-04-16 14:32:40 +12:00
tags:
  - GMF
redirect_from:
  - "/wiki/GMF Custom Figures"
---

[GMF](GMF.md)

{% include gmf-CSS.md %}<img src="/img/gmf/custom-figure-1.png" class="gmf">Custom figures are very easy in [GMF](GMF.md) if you want to use polygon-based representations. <a href="http://code.google.com/p/iaml/issues/detail?id=93">I wanted a custom figure</a> as in the diagram on the right.

The solution was to replace the _Rectangle_ with a new _Scalable Polygon_ and keep the previous contents. You also need to add _Template Points_ for each point in the polygon, noting that the first and last points will join up, i.e.:

<img src="/img/gmf/custom-figure-2.png" class="gmf-left">

The <a href="http://code.google.com/p/iaml/source/detail?r=1911">change</a> in the **.gmfgraph** <a href="http://code.google.com/p/iaml/source/diff?spec=svn1911&r=1911&path=/trunk/org.openiaml.model/model/iaml.gmfgraph">looks like this</a>.

If I used just a normal _Polygon_, nothing would render.

For more information check out the <a href="http://wiki.eclipse.org/GMF_Tutorial_Part_3#Composite_Figures">GMF Tutorial Part 3</a> (except this doesn't mention using _Scalable Polygons_).
