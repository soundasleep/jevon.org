---
layout: page
title:  GMF Troubleshooting 8
author: jevon
date:   2009-09-10 10:02:46 +12:00
tags:
  - GMF
  - Technology
  - Code Snippets
redirect_from:
  - "/wiki/gmf_troubleshooting_8"
  - "/wiki/Gmf Troubleshooting 8"
  - "/wiki/gmf troubleshooting 8"
  - "/wiki/Gmf_Troubleshooting_8"
---

**My diagram editor is rendering elements that are not contained within the current diagram**

This can occur if you have a model element with a phantom node reference, i.e. in the gmfmap, it's containment element is set to null. When this happens, a _getPhantomNodesIterator(Resource)_ will be called, which by default returns Resource.getAllContents() [i.e. all elements within the current model!]

One solution is to give the phantom node an incorrect reference.
