---
layout: page
title:  "Using EOpposite in GMF"
author: jevon
date:   2009-04-07 19:15:18 +1200
---

[[GMF]] / [[EMF]] / [[Ecore]]

{{gmf-css}}<img src="/img/gmf/eopposite-4.png" class="gmf">By using the "EOpposite" feature, you can have models instead of:
[code]- Page A
  - Link Z to: Page B
- Page B[/code]

To be instead:
[code]- Page A
  - Link Z to: Page B
- Page B in: Z[/code]

More information about this is available in the article on [[Ecore]], specifically [[Ecore|I want to be able to go backwards through a reference]].

==Set EOpposite properly in the Ecore model==

<img src="/img/gmf/eopposite-3.png" class="gmf">In the example above, you want the following model:
[code]- Page
  - reference "in": 0..* of type Link
  - containment reference "links": 0..* of type Link, containment is true
- Link
  - reference "to": 1 of type Page[/code]

To set EOpposite properly, you want to change this to:
[code]- Page
  - reference "in": 0..* of type Link, EOpposite is Link.to
  - containment reference "links": 0..* of type Link, containment is true, EOpposite is Link.from
- Link
  - reference "to": 1 of type Page, EOpposite is Page.in
  - reference "from": 1 of type Page, EOpposite is Page.links[/code]

# Regenerate the .genmodel from your changed .ecore file
# Regenerate the Model, Edit and Editor code

==Set the Link Mapping properly in .gmfmap==

# In Link Mapping, make sure ''Source Feature'' and ''Target Feature'' are properly set.
# Regenerate the .gmfmap file
# Regenerate the diagram code

[[Category:GMF]]
[[Category:EMF]]
[[Category:Ecore]]
[[Category:Technology]]