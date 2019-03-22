---
layout: page
title:  Mac OS X
author: jevon
date:   2015-06-15 19:01:15 +12:00
tags:
  - Operating Systems
  - Software
redirect_from:
  - "/wiki/mac_os_x"
  - "/wiki/Mac Os X"
  - "/wiki/mac os x"
  - "/wiki/Mac_Os_X"
---

[Articles](Articles.md)

## Home/End keybindings

Here's my custom keyboard bindings to make my external keyboard behave more sensibly like [Windows](Windows.md), based off <a href="http://lifehacker.com/225873/mac-switchers-tip--remap-the-home-and-end-keys">this guide</a> and another guide I can't find. 

Put these into `~/Library/KeyBindings/DefaultKeyBinding.dict`, creating the file if it doesn't exist:

```
{
    /* home */
    "UF729"  = "moveToBeginningOfLine:";
    "$UF729" = "moveToBeginningOfLineAndModifySelection:";
    "^UF729"  = "moveToBeginningOfDocument:";                   /* Cmd  + Home  */  
    "^$UF729" = "moveToBeginningOfDocumentAndModifySelection:"; /* Shift + Cmd  + Home */ 

    /* end */
    "UF72B"  = "moveToEndOfLine:";
    "$UF72B" = "moveToEndOfLineAndModifySelection:";
    "^UF72B"  = "moveToEndOfDocument:";                         /* Cmd  + End   */
    "^$UF72B" = "moveToEndOfDocumentAndModifySelection:";       /* Shift + Cmd  + End */

    /* page up/down */
    "UF72C"  = "pageUp:";
    "UF72D"  = "pageDown:";
}
```
