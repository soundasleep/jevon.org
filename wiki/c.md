---
layout: page
title:  "C"
author: jevon
date:   2007-10-24 12:50:20 +1300
---

==Convert a C array a&#91;0..5] to b&#91;1..6]==
[code]float b&#91;4];
float *bb;
bb = b - 1;[/code]

==Declare an array inline==
[code]void myFunction(float foo[]);
...
myFunction( (float[]) {1, 2, 3, 4} );[/code]

[[Category:Languages]]
[[Category:Technology]]
[[Category:Programming Snippets]]