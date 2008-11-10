---
layout: page
title:  "Unit testing of GMF diagram editors and shortcuts with JUnit"
author: jevon
date:   2008-11-11 12:10:12 +1300
---

[[GMF]] / [[GMF Code Samples]]

A bit of background: My [[GMF]] diagramming plugin allows for elements to be provided as shortcuts in the model. I have extended the plugin to allow for automatically adding new shortcuts to the diagram editors, if they are connections of edges in the model.

I wanted a way to test the following things with [[JUnit]]:

# Diagram files can be loaded
# Model files can be initialised by going Right Click > ''Initialise new my_diagram''
# The visual display of the diagram files (which nodes are displayed, etc)
# Model files with [[GMF Diagram Partitioning|diagram partitioning]] can be opened and traversed
# Shortcut elements are displayed as shortcuts
# My custom shortcut-generation functionality

I can't go into a tutorial for each of these individual elements, but I can provide the code that I used to implement all of these (they are all grouped together into a <a href="http://code.google.com/p/iaml/source/browse/?r=330#svn/trunk/org.openiaml.model.tests/src/org/openiaml/model/tests/eclipse">JUnit Test Suite for Eclipse</a>):

# <a href="http://code.google.com/p/iaml/source/browse/trunk/org.openiaml.model.tests/src/org/openiaml/model/tests/eclipse/LoadDiagramTestCase.java?r=330">Diagram files can be loaded</a> (<a href="http://code.google.com/p/iaml/source/browse/trunk/org.openiaml.model.tests/src/org/openiaml/model/tests/EclipseTestCase.java?r=330#154">method</a>)
# <a href="http://code.google.com/p/iaml/source/browse/trunk/org.openiaml.model.tests/src/org/openiaml/model/tests/eclipse/InitializeDiagramTestCase.java?r=330">Model files can be initialised</a> (<a href="http://code.google.com/p/iaml/source/browse/trunk/org.openiaml.model.tests/src/org/openiaml/model/tests/EclipseTestCase.java?r=330#98">helper method</a>)
# <a href="http://code.google.com/p/iaml/source/browse/trunk/org.openiaml.model.tests/src/org/openiaml/model/tests/eclipse/LoadDiagramTestCase.java?r=330#44">The visual display of the diagram files</a>
# Model files with diagram partitioning can be <a href="http://code.google.com/p/iaml/source/browse/trunk/org.openiaml.model.tests/src/org/openiaml/model/tests/eclipse/OpenSubDiagramTestCase.java?r=330">opened</a> and <a href="http://code.google.com/p/iaml/source/browse/trunk/org.openiaml.model.tests/src/org/openiaml/model/tests/EclipseTestCase.java?r=330#69">traversed</a>
# <a href="http://code.google.com/p/iaml/source/browse/trunk/org.openiaml.model.tests/src/org/openiaml/model/tests/eclipse/shortcuts/ShortcutsRootTestCase.java?r=330">Shortcut elements are displayed as shortcuts</a> (<a href="http://code.google.com/p/iaml/source/browse/trunk/org.openiaml.model.tests/src/org/openiaml/model/tests/EclipseTestCaseHelper.java?r=330#39">method</a>)
# My custom shortcut-generation functionality (the project as a whole)

I'm not sure if this is any help to anybody, but it's probably a good reference. Perhaps in the future I can release a [[GMFUnit]] wrapper around [[JUnit]].

[[Category:GMF]]
[[Category:Technology]]
[[Category:Testing]]
[[Category:Java]]
[[Category:Code Samples]]