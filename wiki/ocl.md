---
layout: page
title:  "OCL"
author: jevon
date:   2011-05-17 14:06:18 +1200
---

[[OCL]] stands for the Object Constraint Language. It is useful in [[MOF]] as a platform-independent way of specify operations and constraints. [[GMF]] can use OCL somewhat: [[GMF Troubleshooting 3]]. Also see: [[EMF Validation Framework]]

# <a href="http://www.eoinwoods.info/doc/ocl_quick_reference.pdf">A good OCL reference</a>
# [[OCL Pygments Lexer]]

==Sample OCL==
[code]self.parameter->operation(param)
self.child->isTypeOf(TypeName)
self <> self.child
self.one and self.two
not(self.name = '')[/code]

For OCL strings, they must be in single quotes. Double quotes (") and backticks (`) do not work.

==Sample OCL in .gmfmap==
[code]self.oclIsTypeOf(TypeName)[/code]

==Using packages in OCL==
I had an object, ''UserStore'', which was in a separate package to the root. I was trying to use the following OCL constraint in my [[GMF]] .gmfmap:

[code]self.oclIsTypeOf( DomainStore ) and not self.oclIsTypeOf( UserStore )[/code]

However, I was getting the following validation error:

'''Invalid expression body '...'. Cause: Unrecognized variable: (UserStore)'''

The problem is because the new type is in a separate package. The solution is to use the '''::''' operator as a package separator, i.e.:

[code]self.oclIsTypeOf( DomainStore ) and not self.oclIsTypeOf( users::UserStore )[/code]

==eContainer in GMF OCL==
[[GMF]] cannot support OCL with ''eContainer'' etc, until <a href="https://bugs.eclipse.org/bugs/show_bug.cgi?id=256461">bug 256461</a> has been resolved. See: [[Having Multiple Containments of the Same Domain Element in GMF]]

[[Category:OCL]]
[[Category:GMF]]
[[Category:Technology]]