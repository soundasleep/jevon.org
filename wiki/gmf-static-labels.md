---
layout: page
title:  "GMF Static Labels"
author: jevon
date:   2008-09-11 10:07:55 +1200
---

Yet another article on [[GMF]].

{{gmf-css}}<img src="/img/gmf/static-label.png" class="gmf">If you want to add a static label to a GMF connection, like on the right:

# ''.gmfgraph > Figure Gallery > Figure Descriptor your_figure > Polyline Connection'': Add a Label, set ''Descriptor'' and ''Name'', and with the desired ''Text'' (e.g. "navigate").
# ''.gmfgraph > Figure Gallery > Figure Descriptor your_figure'': Add a ''Child Access'' to the new Label that you created, and give it a name.
# ''.gmfgraph'': Add a new Diagram Label (at the bottom) and link ''Accessor'' to your Child Access; ''Figure'' to your_figure; and give it a ''Name''.
# ''.gmfmap > Link Mapping &lt;your_link_mapping&gt;'': Add a Design Label Mapping, and link it to the Diagram Label. Set ''Read Only'' to true.
# Re-generate the .gmfgen and diagram code!

<img src="/img/gmf/static-label-gmf.png" class="gmf">Also see [[GMF Troubleshooting]].

[[Category:GMF]]
[[Category:Technology]]