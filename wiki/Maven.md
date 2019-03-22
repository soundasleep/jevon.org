---
layout: page
title:  Maven
author: jevon
date:   2014-03-17 16:02:32 +13:00
tags:
  - Building
  - Releasing
  - Tools
---

**[INFO] Cannot find matching toolchain definitions for the following toolchain types:**
**jdk [ vendor='sun'  version='1.5' ]**
**Please make sure you define the required toolchains in your ~/.m2/toolchains.xml file.**

<a href="http://docs.codehaus.org/display/MAVEN/Toolchains">[Maven](maven.md) is complaining</a> that it can't find a [Sun JDK 1.5](java.md). If you create a _toolchains.xml_ in your _.m2_ directory with the following:

```
<toolchains>
  <toolchain>
     <type>jdk</type>
     <provides>
         <version>1.6</version>
         <vendor>sun</vendor>
         <id>i_hate_maven</id>
     </provides>
     <configuration>
        <jdkHome>C:program filesjavajdk1.6.0_02</jdkHome>
     </configuration>
  </toolchain>
</toolchains>
```

This will still not work, because Maven is insisting on a 1.5 JVM, and supplying a 1.6 JVM is not appropriate. However, you can just copy and paste toolchain as follows. As far as I know, <a href="http://java.sun.com/javase/6/webnotes/compatibility.html">JVM 1.6 is backwards compatible</a>. 

```
<!-- I hate maven -->
<toolchains>
  <toolchain>
     <type>jdk</type>
     <provides>
         <version>1.6</version>
         <vendor>sun</vendor>
         <id>i_hate_maven</id>
     </provides>
     <configuration>
        <jdkHome>C:program filesjavajdk1.6.0_02</jdkHome>
     </configuration>
  </toolchain>
  <toolchain>
     <type>jdk</type>
     <provides>
         <version>1.5</version>
         <vendor>sun</vendor>
         <id>i_hate_maven_2</id>
     </provides>
     <configuration>
        <jdkHome>C:program filesjavajdk1.6.0_02</jdkHome>
     </configuration>
  </toolchain>
</toolchains>
```

## Invalid task 'clean package', you must specify a valid lifecycle phase.
You are trying to run a single task called "clean package". Try instead running Maven twice using "clean" and "package" as two separate tasks.
