---
layout: page
title:  "JQuery"
author: jevon
date:   2014-07-28 17:35:54 +1200
---

[[JQuery]] is a [[Javascript]] framework for interacting with the [[DOM]], doing [[AJAX]] requests and lots of new modern things.

# [[Integration Testing with EmberJS and JQuery]]

==Checking JQuery version==

`$.fn.query` will return the current runtime JQuery version.

==Loading multiple JQuery versions in a page==

From http://forum.jquery.com/topic/multiple-versions-of-jquery-on-the-same-page:

[code html]
    <script src='jquery-1.3.2.js'></script>
    <script>
    var jq132 = jQuery.noConflict();
    </script>
    <script src='jquery-1.4.2.js'></script>
    <script>
    var jq142 = jQuery.noConflict();
    </script>
[/code]

[[Category:Javascript]]