---
layout: page
title:  GMF Troubleshooting 10
author: jevon
date:   2011-07-21 10:59:30 +12:00
tags:
  - GMF
  - Technology
  - Code Snippets
redirect_from:
  - "/wiki/gmf_troubleshooting_10"
  - "/wiki/Gmf Troubleshooting 10"
  - "/wiki/gmf troubleshooting 10"
  - "/wiki/Gmf_Troubleshooting_10"
---

[GMF](GMF.md)

{% include gmf-troubleshooting.md %}

**When I select a model element, the Properties view is empty and has no properties for me to edit.**

This can occur if your `edit` plugin does not specify an `org.eclipse.emf.edit.itemProviderAdapterFactories` extension point for the package that the model element is within. 

For example, <a href="http://code.google.com/p/iaml/source/detail?r=3024">this change</a> was necessary to allow elements within the `messaging` subpackage of my [Ecore](Ecore.md) metamodel to be edited through the properties view. The diagram editors don't need to be regenerated, because it is [EMF](EMF.md)-side functionality.

Also see <a href="http://code.google.com/p/iaml/issues/detail?id=272">issue 272</a> in [IAML](IAML.md).
