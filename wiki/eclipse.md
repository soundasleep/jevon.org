---
layout: page
title:  "Eclipse"
author: anonymous
date:   2006-11-25 22:55:39 +1300
---

[[Articles]]

[[Eclipse]] is a great [[IDE]] to develop [[Java]] applications in.

Also see:
# [[Writing to a Console in Eclipse]]

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

[[Category:Article]]
[[Category:Technology]]