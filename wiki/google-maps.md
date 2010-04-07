---
layout: page
title:  "Google Maps"
author: jevon
date:   2010-04-07 17:08:16 +1200
---

[[Articles]]

An [[AJAX]]-powered mapping technology provided by [[Google]], which easily allows [[mashup]]s.

# <a href="http://code.google.com/apis/maps/signup.html">Sign up for API key</a>
# <a href="http://code.google.com/apis/maps/documentation/reference.html">API Reference</a>

==infowindowopen, infowindowclose not working==
I was having an issue where the ''infowindowopen'' and ''infowindowclose'' methods weren't working:

[code]GEvent.addListener(marker, "infowindowopen", function() {...}[/code]

It turns out the problem was that immediately after creating these listeners, I would open a new info window, which seemed to disable all of the map markers:

[code]marker.openInfoWindowHtml("");[/code]

[[Category:Google]]
[[Category:Technology]]
[[Category:Troubleshooting]]