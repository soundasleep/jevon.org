---
layout: page
title:  "Android"
author: jevon
date:   2014-02-23 03:01:46 +1300
---

[[Articles]]

Also see [[Java]], [[Eclipse]], [[Galaxy S3]]

# <a href="http://developer.android.com/tools/building/index.html">Building and Releasing with Eclipse ADT</a>

==URL not found: Access is denied==

[code]Downloading Documentation for Android SDK, API 17, revision 1
URL not found: C:/Program Files (x86)/Android/android-sdk/temp/docs-17_r01.zip (Access is denied)[/code]

This error can occur within the Android SDK Manager on Windows 7, if the SDK manager is installed <a href="http://www.coderanch.com/t/526550/Android/Mobile/Install-Android-platforms-Android-SDK">to a protected folder</a> like `C:/Program Files (x86)`. In my case, the solution was to run the SDK manager as an Administrator.

==Getting Started (attempt 2)==

# Download the SDK Tools for an Existing IDE from https://developer.android.com/sdk/index.html#ExistingIDE, install, but do not run the Android SDK manager
# Install the Eclipse ADT Plugins from https://developer.android.com/sdk/installing/installing-adt.html
# Install packages using the Android SDK manager, as in https://developer.android.com/sdk/installing/adding-packages.html

==Displaying a message box==

[code java]
new AlertDialog.Builder(MainActivity.this)
	.setTitle("Result")
	.setMessage("Hello world!")
	.setPositiveButton(android.R.string.ok, new DialogInterface.OnClickListener() {
		@Override
		public void onClick(DialogInterface dialog, int which) {
			// do nothing
		}
	})
	.show();
[/code]

Based on <a href="http://stackoverflow.com/questions/2115758/how-to-display-alert-dialog-in-android">StackOverflow answer</a>. (You have to `setPositiveButton` for the OK button to appear.)

[[Category:Android]]