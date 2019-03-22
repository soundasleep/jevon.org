---
layout: page
title:  Eclipse Popup Menu Subtrees
author: jevon
date:   2009-08-07 17:09:26 +12:00
tags:
  - Eclipse
  - Code Samples
redirect_from:
  - "/wiki/Eclipse Popup Menu Subtrees"
---

[Eclipse](Eclipse.md)

If you want popup menu items to appear in the top-level of the menu, just use the ID of the menu contribution itself:

```
<extension point="org.eclipse.ui.popupMenus">
  <objectContribution
      adaptable="false"
      id="org.openiaml.model.codegen.objectContribution1"
      nameFilter="*.iaml"
      objectClass="org.eclipse.core.resources.IResource">

    <menu
        id="org.openiaml.model.diagram.custom.menu1"
        path="additions"
        label="&amp;IAML Tools">
    </menu>

    <action
        class="org.openiaml.model.diagram.custom.actions.InferEntireModelAction"
        id="org.openiaml.model.diagram.custom.action4"
        label="Infer all elements in-place"
        menubarPath="org.openiaml.model.diagram.custom.menu1">
    </action>
  </objectContribution>
</extension>
```

If however, you want menu items to appear as a sub-tree of your menu, create a "separator" and use the _menuPath_ attribute as in "ID/group":

```
...

    <menu
        id="org.openiaml.model.diagram.custom.menu1"
        path="additions"
        label="&amp;IAML Tools">
      <separator name="group1" /> <!-- changed -->
    </menu>

    <action
        class="org.openiaml.model.diagram.custom.actions.InferEntireModelAction"
        id="org.openiaml.model.diagram.custom.action4"
        label="Infer all elements in-place"
        menubarPath="org.openiaml.model.diagram.custom.menu1/group1"> <!-- changed -->
    </action>
```
