---
layout: page
title:  "Eclipse"
author: jevon
date:   2012-11-28 16:26:04 +1300
---

[[Articles]]

[[Eclipse]] is a great [[IDE]] to develop [[Java]] and [[Android]] applications in. It is also the base for technologies like [[EMF]], [[JET]], [[GMF]], [[OAW]] and lots more...

Also see:
# [[Increasing Eclipse Plug-in Performance]]
# [[Basic Eclipse Plugin Activator Structure]]
# [[Displaying an Eclipse MessageDialog in a Non-UI Thread]]
# [[Writing to a Console in Eclipse]]
# [[Force an IProject file system refresh in Eclipse]]
# [[Enabling an Eclipse Popup Menu for only Certain File Extensions]]
# [[Eclipse Popup Menu Subtrees]]
# [[Getting the last error or IStatus thrown in Eclipse]]
# [[Writing a String to a File in Java]] (really for Eclipse)
# <a href="http://www.eclipse.org/articles/Article-Progress-Monitors/article.html">Correctly using IProgressMonitors in Eclipse</a>, and <a href="http://book.javanb.com/eclipse-rich-client-platform-designing-coding-and-packaging-java-applications-oct-2005/ch17lev1sec8.html">Reporting Progress in Eclipse (modal, non-modal, jobs)</a>
# [[NoClassDefFoundError when running JUnit Plug-in Tests with JARs]]
# [[Launching failed. Bootstrap code cannot be found.]]
# [[java.lang.LinkageError in a JUnit Plug-in Test Case with a redeployed Eclipse application]]
# <a href="http://www.mularien.com/blog/2007/12/05/quick-tip-convert-an-eclipse-general-project-to-a-java-project/">Converting an Eclipse General Project to a Java Project</a>
# [[Out of Memory Errors in Eclipse]]
# [[Listing all files contained in an Eclipse plugin]]
# [[No runnable methods with JUnit and Eclipse]]
# [[Unable to Create EcoreEditorID Editor]]
# <a href="http://www.wdev91.com/?p=cpw">Automatically adding copyright/licence information to Eclipse projects</a>
# <a href="http://www.vogella.de/articles/EclipsePDEBuild/article.html">Using PDE to automatically build Eclipse plugins</a>
# [[Could not open the editor: SAXParserFactoryImpl cannot be cast to SAXParserFactory]]
# [[Class Not Found when running a JUnit Plugin Test]]
# [[No Classloader Found for Plug-in when running a JUnit Plugin Test]]
# [[Only one of the following can be installed at once: Core Resource Management]]
# [[Disabling DTD validation for Ant xmlvalidate task within Eclipse]]

==Null Argument with IWizardPage==
If you get the following error while you are trying to implement '''IWizardPage'''/'''IWizard''', using the provided abstract classes '''WizardPage'''/'''Wizard''':

[code]org.eclipse.jface.util.Assert$AssertionFailedException: null argument;
	at org.eclipse.jface.util.Assert.isNotNull(Assert.java:149)
	at org.eclipse.jface.util.Assert.isNotNull(Assert.java:125)
	at org.eclipse.jface.wizard.Wizard.createPageControls(Wizard.java:183)
	at org.eclipse.jface.wizard.WizardDialog.createPageControls(WizardDialog.java:611)
	at org.eclipse.jface.wizard.WizardDialog.createContents(WizardDialog.java:502)
	...[/code]

The solution is to add one line of code to your implementation of '''WizardPage#createControl(Composite)''':

[code]public void createControl(Composite parent) {
	Composite page = new Composite(parent);
	'''setControl(page);'''

	... rest of code ...
}[/code]

Note that if you use ''parent'' instead of another Composite, this will give weird problems when trying to switch between different pages in the wizard (successive wizard pages will appear blank, and the back button won't work).

==Source code not found when debugging plug-in applications==
Even though Eclipse usually lets you attach source code to missing source locations, sometimes it won't let you attach it to imported JAR files, for example when you're developing a plug-in project. You might get this error:

'''The JAR of this class file belongs to container 'plug-in dependencies' which does not allow modifications to source attachments on its entries.'''

The problem is not that it can't add the source code; I think the problem is that it expects the source code from another, different Eclipse plugin. Try going to an Update Site and installing the source code/SDK feature plugin.

In one case I couldn't get the source code even this way; my solution was to manually download the source code/SDK and extract the ''plugin/org.eclipse.foo.source_1.0.101'' plugin manually into the ''eclipse/plugins'' folder. Once I restarted Eclipse, it worked fine!

==Get current workspace location==
[code]URL workspaceLocation = Platform.getInstanceLocation().getURL();[/code] (also works for JUnit plugin tests)

==Loading an internal browser==
[code]PlatformUI.getWorkbench().getBrowserSupport().createBrowser("myId").openURL(url);[/code]
(<a href="http://www.eclipsezone.com/eclipse/forums/t78519.html">ref</a>)

==Displaying a message dialog box or error dialog box==
[code]MessageDialog.openWarning( PlatformUI.getWorkbench().getDisplay().getActiveShell() ,
   "Dialog box title", "Dialog box contents");[/code]

==Getting an IFile from a java.net.URI==
[code]IFiles[] resolved = ResourcesPlugin.getWorkspace().getRoot().findFilesForLocationURI(URI);[/code]
(There may be more than one file for a given URI: <a href="http://dev.eclipse.org/newslists/news.eclipse.platform.rcp/msg28131.html">ref</a>)

=="The import org.eclipse cannot be resolved"==
Assuming that you have all the correct .project settings (e.g. the PDE PluginNature), this can happen when you switch between different Eclipses with the same workspace settings:

# Close '''all''' projects in your workspace.
# Open all projects in your workspace.
# Go into the build menu and clean out all projects: ''Project > Clean...''
# Rebuild all projects, this problem may be resolved.

[[Category:Article]]
[[Category:Technology]]