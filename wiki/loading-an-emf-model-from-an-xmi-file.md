---
layout: page
title:  "Loading an EMF model from an XMI file"
author: jevon
date:   2008-10-16 11:57:18 +1300
---

[[GMF Code Samples]] / [[GMF]] / [[EMF]]

To load an [[EMF]] model from an [[XMI]] file (also useful for [[GMF]]):

[code]XMIResourceImpl resource = new XMIResourceImpl();
File source = new File("src/org/openiaml/model/take/tests/test.iaml");
resource.load( new FileInputStream(source), new HashMap<Object,Object>());
root = (InternetApplication) resource.getContents().get(0);[/code]

Note that you will have to run this in a plugin environment; for example, since this is part of a [[JUnit]] test case, I need to run the JUnit test case as a plug-in test in [[Eclipse]]. This allows [[EMF]] to load the package definitions, or else I may get a '''PackageNotFoundException'''.

This code sample is also <a href="http://code.google.com/p/iaml/source/browse/branches/2008-10-take/org.openiaml.model.diagram.custom/src/org/openiaml/model/take/tests/MyTestCase.java?spec=svn144&r=144#25">available on SVN</a>.

[[Category:GMF]]
[[Category:EMF]]
[[Category:Code Samples]]
