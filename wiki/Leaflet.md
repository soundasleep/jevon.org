---
layout: page
title:  Leaflet
author: jevon
date:   2014-04-09 19:59:46 +12:00
tags:
  - Javascript
redirect_from:
  - "/wiki/leaflet"
---

[Leaflet](leaflet.md) is an abstraction layer for [Google Maps](google-maps.md) and other maps.

## L.control.locate is not a function
Make sure that you have the `L.Control.Locate.js` included.

## Calling `fitBounds()` on a layer sometimes breaks/freezes the map in Leaflet 0.7.2
<a href="https://github.com/Leaflet/Leaflet/issues/2484">Looks like this bug will be fixed in 0.7.3</a>, a workaround is to invalidate the size of the map before fitting the bounds with `map.invalidateSize()` - I guess this bug occurs if the map has not been rendered by the browser yet.
