---
layout: page
title:  Changing Open Dialog Default Sort Order in Windows
author: jevon
date:   2007-11-28 07:57:45 +13:00
tags:
  - Windows
redirect_from:
  - "/wiki/changing_open_dialog_default_sort_order_in_windows"
  - "/wiki/Changing Open Dialog Default Sort Order In Windows"
  - "/wiki/changing open dialog default sort order in windows"
  - "/wiki/Changing_Open_Dialog_Default_Sort_Order_In_Windows"
---

[Articles](Articles.md)

This was bugging me for weeks... finally, a [Google](google.md) search revealed how to fix this...

{% include begin-quote.md %}Somehow or another, the sort order of the files can get changed in the File Open Dialog Box, as well as any other common dialog box that lists files based on the same control.

Anyway, the fix:

Right click My Computer, choose Explore.
Click on the C: Drive in the left pane.
Click on the View Menu, then choose List.
Right click in the empty whitespace area in the right pane where the
files get listed.
Choose Arrange Icons By.
Pick "Name".
Verify files are sorted alphabetically. If not, repeat.
Press and hold the control key, then click on the "X" to close
Explorer.

Then you can reopen explorer and set whatever default view you want in explorer.

The key here, is that the file open dialog box, and all other similar controls, use the sort method saved when in "List" view. Nowhere else have I seen this. If you do it using "Details" view, it won't fix the dialog box sort order.{% include end-quote.md %}

Source: http://www.tabletquestions.com/windows-xp/15828-file-sort-order-reversed-wrong-file-open-file-save-dialog-box.html
