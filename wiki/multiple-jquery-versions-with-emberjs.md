---
layout: page
title:  "Multiple JQuery versions with EmberJS"
author: jevon
date:   2014-07-28 17:38:59 +1200
---

To load different versions of [[JQuery]] on a page while still letting [[EmberJS]] load (which requires JQuery 1.9+), based on <a href="http://jsfiddle.net/gerry3/aLdy8/2/">this jsfiddle</a>:

[code html]
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
[/code]