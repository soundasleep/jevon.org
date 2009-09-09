---
layout: page
title:  "GMF Troubleshooting 8"
author: jevon
date:   2009-09-10 10:02:46 +1200
---

[[GMF]]

{{gmf-troubleshooting}}

'''When generating with [[GMF Dynamic Templates]], I get one of the following errors:'''

[code]aspects::impl::diagram::editparts::NodeEditPart:org.eclipse.gmf.internal.xpand.util.ParserException (stack trace not available)
aspects::xpt::diagram::editpolicies::...:org.eclipse.gmf.internal.xpand.util.ParserException
org.eclipse.gmf.internal.xpand.util.ParserException[/code]

This error occured when I was using ''generatedMemberComment'' like so:

[code]«EXPAND xpt::Common::generatedMemberComment("Jevon's modification: we extend createNodeShape to use our extended class.")»[/code]

For some reason, the string cannot contain a single apostrophe '. So changing it to this solved this problem completely:
[code]«EXPAND xpt::Common::generatedMemberComment("Jevon modification: we extend createNodeShape to use our extended class.")»[/code]

o_O

---
'''When generating with [[GMF Dynamic Templates]], I get one of the following exceptions:'''

[code]org.eclipse.gmf.internal.xpand.model.EvaluationException: org.eclipse.gmf.internal.xpand.util.ParserException, @... "oclExpressionCS"is invalid(...)
org.eclipse.gmf.internal.xpand.model.EvaluationException: org.eclipse.gmf.internal.xpand.util.ParserException, @... "multiplicativeExpCS"is invalid(...)[/code]

I got this error when upgrading my dynamic templates from GMF 2.0.1 to GMF 2.2. The problem appeared to be with this line:

[code]«ERROR "Unsupported model facet: " + this»[/code]

Removing ''''this'''' from the statement resolved the exception. It's not the '+' operator, but the ''''this'''' keyword. You can also replace the ''''this'''' keyword with ''''self.repr()''''.

---
'''I have a lot of tools in my palette, and some are in tool groups, but no scroll bar is being rendered.'''

"It isn't well documented but nesting drawers/toolgroups isn't recommended. When I moved all my drawers to the root of the palette my scrollbar problems went away." - http://dev.eclipse.org/newslists/news.eclipse.modeling.gmf/msg11444.html

---
'''My diagram editor is rendering elements that are not contained within the current diagram'''

This can occur if you have a model element with a phantom node reference, i.e. in the gmfmap, it's containment element is set to null. When this happens, a ''getPhantomNodesIterator(Resource)'' will be called, which by default returns Resource.getAllContents() [i.e. all elements within the current model!]

One solution is to give the phantom node an incorrect reference.

[[Category:GMF]]
[[Category:Technology]]
[[Category:Code Snippets]]