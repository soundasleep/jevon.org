---
layout: page
title:  "Adding the source rule to elements inserted by Drools"
author: jevon
date:   2009-04-08 19:04:41 +1200
---

In [[Drools]], if you are inserting/updating lots of elements in the working memory, it's possible to keep track of which rules have been modifying the elements, by adding a listener to the workflow.

[code]workingMemory.addEventListener(new DefaultWorkingMemoryEventListener() {
  @Override
  public void objectInserted(ObjectInsertedEvent event) {
    if (event.getObject() instanceof GeneratedElement) {
      GeneratedElement e = (GeneratedElement) event.getObject();
      e.setGeneratedRule(event.getPropagationContext().getRuleOrigin().getName());
    }
  }
});[/code]

In this code, all ''GeneratedElement''s will have an additional parameter, called ''generatedRule'', which stores the name of the rule. There are lots of other properties you can get from a given ''Rule''. Likewise, there are additional listener methods for retracting and updating objects.

You can also see <a href="http://code.google.com/p/iaml/source/browse/trunk/org.openiaml.model.drools/src/org/openiaml/model/drools/CreateMissingElementsWithDrools.java?spec=svn575&r=575#231">this in action</a>.

[[Category:Drools]]
[[Category:Code Snippets]]