---
layout: page
title:  "Putting Generated GMF Diagram Editors into a New Category"
author: jevon
date:   2010-04-28 15:04:16 +1200
---

[[GMF]]

{{gmf-css}}<img src="/img/gmf/newwizard.png" class="gmf">By default, when you generate diagram editors for a [[GMF]] application, the "Create New Diagram" option is tucked away in the "Examples" section (as to the right).

If you <a href="http://code.google.com/p/iaml/issues/detail?id=110">have the requirement</a> to put it into a new section, first you need to define a separate ''New Wizards'' category, through the <a href="http://help.eclipse.org/help33/topic/org.eclipse.platform.doc.isv/reference/extension-points/org_eclipse_ui_newWizards.html">org.eclipse.ui.newWizards extension point</a>, in <a href="http://code.google.com/p/iaml/source/browse/trunk/org.openiaml.model.actions/plugin.xml?spec=svn2060&r=2060#118">another '''plugin.xml'''</a>:

[code]<extension point="org.eclipse.ui.newWizards">
  <category
    id="org.my.new.wizard.id"
    name="Category Title">
  </category>
</extension>
[/code]

You can then take this category ID (''org.my.new.wizard.id'') and put it in ''Gen Editor Generator'' > ''Gen Diagram'' > ''(Editor)'' > ''Creation Wizard Category ID'', which defaults to '''org.eclipse.ui.Examples'''.

[[Category:GMF]]
[[Category:Code Snippets]]