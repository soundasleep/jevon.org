---
layout: page
title:  "Articles/Using mod_rewrite With PHP"
author: jevon
date:   2007-09-14 12:36:00 +1200
---

[[Articles]]

After a LOT of trial and error, I've come to a few conclusions about using <a href="http://httpd.apache.org/docs-2.0/mod/mod_rewrite.html">mod_rewrite</a> with [[PHP]]:

# If you have a folder /foo/, you can't have both /foo/index.php and /foo/Rewrite very easily. It makes it much easier if you have /foo/Rewrite and /f/index.php. (Source: <a href="http://meta.wikimedia.org/wiki/Rewrite_Rules">Wikimedia</a>)

Here's the .htaccess for this wiki:
[code]# /wiki/Title as an alias to /wiki/index.php?title=Title
RewriteEngine on

# wiki pages
RewriteRule ^wiki/([^.]*)$ /w/index.php?title=$1 [L,QSA]

# files in the wiki folder (e.g. images)
RewriteRule ^wiki/(.*)$ /w/$1 [L,QSA][/code]

[[Category:Article]]
[[Category:Protected]]