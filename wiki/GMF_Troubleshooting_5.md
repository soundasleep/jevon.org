---
layout: page
title:  GMF Troubleshooting 5
author: jevon
date:   2009-05-01 12:43:17 +12:00
tags:
  - GMF
  - Technology
redirect_from:
  - "/wiki/GMF Troubleshooting 5"
---

**I can't create links between some shortcut elements**

I had this problem when I had a model like so:

```
- Edge
- A
  - aEdges: 0..* Edge
- B
  - bEdges: 0..* Edge
```

I did this because otherwise I couldn't tell the difference between A.edges and B.edges while working on my gmfmap. But as a result, if I went into A's editor and dragged B's on, I couldn't create links starting from shortcut B's. 

After some investigation I found it was because since the gmfmap for A set the containment feature to aEdges, apparently you couldn't drag a link on and it would automatically know to place it in bEdges.

The straightforward - and possibly correct - solution was to do this:

```
- Edge
- abstract ContainsEdges
  - edges: 0..*
- A <- ContainsEdges
- B <- ContainsEdges
```

By doing this, it seems, EMF can store the connections in either A or B without any problem; since they both refer to the same element (ContainsEdges.edges), you can now create shortcuts between the elements in either diagram.
