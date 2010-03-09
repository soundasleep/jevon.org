---
layout: page
title:  "Throwing exceptions in OAW"
author: jevon
date:   2010-03-10 11:44:03 +1300
---

[[openArchitectureWare]]

Other than model checks (.chk) files, OAW provides the ERROR definition to inform the developer that something bad has happened:

[code]«ERROR "Your message goes here"»[/code]

The problem with this is that OAW does not show or tell you where this exception occured; it only prints out the error message to System.err.

However, based on <a href="http://www.openarchitectureware.org/forum/viewtopic.php?showtopic=5540">this forum post</a>, it's possible to throw exceptions within OAW templates:

[code]«throwException("Your message goes here")»[/code]

The output now displays the backtrace, allowing you to identify where the exception occured:

[code]SEVERE: Error in Component  of type org.openarchitectureware.xpand2.Generator: 
	EvaluationException : java.lang.RuntimeException: Your message goes here
	template::Template.xpt[1993,25] on line 60 'throwException("Your message goes here")'               
	template::Template.xpt[445,41] on line 21 'EXPAND expandSitemapPage FOREACH children'
	[23,41] on line 1 'EXPAND template::Template::main FOR model'[/code]

==Implementation==
In order to implement this, simply add this to your extensions (.ext) file:

[code]String throwException(String message) :
	JAVA org.company.OawCodeGenerator.throwException(java.lang.String);[/code]

Create this method in org.company.OawCodeGenerator:

[code]public static void throwException(String message) {
  throw new RuntimeException(message);
}[/code]

(Related [[IAML]] issue: <a href="http://code.google.com/p/iaml/issues/detail?id=155">Issue 155</a>)

[[Category:OAW]]
[[Category:Code samples]]
[[Category:Technology]]