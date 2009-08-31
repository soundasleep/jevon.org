---
layout: page
title:  "Log4J"
author: jevon
date:   2009-08-31 16:03:27 +1200
---

[[Log4J]] is a logging framework for [[Java]] which can be quite a challenge to set up. Because it is based on files, rather than Java code, there is a lot of trickery and witchery needed to set it up.

==Eclipse and Log4J==
I have found a solution which is the easiest way to specify a ''log4j.properties'' configuration if you are running an [[Eclipse]] JUnit Plugin Test. Essentially, you create a basic log4j.properties like so:

[code]# Set root logger level to DEBUG and its only appender to A1.
log4j.rootLogger=DEBUG, A1

# A1 is set to be a ConsoleAppender.
log4j.appender.A1=org.apache.log4j.ConsoleAppender

# A1 uses PatternLayout.
log4j.appender.A1.layout=org.apache.log4j.PatternLayout
log4j.appender.A1.layout.ConversionPattern=%-4r [%t] %-5p %c %x - %m%n[/code]

And instruct Log4j to use this file instead:

[code]System.setProperty("log4j.configuration", "file:///" + new File("log4j.properties").getAbsolutePath());[/code]

[[Category:Java]]
[[Category:Eclipse]]