---
layout: page
title:  Changing your MSN Colour
author: anonymous
date:   2006-09-02 06:57:30 +12:00
tags:
  - Article
redirect_from:
  - "/wiki/Changing your MSN Colour"
---

[Articles](Articles.md)

In an old version of this article, it described how you could change your [MSN](MSN.md) chat colour to a custom colour using the registry.

A much better idea is simply to install <a href="http://www.msgplus.net">Messenger Plus!</a>, which gives you a dialog box in MSN itself to change the text colour.

However, the relevant registry entry is still the same, which is:
`JKEY_CURRENT_USER\Software\Microsoft\MessengerService#IM Color`
And the data there is stored as hexadecimal red/green/blue/zero.
