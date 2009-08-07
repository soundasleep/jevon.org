---
layout: page
title:  "Initialising new elements in a new GMF diagram"
author: jevon
date:   2009-08-07 13:35:49 +1200
---

[[GMF]]

To initialise the initial contents of a newly created [[GMF]] diagram, simply modify the code in XXXDiagramEditorUtil.createInitialModel():

[code]private static InternetApplication createInitialModel() {
  // default code
  InternetApplication app = ModelFactory.eINSTANCE.createInternetApplication();
  // custom code starts here
  Page page = VisualFactory.eINSTANCE.createPage();
  page.setName("Home");
  app.getChildren().add(page);
  return app;
}[/code]

You don't have to wrap this logic up within any TransactionalEditingDomains, so you can use [[EMF]] directly. This can also be implemented <a href="http://code.google.com/p/iaml/source/browse/trunk/org.openiaml.model/templates/aspects/xpt/editor/DiagramEditorUtil.xpt?spec=svn928&r=928">as a dynamic template</a>.

[[Category:GMF]]
[[Category:Code Samples]]