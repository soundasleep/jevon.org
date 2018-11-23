---
layout: page
title:  "java.lang.LinkageError in a JUnit Plug-in Test Case with a redeployed Eclipse application"
author: jevon
date:   2009-09-10 09:31:04 +1200
tags:   [Eclipse]
---

[Eclipse](eclipse.md)

I was getting the following error while trying to run a JUnit plug-in test case:

**java.lang.LinkageError: loader constraint violation: loader (instance of org/eclipse/osgi/internal/baseadaptor/DefaultClassLoader) previously initiated loading for a different type with name XXX**

My test case was written in a runtime Eclipse application using a plugin I had created, which had dependencies from JAR files in the /lib folder.

The solution was to go to the development environment for the Eclipse plugin that I was using (org.openiaml.model.tests in my case), going into the MANIFEST.MF editor, and following through the "Organise Manifests Wizard".

This added a whole bunch of "Export-Package" entries to the MANIFEST.MF, which appeared to be a list of all the packages that the plugin itself would require to run.

I guess I now have to do this to all of my plugins...

(A little bit of inspiration from http://forum.springsource.org/showthread.php?t=64480.)

It may also help to follow the discussion at http://stackoverflow.com/questions/333201/runtime-issues-during-developing-an-eclipse-plugin, in particular the third party deployment guidelines at http://ekkescorner.wordpress.com/2008/09/10/pde-and-3rdparty-bundles-in-osgi-enterprise-apps/
