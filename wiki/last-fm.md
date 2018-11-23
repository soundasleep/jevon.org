---
layout: page
title:  "Last.fm"
author: jevon
date:   2016-05-19 18:59:32 +1200
tags:   [Code Snippets, Javascript]
---

1. {% include lastfm.md %} <a href="http://www.last.fm/user/jdub_dub">My last.fm (jdub_dub)</a>

## Mass Track Delete
Occasionally I accidentally leave a machine running while it is playing music (e.g. through headphones), and as a result my Last.fm gets polluted with tracks. I don't know of any way in Last.fm to delete multiple tracks, so I finally got fed up and developed the following bookmarklet.

**When you are on your tracks page** and run the code below, it will iterate through every delete icon and click it; it will take about 50 seconds to delete most of the elements on the page.

**WARNING** It will delete anything that it can find, so don't run it on other pages!

You can either <a href="javascript:if(typeof HTMLElement!='undefined'&&!HTMLElement.prototype.click) HTMLElement.prototype.click = function(){ var evt = this.ownerDocument.createEvent('MouseEvents'); evt.initMouseEvent('click', true, true, this.ownerDocument.defaultView, 1, 0, 0, 0, 0, false, false, false, false, 0, null); this.dispatchEvent(evt); }; var mdf=function(){ var e = document.getElementsByClassName('dismiss_icon'); if (e.length > 0) { window.setTimeout(mdf, 1000); e[0].click(); } }; mdf();">drag this link</a> into your bookmarks, or you can copy and paste the code directly:

`javascript:if(typeof HTMLElement!='undefined'&&!HTMLElement.prototype.click) HTMLElement.prototype.click = function(){ var evt = this.ownerDocument.createEvent('MouseEvents'); evt.initMouseEvent('click', true, true, this.ownerDocument.defaultView, 1, 0, 0, 0, 0, false, false, false, false, 0, null); this.dispatchEvent(evt); }; var mdf=function(){ var e = document.getElementsByClassName('dismiss_icon'); if (e.length > 0) { window.setTimeout(mdf, 1000); e[0].click(); } }; mdf();`

It uses code written by <a href="http://www.webdeveloper.com/forum/archive/index.php/t-102595.html">Jason Karl Davis</a> to emulate element clicking (<a href="https://developer.mozilla.org/en/DOM/element.click">Firefox does not support arbitrary click()</a>).

## Part 2

This is an updated version of the above code. <a href="javascript:(function(){window.setInterval(%20function()%20{{ "{% "}}20try%20{{ "{% "}}20if%20(document.getElementsByClassName("icon%20dismiss_icon").length%20==%200)%20return;%20document.getElementsByClassName("icon%20dismiss_icon")[0].parentNode.onclick();%20}%20catch%20(e)%20{throw%20e}%20},%201000);})();">draggable link</a>

`javascript:(function(){window.setInterval(%20function()%20{{ "{% "}}20try%20{{ "{% "}}20if%20(document.getElementsByClassName("icon%20dismiss_icon").length%20==%200)%20return;%20document.getElementsByClassName("icon%20dismiss_icon")[0].parentNode.onclick();%20}%20catch%20(e)%20{throw%20e}%20},%201000);})();`

## Part 3
This works on the most recent last.fm website. Uses [jQuery] to be more straightforward.

`jQuery(".chartlist-delete-button").each(function(i, e) { window.setTimeout(function() { e.click(); }, 300 * i); })`
