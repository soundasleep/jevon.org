---
layout: page
title:  Migrating Dynamic Templates to GMF 2.2
author: jevon
date:   2009-08-09 12:57:03 +12:00
tags:
  - GMF
  - QVT
redirect_from:
  - "/wiki/migrating_dynamic_templates_to_gmf_2"
  - "/wiki/Migrating Dynamic Templates To Gmf 2"
  - "/wiki/migrating dynamic templates to gmf 2"
  - "/wiki/Migrating_Dynamic_Templates_To_Gmf_2"
---

[GMF](GMF.md) provides [Dynamic Templates](Dynamic_Templates.md) - see [Enabling Dynamic Templates in GMF](enabling-dynamic-templates-in-GMF.md).

Here is a non-exhaustive list of common changes required when migrating GMF 2.0.1 models to GMF 2.2 (as I did). Many of the changes are minor syntax changes, but some of the changes are rewrites of the modelling code behind GMF, so good luck with those ;)

```
[Original]                 [Change]
editorGen.getElements() -> editorGen.getAllTypedElements()
!=                      -> <>
this                    -> self.repr()
==                      -> =
&&                      -> and
||                      -> or
list.size()             -> list->size()
obj().value == CONST.value -> obj() = CONST

«EXPAND xpt::Common::metaClassAccessor FOR elementType.getMetaClass()»
                        -> getElementType("«elementType.uniqueIdentifier»")

«diagram.editCommandsPackageName».«elementType.getMetaClass().ecoreClass.name»CreateCommand
                        -> «diagram.editCommandsPackageName».«node.createCommandClassName»

«getQualifiedInterfaceName(containmentMetaFeature.genClass)»
                        -> «EXPAND MetaModel::QualifiedClassName FOR containmentMetaFeature.genClass»
```
