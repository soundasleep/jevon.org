---
layout: page
title:  "Writing to a Console in Eclipse"
author: anonymous
date:   2006-11-21 04:16:04 +1300
tags:   [Eclipse, Java, Article]
---

[Articles](Articles.md)

It took me forever to try and work out how to do this. Basically the problem is that you want to create a new console view in [Eclipse](Eclipse.md) for your plugin.

This is achieved by:

```
MessageConsole console = new MessageConsole("My Console", null);
console.activate();
ConsolePlugin.getDefault().getConsoleManager().addConsoles(new IConsole[]{ console });
MessageConsoleStream stream = console.newMessageStream();
stream.println("Hello, world!");
```

The third line is **very** important - without this, the console will not be added to the view. I got this idea from http://www.eclipsezone.com/eclipse/forums/t52910.html

(The book _Official Eclipse 3.0 FAQs_, which had _FAQ 307: How do I write to the console from a plug-in?_, was totally useless.)
