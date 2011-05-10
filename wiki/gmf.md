---
layout: page
title:  "GMF"
author: jevon
date:   2011-05-11 08:09:45 +1200
---

[[GMF]] is the Graphical Modelling Framework used in Eclipse; also see [[EMF]] for the framework itself.

Some key tutorials that I have found to be helpful when working out how the crazy beast called GMF works:
# The cheat sheet in [[Eclipse]] itself: '''Help > Cheat Sheets'''
# http://wiki.eclipse.org/index.php/GMF_Tutorial -- the basics
# http://wiki.eclipse.org/GMF_Documentation -- especially the rest of the tutorial parts
# http://www.eclipse.org/articles/Article-FromFrontendToCode-MDSDInPractice/article.html -- integrating GMF etc into an actual project

These might be helpful, because GMF is a little rough around the edges:
# [[Creating a new GMF Editor]]
# [[GMF Diagram Partitioning]]
# [[GMF Drag Drop]] (Shortcuts)
# [[GMF Static Labels]]
# [[Enabling Dynamic Templates in GMF]]
# [[Migrating Dynamic Templates to GMF 2.2]]
# [[Having Multiple Containments of the Same Domain Element in GMF]]
# [[GMF Code Samples]] (lots in here)
# [[GMF Refactoring]]
# [[Using EOpposite in GMF]]
# [[Ecore]]
# [[GMFGraph]]
# [[Using Platform Resources as EReferences in GMF]]
# [[GMF Custom Figures]]

Troubleshooting:
{{gmf-troubleshooting}}

Advanced tutorials:
# <a href="http://dev.eclipse.org/newslists/news.eclipse.modeling.gmf/msg02849.html">How to have both a visual outline view and a tree outline view simultaneously</a>
# <a href="http://dev.eclipse.org/newslists/news.eclipse.modeling.gmf/msg00341.html">How to have icons in the outline view</a>
# <a href="http://dev.eclipse.org/newslists/news.eclipse.modeling.gmf/msg15217.html">Hiding unnecessary properties</a>
# <a href="http://dev.eclipse.org/newslists/news.eclipse.modeling.gmf/msg12453.html">Different EMF model versions in GMF editors</a>
# <a href="http://dev.eclipse.org/newslists/news.eclipse.tools.emf/msg19591.html">EMF model documentation: using &lt;!-- begin-model-doc --&gt;</a>
# <a href="http://dev.eclipse.org/newslists/news.eclipse.modeling.gmf/msg15911.html">Representing a node with a JPEG image</a>
# <a href="http://www.eclipse.org/forums/index.php/m/669505/">Loading .ecore Resources through Browse Registered Packages</a>

Advanced references:
# <a href="http://publib-b.boulder.ibm.com/Redbooks.nsf/RedbookAbstracts/sg246302.html">Eclipse Development with GEF and EMF</a> (256 page PDF)
# <a href="http://wiki.eclipse.org/GMF_Labels">GMF Labels</a>

==Adding the GMF source files to your source path==
The easiest way to do this is to go to the software update manager thing, and download the GMF SDK -- similar to the method used to install EMF/GMF in the first place.

==Cannot insert new nodes into an EMF editor==
If you cannot right click and add children to a wizard-generated model in your EMF-generated plugin workspace, ensure that the properties "children", "create child" and "notify" in the .genmodel are set to true. (This may be because "Containment" isn't set to true in the underlying .ecore model: See [[GMF Troubleshooting]].)

==DanglingHREFException==
If when creating a new model, trying to add a child to a node, you get a DanglingHREFException, make sure that in the .ecore model, the particular EReference has the "containment" property set to true. (<a href="http://dev.eclipse.org/newslists/news.eclipse.tools.emf/msg18498.html">ref</a>)

This has the effect of setting a reference from merely an association into an aggregation.

You can set this property in annotated Java by adding
[code]@model containment="true"[/code]
(<a href="http://www.persiflage-n-piffle.com/blog/2007/04/emf-containment-behaviour/">ref</a>)

==Top level node 'Containment Feature' must be available in the diagram 'Domain Element' or its super-class==
I think this means that you are trying to make GMF create an editor for a model element that can't actually be displayed in the current editor. e.g. You are trying to make a model, based in Map, which displays both Topic and TopicConcept, but you cannot currently create TopicConcept in the Map object. Or something... I haven't quite worked this one out yet :)

==The object 'SomethingImpl' (text: content) is not contained in a resource==
This error occurs in the [[Eclipse]] workspace when you try to save a model which has an invalid structure -- commonly when it refered to an old .ecore metamodel. The solution to this is to edit the model with a text editor and remove the invalid model elements.

==Some random helpful images==
<img src="/img/emf-graphical-definition.png">

[[Category:Technology]]