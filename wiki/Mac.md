---
layout: page
title:  Mac
author: jevon
date:   2022-10-17 15:36:00 +13:00
tags:
  - Mac
  - Troubleshooting
---

[Articles](Articles.md)

## Debugging "XXX is damaged and can't be opened. You should move it to the bin"

I've had this error happen twice and Apple is not very helpful in telling you _why_ it's damaged. It's very hard to debug. These steps might help:

1. Is the application signed? It probably needs to be signed.
2. Alternatively, this error message can appear if the application is _partially_ signed but some of the files have been modified. 
   You can use `codesign` to see what's going on:
   
   ```
   codesign -d -vvvv MyApp.app --verify
   ```
