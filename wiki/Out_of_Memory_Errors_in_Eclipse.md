---
layout: page
title:  Out of Memory Errors in Eclipse
author: jevon
date:   2009-07-23 12:13:04 +12:00
tags:
  - Eclipse
redirect_from:
  - "/wiki/Out of Memory Errors in Eclipse"
---

[Eclipse](Eclipse.md)

I was getting lots of PermGen OutOfMemoryErrors while trying to develop with Eclipse.

The following eclipse.ini settings worked on my machine:
```
--launcher.XXMaxPermSize
1500m
-vmargs
-Xms384m
-Xmx512m
-XX:PermSize=256M
-XX:MaxPermSize=768M
```

```
-vmargs
-Xms384m
-Xmx512m
-XX:PermSize=256M
-XX:MaxPermSize=819M
```

```
-vmargs
-Xms384m
-Xmx512m
-XX:PermSize=900M
-XX:MaxPermSize=900M
```
(This made Eclipse use 1.5 GB of memory!)

These did not:
```
--launcher.XXMaxPermSize
1024m
-vmargs
-Xms512m
-Xmx768m
-XX:PermSize=512M
-XX:MaxPermSize=768M
```

```
--launcher.XXMaxPermSize
1536m
-vmargs
-Xms512m
-Xmx768m
-XX:PermSize=512M
-XX:MaxPermSize=768M
```

```
-vmargs
-Xms384m
-Xmx819m
-XX:PermSize=256M
-XX:MaxPermSize=819M
```

```
-vmargs
-Xms384m
-Xmx640m
-XX:PermSize=900M
-XX:MaxPermSize=900M
```

The arguments "--launcher.XXMaxPermSize" and "-XX:MaxPermSize=" do the same thing, and later values override earlier values.

"-XX:<!-- -->PermSize" and "-XX:MaxPermSize" are <a href="http://www.unixville.com/~moazam/stories/2004/05/17/maxpermsizeAndHowItRelatesToTheOverallHeap.html">two separate pools</a> that combine on top of "-Xms" and "-Xmx", so you can combine them together to use lots of memory.
