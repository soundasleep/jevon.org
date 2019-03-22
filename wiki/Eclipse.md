---
layout: page
title:  Eclipse
author: jevon
date:   2013-02-11 18:34:12 +13:00
tags:
  - Article
  - Technology
---

[Articles](articles.md)

[Eclipse](eclipse.md) is a great [IDE](ide.md) to develop [Java](java.md) and [Android](android.md) applications in. It is also the base for technologies like [EMF](emf.md), [JET](jet.md), [GMF](gmf.md), [OAW](oaw.md) and lots more...

Also see:
1. [Increasing Eclipse Plug-in Performance](increasing-eclipse-plug-in-performance.md)
1. [Basic Eclipse Plugin Activator Structure](basic-eclipse-plugin-activator-structure.md)
1. [Displaying an Eclipse MessageDialog in a Non-UI Thread](displaying-an-eclipse-messagedialog-in-a-non-ui-thread.md)
1. [Writing to a Console in Eclipse](writing-to-a-console-in-eclipse.md)
1. [Force an IProject file system refresh in Eclipse](force-an-iproject-file-system-refresh-in-eclipse.md)
1. [Enabling an Eclipse Popup Menu for only Certain File Extensions](enabling-an-eclipse-popup-menu-for-only-certain-file-extensions.md)
1. [Eclipse Popup Menu Subtrees](eclipse-popup-menu-subtrees.md)
1. [Getting the last error or IStatus thrown in Eclipse](getting-the-last-error-or-istatus-thrown-in-eclipse.md)
1. [Writing a String to a File in Java](writing-a-string-to-a-file-in-java.md) (really for Eclipse)
1. <a href="http://www.eclipse.org/articles/Article-Progress-Monitors/article.html">Correctly using IProgressMonitors in Eclipse</a>, and <a href="http://book.javanb.com/eclipse-rich-client-platform-designing-coding-and-packaging-java-applications-oct-2005/ch17lev1sec8.html">Reporting Progress in Eclipse (modal, non-modal, jobs)</a>
1. [NoClassDefFoundError when running JUnit Plug-in Tests with JARs](noclassdeffounderror-when-running-junit-plug-in-tests-with-jars.md)
1. [Launching failed. Bootstrap code cannot be found.](launching-failed-bootstrap-code-cannot-be-found-.md)
1. [java.lang.LinkageError in a JUnit Plug-in Test Case with a redeployed Eclipse application](java-lang-linkageerror-in-a-junit-plug-in-test-case-with-a-redeployed-eclipse-application.md)
1. <a href="http://www.mularien.com/blog/2007/12/05/quick-tip-convert-an-eclipse-general-project-to-a-java-project/">Converting an Eclipse General Project to a Java Project</a>
1. [Out of Memory Errors in Eclipse](out-of-memory-errors-in-eclipse.md)
1. [Listing all files contained in an Eclipse plugin](listing-all-files-contained-in-an-eclipse-plugin.md)
1. [No runnable methods with JUnit and Eclipse](no-runnable-methods-with-junit-and-eclipse.md)
1. [Unable to Create EcoreEditorID Editor](unable-to-create-ecoreeditorid-editor.md)
1. <a href="http://www.wdev91.com/?p=cpw">Automatically adding copyright/licence information to Eclipse projects</a>
1. <a href="http://www.vogella.de/articles/EclipsePDEBuild/article.html">Using PDE to automatically build Eclipse plugins</a>
1. [Could not open the editor: SAXParserFactoryImpl cannot be cast to SAXParserFactory](could-not-open-the-editor-saxparserfactoryimpl-cannot-be-cast-to-saxparserfactory.md)
1. [Class Not Found when running a JUnit Plugin Test](class-not-found-when-running-a-junit-plugin-test.md)
1. [No Classloader Found for Plug-in when running a JUnit Plugin Test](no-classloader-found-for-plug-in-when-running-a-junit-plugin-test.md)
1. [Only one of the following can be installed at once: Core Resource Management](only-one-of-the-following-can-be-installed-at-once-core-resource-management.md)
1. [Disabling DTD validation for Ant xmlvalidate task within Eclipse](disabling-dtd-validation-for-ant-xmlvalidate-task-within-eclipse.md)
1. <a href="http://www.ibm.com/developerworks/java/library/os-eclipse-javadebug/index.html">Debugging Java applications remotely with Eclipse</a>

## Null Argument with IWizardPage
If you get the following error while you are trying to implement **IWizardPage**/**IWizard**, using the provided abstract classes **WizardPage**/**Wizard**:

```
org.eclipse.jface.util.Assert$AssertionFailedException: null argument;
	at org.eclipse.jface.util.Assert.isNotNull(Assert.java:149)
	at org.eclipse.jface.util.Assert.isNotNull(Assert.java:125)
	at org.eclipse.jface.wizard.Wizard.createPageControls(Wizard.java:183)
	at org.eclipse.jface.wizard.WizardDialog.createPageControls(WizardDialog.java:611)
	at org.eclipse.jface.wizard.WizardDialog.createContents(WizardDialog.java:502)
	...
```

The solution is to add one line of code to your implementation of **WizardPage#createControl(Composite)**:

```
public void createControl(Composite parent) {
	Composite page = new Composite(parent);
	'''setControl(page);'''

	... rest of code ...
}
```

Note that if you use _parent_ instead of another Composite, this will give weird problems when trying to switch between different pages in the wizard (successive wizard pages will appear blank, and the back button won't work).

## Source code not found when debugging plug-in applications
Even though Eclipse usually lets you attach source code to missing source locations, sometimes it won't let you attach it to imported JAR files, for example when you're developing a plug-in project. You might get this error:

**The JAR of this class file belongs to container 'plug-in dependencies' which does not allow modifications to source attachments on its entries.**

The problem is not that it can't add the source code; I think the problem is that it expects the source code from another, different Eclipse plugin. Try going to an Update Site and installing the source code/SDK feature plugin.

In one case I couldn't get the source code even this way; my solution was to manually download the source code/SDK and extract the _plugin/org.eclipse.foo.source_1.0.101_ plugin manually into the _eclipse/plugins_ folder. Once I restarted Eclipse, it worked fine!

## Get current workspace location
`URL workspaceLocation = Platform.getInstanceLocation().getURL();` (also works for JUnit plugin tests)

## Loading an internal browser
`PlatformUI.getWorkbench().getBrowserSupport().createBrowser("myId").openURL(url);`
(<a href="http://www.eclipsezone.com/eclipse/forums/t78519.html">ref</a>)

## Displaying a message dialog box or error dialog box
```
MessageDialog.openWarning( PlatformUI.getWorkbench().getDisplay().getActiveShell() ,
   "Dialog box title", "Dialog box contents");
```

## Getting an IFile from a java.net.URI
`IFiles[] resolved = ResourcesPlugin.getWorkspace().getRoot().findFilesForLocationURI(URI);`
(There may be more than one file for a given URI: <a href="http://dev.eclipse.org/newslists/news.eclipse.platform.rcp/msg28131.html">ref</a>)

## "The import org.eclipse cannot be resolved"
Assuming that you have all the correct .project settings (e.g. the PDE PluginNature), this can happen when you switch between different Eclipses with the same workspace settings:

1. Close **all** projects in your workspace.
1. Open all projects in your workspace.
1. Go into the build menu and clean out all projects: _Project > Clean..._
1. Rebuild all projects, this problem may be resolved.
