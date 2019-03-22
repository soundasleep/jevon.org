---
layout: page
title:  Adding a Custom Label in GMF
author: jevon
date:   2009-05-06 12:18:24 +12:00
tags:
  - GMF
  - Technology
redirect_from:
  - "/wiki/Adding a Custom Label in GMF"
---

[GMF](GMF.md) > [GMF Code Samples](GMF_Code_Samples.md)

{% include gmf-css.md %}<img src="/img/gmf/custom-label-3.png" class="gmf">It's not too difficult to directly add a custom label to your [GMF](GMF.md) editor (as pictured to the right).

In the _.gmfgraph_ > _Figure Descriptor_ for your given element node, add a new _Label_ for your new label, along with a _Child Access_. Also add this new Label to the root. If you don't want the editor to render an icon (as shown above), disable this here.

Then, in your _.gmfmap_, add a new _Label Mapping_ for this new Label, and set Read Only to true (unless you want the label to actually be editable).

Finally, all that is left is adding the runtime code to the editor to populate the Label. In the generated code, _diagram.edit.parts.XXXNameEditPart#XXXFigure.createContents()_ is the method which initialises the value of the labels. You can add your code in here manually (or through [Dynamic Templates](Dynamic_Templates.md)):

<img src="/img/gmf/custom-label-1.png" class="gmf">```
// original code
fParentNameFigure = new WrapLabel();
fParentNameFigure.setText("[none]");

// new code: set parent
EObject obj = resolveSemanticElement();
if (obj != null && obj.eContainer() != null && obj.eContainer() instanceof NamedElement)
{
  fParentNameFigure.setText( ((NamedElement) obj.eContainer()).getName() );
}
```

<img src="/img/gmf/custom-label-2.png" class="gmf">The only problem with this approach, is that this value does not automatically update itself when the referenced object changes.

Following <a href="http://dev.eclipse.org/newslists/news.eclipse.modeling.gmf/msg12297.html">a discussion thread on constraint values</a>, we can add a listener ( to changes in the model, and update the model as necessary:

```
NotificationFilter nf = NotificationFilter.createFeatureFilter(
    ModelPackage.eINSTANCE.getNamedElement_Name());
ResourceSetListener rsl = new ResourceSetListenerImpl(nf) {
  @Override
  public void resourceSetChanged(ResourceSetChangeEvent event) {
    refreshLabels();
  }
};
getEditingDomain().addResourceSetListener(rsl);
```

In this way, whenever a model element has its _name_ property changed, the labels will refresh. (This might turn out to be pretty slow for large models: it may help to add more elements to the NotificationFilter by _.and()_-ing it with others.)

This has been implemented in [IAML](IAML.md) using [Dynamic Templates](Dynamic_Templates.md) in <a href="http://code.google.com/p/iaml/source/detail?r=650">revision 650</a>.

**If you want double clicks on the label** to open up a diagram ([GMF Diagram Partitioning](GMF_Diagram_Partitioning.md)), go into the .gmfgen and [add OpenDiagramEditPolicies](GMF_Label_OpenDiagramEditPolicies.md) to each of the labels.
