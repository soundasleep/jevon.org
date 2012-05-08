---
layout: page
title:  "Ant"
author: jevon
date:   2012-05-08 12:20:04 +1200
---

[[Ant]] allows for [[build]] scripts.

# <a href="http://dev.eclipse.org/newslists/news.eclipse.tools.jdt/msg10537.html">Running JUnit Plugin Tests with Ant</a> ([[JUnit]], [[Eclipse]])
# [[Disabling DTD validation for Ant xmlvalidate task within Eclipse]]

==Check if a file exists==
If you are trying to only execute an Ant task if a certain file exists, you can use <a href="http://stackoverflow.com/questions/520546/ant-task-to-check-if-a-file-exists">a subtask to check the existance of a file</a>.

Another similar task is checking whether a file exists, and failing if it does not:

[code]<target name="...">
  <available property="file.exists" file="my/file" />
  <fail unless="file.exists" message="The file my/file does not exist." />
</target>[/code]

{{tag-todo|clean up page, put down actual notes, link to iaml build.xml, perhaps stick into JUnit or Eclipse page too}}
[[Category:Todo]]
[[Category:Technology]]