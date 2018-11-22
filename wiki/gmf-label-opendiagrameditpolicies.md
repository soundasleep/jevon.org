---
layout: page
title:  "GMF Label OpenDiagramEditPolicies"
author: jevon
date:   2009-05-07 10:53:47 +1200
tags:   [GMF, Technology]
---

[GMF](gmf.md) > [GMF Code Samples](gmf-code-samples.md)

{% include gmf-css.md %}If you have [added a label to your GMF editor](adding-a-custom-label-in-gmf.md), but you want it to open up a sub-diagram when double-clicking (for example, when using [GMF Diagram Partitioning](gmf-diagram-partitioning.md)), it is not too straightforward.

First, you need to add an OpenDiagramEditPolicy to the Label itself in your .gmfgen (similarly to how you need to add OpenDiagramEditPolicies to your nodes). _This information is lost between .gmfgen generations._

Then, based on <a href="http://dev.eclipse.org/newslists/news.eclipse.modeling.gmf/msg08170.html">this newsgroup discussion about Label OpenEditPolicies</a>, add this to the implementation of the OpenDiagramEditPolicy itself (probably through [Dynamic Templates](dynamic-templates.md)):

```
@Override
public EditPart getTargetEditPart(Request request) {
  if (understandsRequest(request) && (getHost() instanceof ShapeNodeEditPart || getHost() instanceof ConnectionNodeEditPart)) {
    return getHost();
  }
  if (understandsRequest(request)) {
    return getHost().getParent();
  }
  return super.getTargetEditPart(request);
}
```

Essentially, this means that if the current host is not a Node with an OpenDiagramEditPolicy (and the Node will contain the information on how to open a new diagram), it will select the parent element.

Make sure you don't add an OpenDiagramEditPolicy to a Label which should not open a diagram, for example an editable field which double-click should normally edit the text field.

This was implemented in [IAML](iaml.md) in <a href="http://code.google.com/p/iaml/source/detail?r=651">revision 651</a>.
