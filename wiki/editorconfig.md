---
layout: page
title:  "EditorConfig"
author: jevon
date:   2015-02-22 17:46:18 +1300
---

<a href="http://editorconfig.org">EditorConfig</a> is cool.

==Applying EditorConfig settings to all files in a directory==

You can use the <a href="https://www.npmjs.com/package/editorconfig-tools">editorconfig-tools fix</a> command:

[code]
npm install edotirconfig-tools
find DIR -maxdepth 1 -type f -exec node_modules/.bin/editorconfig-tools fix {} ;
[/code]

[[Category:Javascript]]
[[Category:Programming]]