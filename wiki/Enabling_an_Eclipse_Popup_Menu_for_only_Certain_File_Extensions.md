---
layout: page
title:  Enabling an Eclipse Popup Menu for only Certain File Extensions
author: jevon
date:   2008-11-07 04:33:22 +13:00
tags:
  - Eclipse
  - Java
  - Technology
redirect_from:
  - "/wiki/Enabling an Eclipse Popup Menu for only Certain File Extensions"
---

[Eclipse](Eclipse.md)

If you are providing a right click menu for Eclipse like so:

```
<extension point="org.eclipse.ui.popupMenus">
  <objectContribution
    adaptable="false"
    id="org.openiaml.model.codegen.objectContribution1"
    objectClass="org.eclipse.core.resources.IResource">
  ...
</extension>
```

It is easy to only enable this for particular file extensions (e.g. "***.iaml**") with a wildcarded name filter:

```
<extension point="org.eclipse.ui.popupMenus">
  <objectContribution
    adaptable="false"
    id="org.openiaml.model.codegen.objectContribution1"
    nameFilter="*.iaml"
    objectClass="org.eclipse.core.resources.IResource">
  ...
</extension>
```
