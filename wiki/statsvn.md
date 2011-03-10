---
layout: page
title:  "StatSVN"
author: jevon
date:   2010-04-12 07:07:32 +1200
---

[[StatSVN]] is a statistics generation tool for [[SVN]].

==svn log: svn info: Invalid svn info xml; unable to find revision or url for path [logfile.log]==
This occured because, in my repository directory (trunk/), there was a phantom file "logfile.log" that was '''svn add'''ed, but didn't exist.

The solution was to '''svn revert''' the phantom file.

[[Category:Technology]]