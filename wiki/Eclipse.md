---
layout: page
title:  Eclipse
author: jevon
date:   2013-02-11 18:34:12 +13:00
tags:
  - Article
  - Technology
redirect_from:
  - "/wiki/Launching failed. Bootstrap code cannot be found."
  - "/wiki/Launching_failed._Bootstrap_code_cannot_be_found."
---

[Articles](Articles.md)

[Eclipse](Eclipse.md) is a great [IDE](ide.md) to develop [Java](Java.md) and [Android](Android.md) applications in. It is also the base for technologies like [EMF](EMF.md), [JET](JET.md), [GMF](GMF.md), [OAW](OAW.md) and lots more...

Also see:
1. [Increasing Eclipse Plug-in Performance](Increasing_Eclipse_Plug-in_Performance.md)
1. [Basic Eclipse Plugin Activator Structure](basic-eclipse-plugin-activator-structure.md)
1. [Displaying an Eclipse MessageDialog in a Non-UI Thread](Displaying_an_Eclipse_MessageDialog_in_a_Non-UI_Thread.md)
1. [Writing to a Console in Eclipse](Writing_to_a_Console_in_Eclipse.md)
1. [Force an IProject file system refresh in Eclipse](Force_an_IProject_file_system_refresh_in_Eclipse.md)
1. [Enabling an Eclipse Popup Menu for only Certain File Extensions](Enabling_an_Eclipse_Popup_Menu_for_only_Certain_File_Extensions.md)
1. [Eclipse Popup Menu Subtrees](Eclipse_Popup_Menu_Subtrees.md)
1. [Getting the last error or IStatus thrown in Eclipse](Getting_the_last_error_or_IStatus_thrown_in_Eclipse.md)
1. [Writing a String to a File in Java](Writing_a_String_to_a_File_in_Java.md) (really for Eclipse)
1. <a href="http://www.eclipse.org/articles/Article-Progress-Monitors/article.html">Correctly using IProgressMonitors in Eclipse</a>, and <a href="http://book.javanb.com/eclipse-rich-client-platform-designing-coding-and-packaging-java-applications-oct-2005/ch17lev1sec8.html">Reporting Progress in Eclipse (modal, non-modal, jobs)</a>
1. [NoClassDefFoundError when running JUnit Plug-in Tests with JARs](NoClassDefFoundError_when_running_JUnit_Plug-in_Tests_with_JARs.md)
1. [java.lang.LinkageError in a JUnit Plug-in Test Case with a redeployed Eclipse application](java.lang.LinkageError_in_a_JUnit_Plug-in_Test_Case_with_a_redeployed_Eclipse_application.md)
1. <a href="http://www.mularien.com/blog/2007/12/05/quick-tip-convert-an-eclipse-general-project-to-a-java-project/">Converting an Eclipse General Project to a Java Project</a>
1. [Out of Memory Errors in Eclipse](Out_of_Memory_Errors_in_Eclipse.md)
1. [Listing all files contained in an Eclipse plugin](Listing_all_files_contained_in_an_Eclipse_plugin.md)
1. [No runnable methods with JUnit and Eclipse](No_runnable_methods_with_JUnit_and_Eclipse.md)
1. [Unable to Create EcoreEditorID Editor](Unable_to_Create_EcoreEditorID_Editor.md)
1. <a href="http://www.wdev91.com/?p=cpw">Automatically adding copyright/licence information to Eclipse projects</a>
1. <a href="http://www.vogella.de/articles/EclipsePDEBuild/article.html">Using PDE to automatically build Eclipse plugins</a>
1. [Could not open the editor: SAXParserFactoryImpl cannot be cast to SAXParserFactory](Could_not_open_the_editor__SAXParserFactoryImpl_cannot_be_cast_to_SAXParserFactory.md)
1. [Class Not Found when running a JUnit Plugin Test](Class_Not_Found_when_running_a_JUnit_Plugin_Test.md)
1. [No Classloader Found for Plug-in when running a JUnit Plugin Test](No_Classloader_Found_for_Plug-in_when_running_a_JUnit_Plugin_Test.md)
1. [Only one of the following can be installed at once: Core Resource Management](Only_one_of_the_following_can_be_installed_at_once__Core_Resource_Management.md)
1. [Disabling DTD validation for Ant xmlvalidate task within Eclipse](Disabling_DTD_validation_for_Ant_xmlvalidate_task_within_Eclipse.md)
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

## Launching failed. Bootstrap code cannot be found.

This occurs in an Eclipse environment when you haven't loaded up the correct Eclipse plugins. I'm not sure what they are, but simply selecting "org.eclipse.*" plugins works.

## My essential custom keyboard shortcuts

- `Ctrl-P` -> Open Resource (just like Sublime Text)
- `Ctrl-Alt-Shift-F` -> Format (make it less likely to trigger)
- `Ctrl-Shift-W` -> Run JUnit Test
- `Ctrl-Shift-F` -> Generate Constructor using Fields
- `Ctrl-Shift-G` -> Generate Getters and Setters
- `Ctrl-Shift-I` -> Organise imports
- `Ctrl-Shift-E` -> Show In (Package Explorer)

Also change the default modifier key for Hyperlinking to `Alt`, not `Ctrl` (I can't remember why, something about performance)
