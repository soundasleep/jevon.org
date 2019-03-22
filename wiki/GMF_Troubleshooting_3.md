---
layout: page
title:  GMF Troubleshooting 3
author: jevon
date:   2008-09-23 11:37:28 +12:00
tags:
  - Todo
  - GMF
  - Technology
redirect_from:
  - "/wiki/gmf_troubleshooting_3"
  - "/wiki/Gmf Troubleshooting 3"
  - "/wiki/gmf troubleshooting 3"
  - "/wiki/Gmf_Troubleshooting_3"
---

**When trying to generate my .gmfmap, my concrete nodes that subclass abstract supertypes which are contained in the root object are not displayed in the .gmfmap wizard!**

This can happen when, for example, you want:

```
- Root
  - children: Element
- abstract Element
- Page <- Element
- Form <- Element
```

In this case, in the .gmfmap editor where you select the nodes and links to generate, you may only see the option for the Page node and not for the Form node.

This is (somewhat) natural, because the wizard only knows how to generate the code for one of these element containers. You will need to edit the .gmfmap manually and add the new element by yourself, with an [OCL](OCL.md) constraint.

See http://wiki.eclipse.org/GMF_Tutorial_Part_2#Link_Constraints for adding constraints to the .gmfmap model.
