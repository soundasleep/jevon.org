---
layout: page
title:  "Ant"
author: jevon
date:   2013-02-17 20:36:19 +1300
tags:   [Technology]
---

[Ant](Ant.md) allows for [build](build.md) scripts.

1. <a href="http://dev.eclipse.org/newslists/news.eclipse.tools.jdt/msg10537.html">Running JUnit Plugin Tests with Ant</a> ([JUnit](junit.md), [Eclipse](Eclipse.md))
1. [Disabling DTD validation for Ant xmlvalidate task within Eclipse](Disabling_DTD_validation_for_Ant_xmlvalidate_task_within_Eclipse.md)

## Check if a file exists
If you are trying to only execute an Ant task if a certain file exists, you can use <a href="http://stackoverflow.com/questions/520546/ant-task-to-check-if-a-file-exists">a subtask to check the existance of a file</a>.

Another similar task is checking whether a file exists, and failing if it does not:

```
<target name="...">
  <available property="file.exists" file="my/file" />
  <fail unless="file.exists" message="The file my/file does not exist." />
</target>
```
