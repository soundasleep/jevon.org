---
layout: page
title:  "Force an IProject file system refresh in Eclipse"
author: jevon
date:   2008-10-21 10:19:49 +1300
tags:   [Eclipse, Article, Code Sample]
---

[Eclipse](eclipse.md)

The problem with the _IProject.refresh()_ method is that it is non-blocking; that is, it may be refreshing the file system, but you won't know when it is done. Here is a little helping code to force the current thread to wait until it's complete:

```
class HaltProgressMonitor extends NullProgressMonitor {
  @Override
  public void setCanceled(boolean cancelled) {
    isDone = true;  // bail early
    super.setCanceled(cancelled);
  }

  private boolean isDone = false;
  public synchronized boolean isDone() {
    return isDone;
  }

  @Override
  public void done() {
    isDone = true;
    super.done();
  }
}

IProject project = ...;
HaltProgressMonitor m = new HaltProgressMonitor();
project.refreshLocal(IResource.DEPTH_INFINITE, m);
try {
  while (!m.isDone()) {
    Thread.sleep(300);
  }
} catch (InterruptedException e) {
  // do something
}
```
