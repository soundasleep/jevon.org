---
layout: page
title:  "Changing your MSN Colour"
author: jevon
date:   2006-05-31 07:34:53 +1200
---

[[Articles]]

In an old version of this article, it described how you could change your [[MSN]] chat colour to a custom colour using the registry.

A much better idea is simply to install <a href="http://www.msgplus.net">Messenger Plus!</a>, which gives you a dialog box in MSN itself to change the text colour.

However, the relevant registry entry is still the same, which is:
[code]JKEY_CURRENT_USER\Software\Microsoft\MessengerService#IM Color[/code]
And the data there is stored as hexadecimal red/green/blue/zero.

[[Category:Article]] 