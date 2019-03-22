---
layout: page
title:  Breadcrumbs in GMF Editors
author: jevon
date:   2009-02-03 06:19:16 +13:00
tags:
  - GMF
  - Technology
redirect_from:
  - "/wiki/breadcrumbs_in_gmf_editors"
  - "/wiki/Breadcrumbs In Gmf Editors"
  - "/wiki/breadcrumbs in gmf editors"
  - "/wiki/Breadcrumbs_In_Gmf_Editors"
---

[GMF](GMF.md)

{% include gmf-CSS.md %}<img src="/img/gmf/breadcrumb.png" class="gmf">When using [Diagram Partitioning in GMF](GMF_Diagram_Partitioning.md), one problem is that you are never sure where in the model you are currently editing when opening a window.

In IAML revisions <a href="http://code.google.com/p/iaml/source/detail?r=436">436</a> and <a href="http://code.google.com/p/iaml/source/detail?r=437">437</a>, I implement a [dynamic template in GMF](gmf-Dynamic_Templates.md) that adds a breadcrumb-style way of visualising the current path to the root.

You can even use <a href="http://code.google.com/p/iaml/source/browse/trunk/org.openiaml.model.tests/src/org/openiaml/model/tests/eclipse/BreadcrumbTestCase.java?spec=svn438&r=438">automated tests to verify the breadcrumb generation</a>.
