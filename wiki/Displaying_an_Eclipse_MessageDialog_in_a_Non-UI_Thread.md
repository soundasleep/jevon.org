---
layout: page
title:  Displaying an Eclipse MessageDialog in a Non-UI Thread
author: jevon
date:   2009-09-11 14:36:26 +12:00
tags:
  - Eclipse
  - Java
redirect_from:
  - "/wiki/Displaying an Eclipse MessageDialog in a Non-UI Thread"
---

[Eclipse](Eclipse.md)

If you are executing code in the current Non-UI thread, then you can ask the Display to render a model dialog box with the following code:

```
/**
 * Show an information dialog box.
 */
public void showInformation(final String title, final String message) {
  Display.getDefault().asyncExec(new Runnable() {
    @Override
    public void run() {
      MessageDialog.openInformation(null, title, message);
    }
  });
}
```

**ErrorDialog** the error message-displaying equivalent of **MessageDialog**.

_IF_ you were in a UI thread, you could achieve a dialog box with just this:

```
boolean result = MessageDialog.openConfirm(PlatformUI
    .getWorkbench().getActiveWorkbenchWindow()
    .getShell(), title, message);
```
