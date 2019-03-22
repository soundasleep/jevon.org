---
layout: page
title:  "Automatic virtual directories in Apache"
author: jevon
date:   2006-09-21 09:37:43 +1200
tags:   [Technology]
---

The [Apache](Apache.md) web server has this interesting... quirk... which will convert directory requests of **/foo/bar/** into **/foo/bar.php** (or another file extension) if the requested folder does not exist.

This is caused by `Options MultiViews` in the config files.

To turn it off, add `Options -MultiViews`.
