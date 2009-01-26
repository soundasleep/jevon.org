---
layout: page
title:  "Getting the last error or IStatus thrown in Eclipse"
author: jevon
date:   2009-01-27 09:36:53 +1300
---

[[Articles]] > [[Eclipse]]

This isn't quite the solution, but this is a start. We register an additional logging mechanism to the Eclipse Platform which allows us to catch IStatuses that are thrown. However, since the Platform is running in a different thread, it will be difficult to pass information back to the original thread.

[code]/**
 * Before jumping into an Eclipse test, this method should be called
 * so we can catch any exceptions that occur during loading, and 
 * print them out to the log.
 */
protected void addLogListener() {
  Platform.addLogListener(new ILogListener() {
    @Override
    public void logging(IStatus status, String plugin) {
      // rethrow if exception is caught
      if (status.getSeverity() == IStatus.ERROR) {
        // JUnit won't actually catch this, because the Platform is
        // in a different thread. however we will still get the 
        // stack trace in System.err so this remains somewhat useful.
        throw new RuntimeException(status.getMessage(), status.getException());
      } else {        
        // otherwise just print out the error
        System.err.println(status);
      }
    }});
}[/code]

Used in the <a href="http://code.google.com/p/iaml/source/detail?r=400">IAML project</a>.

[[Category:Code Samples]]
[[Category:Eclipse]]
[[Category:Java]]