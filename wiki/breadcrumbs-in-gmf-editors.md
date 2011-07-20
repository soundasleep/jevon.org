---
layout: page
title:  "Breadcrumbs in GMF Editors"
author: jevon
date:   2009-02-03 06:19:16 +1300
---

[[GMF]]

{{gmf-css}}<img src="/img/gmf/breadcrumb.png" class="gmf">When using [[GMF Diagram Partitioning|Diagram Partitioning in GMF]], one problem is that you are never sure where in the model you are currently editing when opening a window.

In IAML revisions <a href="http://code.google.com/p/iaml/source/detail?r=436">436</a> and <a href="http://code.google.com/p/iaml/source/detail?r=437">437</a>, I implement a [[GMF Dynamic Templates|dynamic template in GMF]] that adds a breadcrumb-style way of visualising the current path to the root.

You can even use <a href="http://code.google.com/p/iaml/source/browse/trunk/org.openiaml.model.tests/src/org/openiaml/model/tests/eclipse/BreadcrumbTestCase.java?spec=svn438&r=438">automated tests to verify the breadcrumb generation</a>.

[[Category:GMF]]
[[Category:Technology]]