---
layout: page
title:  "GMF Troubleshooting 2"
author: jevon
date:   2008-09-23 11:41:01 +1200
tags:   [Technology, Eclipse, GMF]
---

Following on from [GMF Troubleshooting](gmf-troubleshooting.md). Also see [GMF](GMF.md).

{% include gmf-troubleshooting.md %}

{% include gmf-CSS.md %}**I get the following four errors when trying to generate my .gmfgen file:**
**- Validation failed unexpectedly for 'Gen Top Level Node ...EditPart'.**
**- Validation failed unexpectedly for 'Type Model Facet'.**
**- The required feature 'targetMetaFeature' of 'Type Link Model Facet' must be set.**
**- Validation failed unexpectedly for 'Type Link Model Facet'.**

This may happen if you are creating a Link class, and you have a LinkMapping in your _gmfmap_ that is not properly set. You need to set the "source feature", "target feature" and "diagram link" values in this Link Mapping, so that GMF knows where the link goes.

---
<img src="/img/gmf/link-self.png" class="gmf">**When I save my ecore-based diagram and close it, all the links lose their targets when I re-open it.**

This can happen if the Linking class doesn't have a property for the source of the link, or your "source" value in the gmfmap > Link Mapping is not set.

---
**When generating my diagram code, the new Java project contains Java errors, such as duplicate methods**

This can happen when you try to generate a diagramming project over an existing project. Delete the entire Java project and re-generate it again.

---
<img src="/img/gmf/arrow-one.png" class="gmf">**My link doesn't have an arrow at the end of it**

1. Add a new Polyline Decoration to _.gmfgraph > Canvas > Figure Gallery_ and give it a name
1. Add a new Polyline Connection to the appropriate _.gmfgraph > Canvas > Figure Gallery > Figure Descriptor_ for the link, and set the _Target Decoration_ to your new Polyline Decoration
1. Delete the .gmfgen and regenerate it
1. Regenerate diagram code and re-run application

<img src="/img/gmf/arrow-gmfgraph.png" class="gmf-left">

---
**Tools on the palette are generating the wrong types of objects! Cat is creating Dog, Dog is creating Link, ...**

Check each _Tool Entry_ in _.gmfgen > Gen Editor Generator > Gen Diagram > Palette > Tool Group_, and make sure the "Gen Links" and "Gen Nodes" properties are set correctly.

---
**Changing the title of the wizard in "Create New"**

You can change this in _.genmodel > Model Name_.
