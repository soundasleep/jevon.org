---
layout: page
title:  "C"
author: jevon
date:   2007-10-24 12:50:20 +1300
tags:   [Languages, Technology, Programming Snippets]
---

## Convert a C array a&#91;0..5] to b&#91;1..6]
```
float b&#91;4];
float *bb;
bb = b - 1;
```

## Declare an array inline
```
void myFunction(float foo[]);
...
myFunction( (float[]) {1, 2, 3, 4} );
```
