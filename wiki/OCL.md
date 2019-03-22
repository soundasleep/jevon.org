---
layout: page
title:  OCL
author: jevon
date:   2011-05-17 14:06:18 +12:00
tags:
  - OCL
  - GMF
  - Technology
---

[OCL](OCL.md) stands for the Object Constraint Language. It is useful in [MOF](mof.md) as a platform-independent way of specify operations and constraints. [GMF](GMF.md) can use OCL somewhat: [GMF Troubleshooting 3](GMF_Troubleshooting_3.md). Also see: [EMF Validation Framework](EMF_Validation_Framework.md)

1. <a href="http://www.eoinwoods.info/doc/ocl_quick_reference.pdf">A good OCL reference</a>
1. [OCL Pygments Lexer](OCL_Pygments_Lexer.md)

## Sample OCL
```
self.parameter->operation(param)
self.child->isTypeOf(TypeName)
self <> self.child
self.one and self.two
not(self.name = '')
```

For OCL strings, they must be in single quotes. Double quotes (") and backticks (`) do not work.

## Sample OCL in .gmfmap
`self.oclIsTypeOf(TypeName)`

## Using packages in OCL
I had an object, _UserStore_, which was in a separate package to the root. I was trying to use the following OCL constraint in my [GMF](GMF.md) .gmfmap:

`self.oclIsTypeOf( DomainStore ) and not self.oclIsTypeOf( UserStore )`

However, I was getting the following validation error:

**Invalid expression body '...'. Cause: Unrecognized variable: (UserStore)**

The problem is because the new type is in a separate package. The solution is to use the **::** operator as a package separator, i.e.:

`self.oclIsTypeOf( DomainStore ) and not self.oclIsTypeOf( users::UserStore )`

## eContainer in GMF OCL
[GMF](GMF.md) cannot support OCL with _eContainer_ etc, until <a href="https://bugs.eclipse.org/bugs/show_bug.cgi?id=256461">bug 256461</a> has been resolved. See: [Having Multiple Containments of the Same Domain Element in GMF](Having_Multiple_Containments_of_the_Same_Domain_Element_in_GMF.md)
