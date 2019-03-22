---
layout: page
title:  "Unit testing of GMF diagram editors and shortcuts with JUnit"
author: jevon
date:   2008-11-11 12:10:12 +1300
tags:   [GMF, Technology, Testing, Java, Code Samples]
---

[GMF](GMF.md) / [GMF Code Samples](GMF_Code_Samples.md)

A bit of background: My [GMF](GMF.md) diagramming plugin allows for elements to be provided as shortcuts in the model. I have extended the plugin to allow for automatically adding new shortcuts to the diagram editors, if they are connections of edges in the model.

I wanted a way to test the following things with [JUnit](junit.md):

1. Diagram files can be loaded
1. Model files can be initialised by going Right Click > _Initialise new my_diagram_
1. The visual display of the diagram files (which nodes are displayed, etc)
1. Model files with [diagram partitioning](GMF_Diagram_Partitioning.md) can be opened and traversed
1. Shortcut elements are displayed as shortcuts
1. My custom shortcut-generation functionality

I can't go into a tutorial for each of these individual elements, but I can provide the code that I used to implement all of these (they are all grouped together into a <a href="http://code.google.com/p/iaml/source/browse/?r=330#svn/trunk/org.openiaml.model.tests/src/org/openiaml/model/tests/eclipse">JUnit Test Suite for Eclipse</a>):

1. <a href="http://code.google.com/p/iaml/source/browse/trunk/org.openiaml.model.tests/src/org/openiaml/model/tests/eclipse/LoadDiagramTestCase.java?r=330">Diagram files can be loaded</a> (<a href="http://code.google.com/p/iaml/source/browse/trunk/org.openiaml.model.tests/src/org/openiaml/model/tests/EclipseTestCase.java?r=330#154">method</a>)
1. <a href="http://code.google.com/p/iaml/source/browse/trunk/org.openiaml.model.tests/src/org/openiaml/model/tests/eclipse/InitializeDiagramTestCase.java?r=330">Model files can be initialised</a> (<a href="http://code.google.com/p/iaml/source/browse/trunk/org.openiaml.model.tests/src/org/openiaml/model/tests/EclipseTestCase.java?r=330#98">helper method</a>)
1. <a href="http://code.google.com/p/iaml/source/browse/trunk/org.openiaml.model.tests/src/org/openiaml/model/tests/eclipse/LoadDiagramTestCase.java?r=330#44">The visual display of the diagram files</a>
1. Model files with diagram partitioning can be <a href="http://code.google.com/p/iaml/source/browse/trunk/org.openiaml.model.tests/src/org/openiaml/model/tests/eclipse/OpenSubDiagramTestCase.java?r=330">opened</a> and <a href="http://code.google.com/p/iaml/source/browse/trunk/org.openiaml.model.tests/src/org/openiaml/model/tests/EclipseTestCase.java?r=330#69">traversed</a>
1. <a href="http://code.google.com/p/iaml/source/browse/trunk/org.openiaml.model.tests/src/org/openiaml/model/tests/eclipse/shortcuts/ShortcutsRootTestCase.java?r=330">Shortcut elements are displayed as shortcuts</a> (<a href="http://code.google.com/p/iaml/source/browse/trunk/org.openiaml.model.tests/src/org/openiaml/model/tests/EclipseTestCaseHelper.java?r=330#39">method</a>)
1. My custom shortcut-generation functionality (the project as a whole)

I'm not sure if this is any help to anybody, but it's probably a good reference. Perhaps in the future I can release a [GMFUnit](gmfunit.md) wrapper around [JUnit](junit.md).
