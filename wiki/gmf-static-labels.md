---
layout: page
title:  "GMF Static Labels"
author: jevon
date:   2008-09-11 10:07:55 +1200
tags:   [GMF, Technology]
---

Yet another article on [GMF](gmf.md).

{% include gmf-css.md %}<img src="/img/gmf/static-label.png" class="gmf">If you want to add a static label to a GMF connection, like on the right:

1. _.gmfgraph > Figure Gallery > Figure Descriptor your_figure > Polyline Connection_: Add a Label, set _Descriptor_ and _Name_, and with the desired _Text_ (e.g. "navigate").
1. _.gmfgraph > Figure Gallery > Figure Descriptor your_figure_: Add a _Child Access_ to the new Label that you created, and give it a name.
1. _.gmfgraph_: Add a new Diagram Label (at the bottom) and link _Accessor_ to your Child Access; _Figure_ to your_figure; and give it a _Name_.
1. _.gmfmap > Link Mapping &lt;your_link_mapping&gt;_: Add a Design Label Mapping, and link it to the Diagram Label. Set _Read Only_ to true.
1. Re-generate the .gmfgen and diagram code!

<img src="/img/gmf/static-label-gmf.png" class="gmf">Also see [GMF Troubleshooting](gmf-troubleshooting.md).
