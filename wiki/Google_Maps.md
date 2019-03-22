---
layout: page
title:  Google Maps
author: jevon
date:   2010-04-07 17:08:16 +12:00
tags:
  - Google
  - Technology
  - Troubleshooting
redirect_from:
  - "/wiki/Google Maps"
---

[Articles](Articles.md)

An [AJAX](AJAX.md)-powered mapping technology provided by [Google](google.md), which easily allows [mashup](mashup.md)s.

1. <a href="http://code.google.com/apis/maps/signup.html">Sign up for API key</a>
1. <a href="http://code.google.com/apis/maps/documentation/reference.html">API Reference</a>

## infowindowopen, infowindowclose not working
I was having an issue where the _infowindowopen_ and _infowindowclose_ methods weren't working:

`GEvent.addListener(marker, "infowindowopen", function() {...}`

It turns out the problem was that immediately after creating these listeners, I would open a new info window, which seemed to disable all of the map markers:

`marker.openInfoWindowHtml("");`
