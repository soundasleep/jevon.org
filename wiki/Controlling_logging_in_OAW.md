---
layout: page
title:  "Controlling logging in OAW"
author: jevon
date:   2009-04-23 11:47:10 +1200
tags:   [Code Snippets, OAW, Java]
---

[openArchitectureWare](openArchitectureWare.md)

We have to do some magic to enable OAW logging to go through our own logging class. Since OAW instantiates the logs at runtime, and this instantiation is far away from any Eclipse plugin we are using to run it, we have to provide this information to [commons.logging](commons-logging.md) directly.

In <a href="http://code.google.com/p/iaml/source/detail?r=613">r613</a> of [IAML](IAML.md) I managed to implement this, following the instructions on <a href="http://oaw-forum.itemis.de/forum/viewtopic.php?forum=1&showtopic=1486">a German OAW forum</a>.

Create your <a href="http://code.google.com/p/iaml/source/browse/trunk/org.openiaml.model.codegen.oaw/src/org/openiaml/model/codegen/oaw/MyLog.java?spec=svn613&r=613">own Log class</a>:

```
public class MyLog extends SimpleLog implements org.apache.commons.logging.Log, Serializable {
  private static final long serialVersionUID = 9181448189753075665L;
  
  private static String lastLogFactory = null;
  
  /**
   * Register this log to commons.logging.
   */
  public static void registerToLogFactory()
  {
    lastLogFactory = System.getProperty("org.apache.commons.logging.Log");
    System.setProperty("org.apache.commons.logging.Log", MyLog.class.getName());
  }

  /**
   * Reset the log from commons.logging, so that other plugins
   * continue to work as normal.
   */
  public static void unregisterFromLogFactory()
  {
    if (lastLogFactory == null) {
      // we have to clear it this way, we can't set it to null, or we will get a NullPointerException
      System.clearProperty("org.apache.commons.logging.Log");
    } else {
      System.setProperty("org.apache.commons.logging.Log", lastLogFactory);
    }
  }
  
  /**
   * org.apache.commons.logging.impl.LogFactoryImpl requires a
   * constructor with a String parameters, or a NoSuchMethodException
   * will be thrown.
   * 
   * @param name Name of the log
   */
  public MyLog(String name) { 
    super(name);
    
    setLevel(LOG_LEVEL_ALL);
  }

  /**
   * Override any log methods here.
   */
  @Override
  protected void log(int type, Object message, Throwable t) {
    // TODO Auto-generated method stub
    super.log(type, "[my log] " + message, t);
  }
}
```

<a href="http://code.google.com/p/iaml/source/diff?spec=svn613&r=613&format=side&path=/trunk/org.openiaml.model.codegen.oaw/src/org/openiaml/model/codegen/oaw/OawCodeGenerator.java#43">Around your WorkflowRunner instantiation</a>, specify [commons.logging](commons-logging.md) to use the current ClassLoader, and register the log with [commons.logging](commons-logging.md):

```
ClassLoader oldcl = Thread.currentThread().getContextClassLoader();
try {
  // to enable custom logging
  Thread.currentThread().setContextClassLoader(OawCodeGenerator.class.getClassLoader());
  MyLog.registerToLogFactory();

  ...
  new WorkflowRunner().run(wfFile,
    new ProgressMonitorAdapter(monitor), properties, slotContents);
  ...
} finally {
  // reset the classloader/log
  Thread.currentThread().setContextClassLoader(oldcl);
  MyLog.unregisterFromLogFactory();
}
```
