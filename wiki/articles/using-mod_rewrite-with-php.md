---
layout: page
title:  "Articles/Using mod_rewrite With PHP"
author: jevon
date:   2013-01-07 01:22:59 +1300
tags:   [Article, Apache, PHP]
---

[Articles](articles.md)

After a LOT of trial and error, I've come to a few conclusions about using <a href="http://httpd.apache.org/docs-2.0/mod/mod_rewrite.html">mod_rewrite</a> with [PHP](php.md):

1. If you have a folder /foo/, you can't have both /foo/index.php and /foo/Rewrite very easily. It makes it much easier if you have /foo/Rewrite and /f/index.php. (Source: <a href="http://meta.wikimedia.org/wiki/Rewrite_Rules">Wikimedia</a>)

Here's the .htaccess for this wiki:
```
# /wiki/Title as an alias to /wiki/index.php?title=Title
RewriteEngine on

# wiki pages
RewriteRule ^wiki/([^.]*)$ /w/index.php?title=$1 [L,QSA]

# files in the wiki folder (e.g. images)
RewriteRule ^wiki/(.*)$ /w/$1 [L,QSA]
```
