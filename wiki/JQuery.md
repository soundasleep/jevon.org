---
layout: page
title:  JQuery
author: jevon
date:   2014-07-28 17:36:45 +12:00
tags:
  - Javascript
---

[JQuery](jquery.md) is a [Javascript](javascript.md) framework for interacting with the [DOM](dom.md), doing [AJAX](ajax.md) requests and lots of new modern things.

1. [Integration Testing with EmberJS and JQuery](integration-testing-with-emberjs-and-jquery.md)
1. [Multiple JQuery versions with EmberJS](multiple-jquery-versions-with-emberjs.md)

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
