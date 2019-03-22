---
layout: page
title:  Automatic virtual directories in Apache
author: jevon
date:   2006-09-21 09:37:43 +12:00
tags:
  - Technology
redirect_from:
  - "/wiki/automatic_virtual_directories_in_apache"
  - "/wiki/Automatic Virtual Directories In Apache"
  - "/wiki/automatic virtual directories in apache"
  - "/wiki/Automatic_Virtual_Directories_In_Apache"
---

The [Apache](Apache.md) web server has this interesting... quirk... which will convert directory requests of **/foo/bar/** into **/foo/bar.php** (or another file extension) if the requested folder does not exist.

This is caused by `Options MultiViews` in the config files.

To turn it off, add `Options -MultiViews`.
