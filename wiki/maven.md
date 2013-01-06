---
layout: page
title:  "Maven"
author: jevon
date:   2012-05-08 12:12:08 +1200
---

[[Maven]] is a build/release tool, but <a href="http://twitter.com/soundasleep/status/9608999562">I don't like it very much</a>.

==Commands==

* '''mvn eclipse:eclipse''' - does something to do with [[Eclipse]], I'm not sure what
* '''mvn install''' - build the software into a .jar
* '''mvn test''' - run all the test cases
* '''mvn dependency:copy-dependencies''' - <a href="http://old.nabble.com/export-dependency-libs-td20341759.html">download and copy all dependencies into the target folder</a>

---
'''Cannot execute mojo: resources. It requires a project with an existing pom.xml, but the build is not using one.'''

This means there is no "pom.xml" in the current directory. Perhaps you are not in the root directory of your project?

---
'''[INFO] Cannot find matching toolchain definitions for the following toolchain types:'''
'''jdk [ vendor='sun'  version='1.5' ]'''
'''Please make sure you define the required toolchains in your ~/.m2/toolchains.xml file.'''

<a href="http://docs.codehaus.org/display/MAVEN/Toolchains">[[Maven]] is complaining</a> that it can't find a [[Java|Sun JDK 1.5]]. If you create a ''toolchains.xml'' in your ''.m2'' directory with the following:

[code]<toolchains>
  <toolchain>
     <type>jdk</type>
     <provides>
         <version>1.6</version>
         <vendor>sun</vendor>
         <id>i_hate_maven</id>
     </provides>
     <configuration>
        <jdkHome>C:\program files\java\jdk1.6.0_02</jdkHome>
     </configuration>
  </toolchain>
</toolchains>[/code]

This will still not work, because Maven is insisting on a 1.5 JVM, and supplying a 1.6 JVM is not appropriate. However, you can just copy and paste toolchain as follows. As far as I know, <a href="http://java.sun.com/javase/6/webnotes/compatibility.html">JVM 1.6 is backwards compatible</a>. 

[code]<!-- I hate maven -->
<toolchains>
  <toolchain>
     <type>jdk</type>
     <provides>
         <version>1.6</version>
         <vendor>sun</vendor>
         <id>i_hate_maven</id>
     </provides>
     <configuration>
        <jdkHome>C:\program files\java\jdk1.6.0_02</jdkHome>
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
        <jdkHome>C:\program files\java\jdk1.6.0_02</jdkHome>
     </configuration>
  </toolchain>
</toolchains>[/code]

==Invalid task 'clean package', you must specify a valid lifecycle phase.==
You are trying to run a single task called "clean package". Try instead running Maven twice using "clean" and "package" as two separate tasks.

[[Category:Building]]
[[Category:Releasing]]
[[Category:Tools]]