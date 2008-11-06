---
layout: page
title:  "Enabling an Eclipse Popup Menu for only Certain File Extensions"
author: jevon
date:   2008-11-07 04:33:22 +1300
---

[[Eclipse]]

If you are providing a right click menu for Eclipse like so:

[code]<extension point="org.eclipse.ui.popupMenus">
  <objectContribution
    adaptable="false"
    id="org.openiaml.model.codegen.objectContribution1"
    objectClass="org.eclipse.core.resources.IResource">
  ...
</extension>[/code]

It is easy to only enable this for particular file extensions (e.g. "'''*.iaml'''") with a wildcarded name filter:

[code]<extension point="org.eclipse.ui.popupMenus">
  <objectContribution
    adaptable="false"
    id="org.openiaml.model.codegen.objectContribution1"
    nameFilter="*.iaml"
    objectClass="org.eclipse.core.resources.IResource">
  ...
</extension>[/code]

[[Category:Eclipse]]
[[Category:Java]]
[[Category:Technology]]