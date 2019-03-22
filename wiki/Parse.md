---
layout: page
title:  Parse
author: jevon
date:   2014-10-22 19:16:14 +13:00
tags:
  - Android
  - Cordova
---

[Parse](parse.md) is a data/push framework for [Android](android.md).

## VFY: unable to find class referenced in signature Lbolts/Task

I think in a recent version of the [Parse](parse.md) library (1.7+?) they now depend on the <a href="https://github.com/BoltsFramework/Bolts-Android">Bolts Framework</a>, so download the latest `bolts-android.jar` from <a href="https://github.com/BoltsFramework/Bolts-Android/releases">the latest Maven Central artefacts repository</a>, and add it to your [Cordova](cordova.md) plugin.

```
<platform name="android">
		// ...
		<source-file src="lib/bolts/bolts-android-1.1.3.jar" target-dir="libs" framework="true" />
		<source-file src="lib/parse/Parse-1.7.1.jar" target-dir="libs" framework="true" />
	</platform>
```
