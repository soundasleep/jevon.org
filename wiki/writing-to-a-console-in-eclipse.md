---
layout: page
title:  "Writing to a Console in Eclipse"
author: jevon
date:   2005-12-09 08:14:52 +1300
---

[[Articles]]

It took me forever to try and work out how to do this. Basically the problem is that you want to create a new console view in [[Eclipse]] for your plugin.

This is achieved by:

[code]MessageConsole console = new MessageConsole("My Console", null);
console.activate();
ConsolePlugin.getDefault().getConsoleManager().addConsoles(new IConsole[]{ console });
MessageConsoleStream stream = console.newMessageStream();
stream.println("Hello, world!");[/code]

The third line is '''very''' important - without this, the console will not be added to the view. I got this idea from http://www.eclipsezone.com/eclipse/forums/t52910.html

(The book ''Official Eclipse 3.0 FAQs'', which had ''FAQ 307: How do I write to the console from a plug-in?'', was totally useless.)

[[Category:Eclipse]]
[[Category:Java]]
[[Category:Article]]