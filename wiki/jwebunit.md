---
layout: page
title:  "JWebUnit"
author: jevon
date:   2014-03-17 20:03:30 +1300
---

[[Articles]]

<a href="http://jwebunit.sourceforge.net/">JWebUnit</a> is a web application testing framework written in [[Java]], which essentially tries to provide a simple API to the powerful [[HtmlUnit]] framework. <a href="http://jwebunit.sourceforge.net/team-list.html">I am a committer</a> to the project.

# [[javax.net.ssl.SSLPeerUnverifiedException: peer not authenticated]]

==Google Maps==
By default, JWebUnit can't handle Google Maps, because the Google Maps Javascript has a syntax error. One solution is to turn off throwing script exceptions:

[code]@Override
protected void setUp() throws Exception {
  HtmlUnitTestingEngineImpl engine = (HtmlUnitTestingEngineImpl) getTestingEngine();
  engine.setThrowExceptionOnScriptError(false);

  // continue as normal...
  super.setUp();
}[/code]

However, this means that '''ALL''' script exceptions will be hidden, which is usually not a good thing - you should try and catch script exceptions for your own code. So, you should only use the above code when it is absolutely necessary (I use a mocking approach).

==NicelyResynchronizingAjaxController==
To use the `NicelyResynchronizingAjaxController` in your [[JUnit]] 4 project, you can use the following code:

[code]@Test
public void testSearchWithEmptySearchString() {
	beginAt("/");
	if (getTester().getTestingEngine() instanceof HtmlUnitTestingEngineImpl) {
		((HtmlUnitTestingEngineImpl) getTester().getTestingEngine()).getWebClient().setAjaxController(new NicelyResynchronizingAjaxController());
	}
	// ...
}[/code]

# Running arbitrary Javascript

[code java]
((HtmlPage) ((HtmlUnitTestingEngineImpl) getTestingEngine()).getCurrentWindow().getEnclosedPage()).executeJavaScript("alert('hello, world!');");
[/code]

[[Category:Java]]
[[Category:Testing]]
[[Category:Code Snippets]]
[[Category:Articles]]