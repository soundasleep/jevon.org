---
layout: page
title:  JWebUnit
author: jevon
date:   2014-03-17 20:03:30 +13:00
tags:
  - Java
  - Testing
  - Code Snippets
  - Articles
redirect_from:
  - "/wiki/jwebunit"
  - "/wiki/Jwebunit"
---

[Articles](articles.md)

<a href="http://jwebunit.sourceforge.net/">JWebUnit</a> is a web application testing framework written in [Java](java.md), which essentially tries to provide a simple API to the powerful [HtmlUnit](htmlunit.md) framework. <a href="http://jwebunit.sourceforge.net/team-list.html">I am a committer</a> to the project.

1. [javax.net.ssl.SSLPeerUnverifiedException: peer not authenticated](javax-net-ssl-sslpeerunverifiedexception-peer-not-authenticated.md)

## Google Maps
By default, JWebUnit can't handle Google Maps, because the Google Maps Javascript has a syntax error. One solution is to turn off throwing script exceptions:

```
@Override
protected void setUp() throws Exception {
  HtmlUnitTestingEngineImpl engine = (HtmlUnitTestingEngineImpl) getTestingEngine();
  engine.setThrowExceptionOnScriptError(false);

  // continue as normal...
  super.setUp();
}
```

However, this means that **ALL** script exceptions will be hidden, which is usually not a good thing - you should try and catch script exceptions for your own code. So, you should only use the above code when it is absolutely necessary (I use a mocking approach).

## NicelyResynchronizingAjaxController
To use the `NicelyResynchronizingAjaxController` in your [JUnit](junit.md) 4 project, you can use the following code:

```
@Test
public void testSearchWithEmptySearchString() {
	beginAt("/");
	if (getTester().getTestingEngine() instanceof HtmlUnitTestingEngineImpl) {
		((HtmlUnitTestingEngineImpl) getTester().getTestingEngine()).getWebClient().setAjaxController(new NicelyResynchronizingAjaxController());
	}
	// ...
}
```

1. Running arbitrary Javascript

```
((HtmlPage) ((HtmlUnitTestingEngineImpl) getTestingEngine()).getCurrentWindow().getEnclosedPage()).executeJavaScript("alert('hello, world!');");
```
