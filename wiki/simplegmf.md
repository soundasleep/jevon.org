---
layout: page
title:  "SimpleGMF"
author: jevon
date:   2011-05-07 09:09:53 +1200
---

[[SimpleGMF]] is a metamodel for the abstraction of [[GMF]] diagrams. At some point in the future I will write up about this approach.

---
'''java.lang.ClassCastException: org.eclipse.gmf.gmfgraph.impl.NodeImpl cannot be cast to org.eclipse.gmf.gmfgraph.Connection'''

An Edge is erroneously being generated as a Node in the .gmfgraph. Make sure that the GMFConfiguration > edgeTypes reference is set correctly.

[[Category:GMF]]
[[Category:Todo]]