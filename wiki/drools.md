---
layout: page
title:  "Drools"
author: jevon
date:   2011-03-10 13:11:25 +1300
---

A [[rule engine]] for [[Java]].

# <a href="http://www.jboss.org/community/docs/DOC-11903">Minimum runtime requirements for Drools</a>
# [[Adding the source rule to elements inserted by Drools]]
# [[Tips and Techniques for Improving Drools Performance]]
# [[Improving Drools Memory Performance]]
# [[Drools Pygments Lexer]]

==Important Hints==
If you use the following in a Drools rule:

[code]x : ObjectType( ) from other.property[/code]

It is important to realise that ''other.property'' will not be type checked; that is, '''''other.property'' may be a type other than ''ObjectType'''''.

You should instead use this:

[code]x : ObjectType( object.property == this )[/code]

==ClassNotFoundException with a ReturnValue Invoker==
I was getting this exception for a fairly normal rule:
[code]org.drools.RuntimeDroolsException: java.lang.ClassNotFoundException: org.openiaml.model.drools.Rule_Create_Select_Wire_between_Domain_Object_types_0ReturnValue0Invoker
  at org.drools.rule.PackageCompilationData.reload(PackageCompilationData.java:224)
  at org.drools.common.AbstractRuleBase$ReloadPackageCompilationData.execute(AbstractRuleBase.java:830)
  at org.drools.common.AbstractRuleBase.executeQueuedActions(AbstractRuleBase.java:792)
...
Caused by: java.lang.ClassNotFoundException: org.openiaml.model.drools.Rule_Create_Select_Wire_between_Domain_Object_types_0ReturnValue0Invoker
  at org.drools.rule.PackageCompilationData$PackageClassLoader.findClass(PackageCompilationData.java:374)
  at org.drools.rule.PackageCompilationData.wire(PackageCompilationData.java:255)
  at org.drools.rule.PackageCompilationData.reload(PackageCompilationData.java:220)
  ... 55 more[/code]

My rule was quite innocent:

[code]rule "Create Select Wire between Domain Object types"
  when
    scope : Session ( )
    object: DomainObject ( eval(hasDomainAttribute(object)) )
    ...
  
  then
    ...

end[/code]

The problem is that you cannot have a variable named "object" passed to a function using '''eval'''. Not sure why, but this is the case in JBoss Drools 4.0.7.

[[Category:Java]]
[[Category:Technology]]
[[Category:Rules]]
[[Category:Drools]]