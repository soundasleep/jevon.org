---
layout: page
title:  Multiple JQuery versions with EmberJS
author: jevon
date:   2014-07-28 17:40:25 +12:00
tags:
  - Javascript
  - EmberJS
redirect_from:
  - "/wiki/Multiple JQuery versions with EmberJS"
---

To load different versions of [JQuery](JQuery.md) on a page while still letting [EmberJS](EmberJS.md) load (which requires JQuery 1.9+), based on <a href="http://jsfiddle.net/gerry3/aLdy8/2/">this jsfiddle</a>:

```
<!-- load modern JQuery -->
<script src="jquery-1.11.1.js"></script>

<!-- configure Ember to use it, and load Ember -->
<script>
    Ember = { imports: { jQuery: jQuery.noConflict(true) } };
</script>
<script src="http://builds.emberjs.com/handlebars-1.0.0.js"></script>
<script src="http://builds.emberjs.com/ember-latest.js"></script>
<script src="http://builds.emberjs.com/ember-data-latest.js"></script>

<!-- and then reload JQuery -->
<script src="jquery-1.6.2.js"></script>
```

## Multiple JQuery versions in bower.json

You can simply <a href="http://stackoverflow.com/a/18241613/39531">specify two versions</a> like so in your [bower](Bower.md).json file:

```
{
  "dependencies": {
    "jquery": "~1.11",
    "jquery-1.6.2": "jquery#1.6.2",
  // ...
```
