---
layout: page
title:  "Improving the performance of OAW"
author: jevon
date:   2010-02-03 15:35:25 +1300
tags:   [OAW, Performance, Code Snippets]
---

[openArchitectureWare](openarchitectureware.md)

## First
Make sure you follow the golden rule of performance optimisation; <a href="http://journals.jevon.org/users/jevon-phd/entry/19796">find out what needs optimising</a>, rather than guessing wildly in the dark.

## Using an in-memory model
If in your workflow, you are exporting a model to a file, and then re-loading that model using the **org.eclipse.mwe.emf.Reader** component, you can be spending a lot of time on this unnecessary serialisation process.

Inspired by <a href="http://www.openarchitectureware.org/article.php/How_to_use_oAW_with_a_JavaBeans_based_MM">this discussion</a>, you can create a new component <a href="http://code.google.com/p/iaml/source/browse/trunk/org.openiaml.model.codegen.php/src/workflow/runtime-memory.oaw?spec=svn1435&r=1435">in your workflow</a> which will load a model from memory:

```
<component class="org.openiaml.model.codegen.php.CurrentModel">
  <modelSlot value="model" />
</component>
```

This allows you to <a href="http://code.google.com/p/iaml/source/browse/trunk/org.openiaml.model.codegen.php/src/org/openiaml/model/codegen/php/CurrentModel.java?spec=svn1435&r=1435">create your own workflow component</a>, _CurrentModel_, which can keep a reference to the model.

This can then be <a href="http://code.google.com/p/iaml/source/browse/trunk/org.openiaml.model.codegen.php/src/org/openiaml/model/codegen/php/OawCodeGenerator.java?spec=svn1435&r=1435#327">instantiated in your workflow</a>:

```
CurrentModel.setCurrentModel(model);
// execute workflow
CurrentModel.setCurrentModel(null);
```

This can save up to 20% of your execution time in some cases.
