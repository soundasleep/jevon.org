---
layout: page
title:  Drools
author: jevon
date:   2011-03-10 13:11:25 +13:00
tags:
  - Java
  - Technology
  - Rules
  - Drools
---

A [rule engine](rule-engine.md) for [Java](java.md).

1. <a href="http://www.jboss.org/community/docs/DOC-11903">Minimum runtime requirements for Drools</a>
1. [Adding the source rule to elements inserted by Drools](adding-the-source-rule-to-elements-inserted-by-drools.md)
1. [Tips and Techniques for Improving Drools Performance](tips-and-techniques-for-improving-drools-performance.md)
1. [Improving Drools Memory Performance](improving-drools-memory-performance.md)
1. [Drools Pygments Lexer](drools-pygments-lexer.md)

## Important Hints
If you use the following in a Drools rule:

`x : ObjectType( ) from other.property`

It is important to realise that _other.property_ will not be type checked; that is, **_other.property_ may be a type other than _ObjectType**_.

You should instead use this:

`x : ObjectType( object.property == this )`

## ClassNotFoundException with a ReturnValue Invoker
I was getting this exception for a fairly normal rule:
```
org.drools.RuntimeDroolsException: java.lang.ClassNotFoundException: org.openiaml.model.drools.Rule_Create_Select_Wire_between_Domain_Object_types_0ReturnValue0Invoker
  at org.drools.rule.PackageCompilationData.reload(PackageCompilationData.java:224)
  at org.drools.common.AbstractRuleBase$ReloadPackageCompilationData.execute(AbstractRuleBase.java:830)
  at org.drools.common.AbstractRuleBase.executeQueuedActions(AbstractRuleBase.java:792)
...
Caused by: java.lang.ClassNotFoundException: org.openiaml.model.drools.Rule_Create_Select_Wire_between_Domain_Object_types_0ReturnValue0Invoker
  at org.drools.rule.PackageCompilationData$PackageClassLoader.findClass(PackageCompilationData.java:374)
  at org.drools.rule.PackageCompilationData.wire(PackageCompilationData.java:255)
  at org.drools.rule.PackageCompilationData.reload(PackageCompilationData.java:220)
  ... 55 more
```

My rule was quite innocent:

```
rule "Create Select Wire between Domain Object types"
  when
    scope : Session ( )
    object: DomainObject ( eval(hasDomainAttribute(object)) )
    ...
  
  then
    ...

end
```

The problem is that you cannot have a variable named "object" passed to a function using **eval**. Not sure why, but this is the case in JBoss Drools 4.0.7.
