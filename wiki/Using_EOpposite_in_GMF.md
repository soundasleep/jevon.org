---
layout: page
title:  Using EOpposite in GMF
author: jevon
date:   2009-04-07 19:15:18 +12:00
tags:
  - GMF
  - EMF
  - Ecore
  - Technology
redirect_from:
  - "/wiki/Using EOpposite in GMF"
---

[GMF](GMF.md) / [EMF](EMF.md) / [Ecore](Ecore.md)

{% include gmf-CSS.md %}<img src="/img/gmf/eopposite-4.png" class="gmf">By using the "EOpposite" feature, you can have models instead of:
```
- Page A
  - Link Z to: Page B
- Page B
```

To be instead:
```
- Page A
  - Link Z to: Page B
- Page B in: Z
```

More information about this is available in the article on [Ecore](Ecore.md), specifically [I want to be able to go backwards through a reference](Ecore.md).

## Set EOpposite properly in the Ecore model

<img src="/img/gmf/eopposite-3.png" class="gmf">In the example above, you want the following model:
```
- Page
  - reference "in": 0..* of type Link
  - containment reference "links": 0..* of type Link, containment is true
- Link
  - reference "to": 1 of type Page
```

To set EOpposite properly, you want to change this to:
```
- Page
  - reference "in": 0..* of type Link, EOpposite is Link.to
  - containment reference "links": 0..* of type Link, containment is true, EOpposite is Link.from
- Link
  - reference "to": 1 of type Page, EOpposite is Page.in
  - reference "from": 1 of type Page, EOpposite is Page.links
```

1. Regenerate the .genmodel from your changed .ecore file
1. Regenerate the Model, Edit and Editor code

## Set the Link Mapping properly in .gmfmap

1. In Link Mapping, make sure _Source Feature_ and _Target Feature_ are properly set.
1. Regenerate the .gmfmap file
1. Regenerate the diagram code
