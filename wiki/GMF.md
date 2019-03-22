---
layout: page
title:  GMF
author: jevon
date:   2011-05-11 08:09:45 +12:00
tags:
  - Technology
---

[GMF](GMF.md) is the Graphical Modelling Framework used in Eclipse; also see [EMF](EMF.md) for the framework itself.

Some key tutorials that I have found to be helpful when working out how the crazy beast called GMF works:
1. The cheat sheet in [Eclipse](Eclipse.md) itself: **Help > Cheat Sheets**
1. http://wiki.eclipse.org/index.php/GMF_Tutorial -- the basics
1. http://wiki.eclipse.org/GMF_Documentation -- especially the rest of the tutorial parts
1. http://www.eclipse.org/articles/Article-FromFrontendToCode-MDSDInPractice/article.html -- integrating GMF etc into an actual project

These might be helpful, because GMF is a little rough around the edges:
1. [Creating a new GMF Editor](Creating_a_new_GMF_Editor.md)
1. [GMF Diagram Partitioning](GMF_Diagram_Partitioning.md)
1. [GMF Drag Drop](GMF_Drag_Drop.md) (Shortcuts)
1. [GMF Static Labels](GMF_Static_Labels.md)
1. [Enabling Dynamic Templates in GMF](Enabling_Dynamic_Templates_in_GMF.md)
1. [Migrating Dynamic Templates to GMF 2.2](Migrating_Dynamic_Templates_to_GMF_2.2.md)
1. [Having Multiple Containments of the Same Domain Element in GMF](Having_Multiple_Containments_of_the_Same_Domain_Element_in_GMF.md)
1. [GMF Code Samples](GMF_Code_Samples.md) (lots in here)
1. [GMF Refactoring](GMF_Refactoring.md)
1. [Using EOpposite in GMF](Using_EOpposite_in_GMF.md)
1. [Ecore](Ecore.md)
1. [GMFGraph](GMFGraph.md)
1. [Using Platform Resources as EReferences in GMF](Using_Platform_Resources_as_EReferences_in_GMF.md)
1. [GMF Custom Figures](GMF_Custom_Figures.md)

Troubleshooting:
{% include gmf-troubleshooting.md %}

Advanced tutorials:
1. <a href="http://dev.eclipse.org/newslists/news.eclipse.modeling.gmf/msg02849.html">How to have both a visual outline view and a tree outline view simultaneously</a>
1. <a href="http://dev.eclipse.org/newslists/news.eclipse.modeling.gmf/msg00341.html">How to have icons in the outline view</a>
1. <a href="http://dev.eclipse.org/newslists/news.eclipse.modeling.gmf/msg15217.html">Hiding unnecessary properties</a>
1. <a href="http://dev.eclipse.org/newslists/news.eclipse.modeling.gmf/msg12453.html">Different EMF model versions in GMF editors</a>
1. <a href="http://dev.eclipse.org/newslists/news.eclipse.tools.emf/msg19591.html">EMF model documentation: using &lt;!-- begin-model-doc --&gt;</a>
1. <a href="http://dev.eclipse.org/newslists/news.eclipse.modeling.gmf/msg15911.html">Representing a node with a JPEG image</a>
1. <a href="http://www.eclipse.org/forums/index.php/m/669505/">Loading .ecore Resources through Browse Registered Packages</a>

Advanced references:
1. <a href="http://publib-b.boulder.ibm.com/Redbooks.nsf/RedbookAbstracts/sg246302.html">Eclipse Development with GEF and EMF</a> (256 page PDF)
1. <a href="http://wiki.eclipse.org/GMF_Labels">GMF Labels</a>

## Adding the GMF source files to your source path
The easiest way to do this is to go to the software update manager thing, and download the GMF SDK -- similar to the method used to install EMF/GMF in the first place.

## Cannot insert new nodes into an EMF editor
If you cannot right click and add children to a wizard-generated model in your EMF-generated plugin workspace, ensure that the properties "children", "create child" and "notify" in the .genmodel are set to true. (This may be because "Containment" isn't set to true in the underlying .ecore model: See [GMF Troubleshooting](gmf-troubleshooting.md).)

## DanglingHREFException
If when creating a new model, trying to add a child to a node, you get a DanglingHREFException, make sure that in the .ecore model, the particular EReference has the "containment" property set to true. (<a href="http://dev.eclipse.org/newslists/news.eclipse.tools.emf/msg18498.html">ref</a>)

This has the effect of setting a reference from merely an association into an aggregation.

You can set this property in annotated Java by adding
`@model containment="true"`
(<a href="http://www.persiflage-n-piffle.com/blog/2007/04/emf-containment-behaviour/">ref</a>)

## Top level node 'Containment Feature' must be available in the diagram 'Domain Element' or its super-class
I think this means that you are trying to make GMF create an editor for a model element that can't actually be displayed in the current editor. e.g. You are trying to make a model, based in Map, which displays both Topic and TopicConcept, but you cannot currently create TopicConcept in the Map object. Or something... I haven't quite worked this one out yet :)

## The object 'SomethingImpl' (text: content) is not contained in a resource
This error occurs in the [Eclipse](Eclipse.md) workspace when you try to save a model which has an invalid structure -- commonly when it refered to an old .ecore metamodel. The solution to this is to edit the model with a text editor and remove the invalid model elements.

## Some random helpful images
<img src="/img/emf-graphical-definition.png">
