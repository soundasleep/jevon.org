---
layout: page
title:  "JQuery"
author: jevon
date:   2014-07-28 17:36:45 +1200
tags:   [Javascript]
---

[JQuery](JQuery.md) is a [Javascript](Javascript.md) framework for interacting with the [DOM](dom.md), doing [AJAX](AJAX.md) requests and lots of new modern things.

1. [Integration Testing with EmberJS and JQuery](Integration_Testing_with_EmberJS_and_JQuery.md)
1. [Multiple JQuery versions with EmberJS](Multiple_JQuery_versions_with_EmberJS.md)

## Checking JQuery version

`$.fn.query` will return the current runtime JQuery version.

## Loading multiple JQuery versions in a page

From http://forum.jquery.com/topic/multiple-versions-of-jquery-on-the-same-page, you can use <a href="http://api.jquery.com/jquery.noconflict/">jQuery.noConflict()</a> to load multiple versions:

```
<script src='jquery-1.3.2.js'></script>
    <script>
    var jq132 = jQuery.noConflict();
    </script>
    <script src='jquery-1.4.2.js'></script>
    <script>
    var jq142 = jQuery.noConflict();
    </script>
```
