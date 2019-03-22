---
layout: page
title:  Ant
author: jevon
date:   2013-02-17 20:36:19 +13:00
tags:
  - Technology
---

[Ant](ant.md) allows for [build](build.md) scripts.

1. <a href="http://dev.eclipse.org/newslists/news.eclipse.tools.jdt/msg10537.html">Running JUnit Plugin Tests with Ant</a> ([JUnit](junit.md), [Eclipse](eclipse.md))
1. [Disabling DTD validation for Ant xmlvalidate task within Eclipse](disabling-dtd-validation-for-ant-xmlvalidate-task-within-eclipse.md)

## Check if a file exists
If you are trying to only execute an Ant task if a certain file exists, you can use <a href="http://stackoverflow.com/questions/520546/ant-task-to-check-if-a-file-exists">a subtask to check the existance of a file</a>.

Another similar task is checking whether a file exists, and failing if it does not:

```
<target name="...">
  <available property="file.exists" file="my/file" />
  <fail unless="file.exists" message="The file my/file does not exist." />
</target>
```
