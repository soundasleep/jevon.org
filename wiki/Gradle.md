---
layout: page
title:  Gradle
author: jevon
date:   2021-11-28 16:41:00 +13:00
tags:
  - Technology
  - Java
---

[Gradle](Gradle.md) is a [Java](Java.md) build system.

## Can not run a built jar (through `gradlew desktop:dist`) from ClassNotFoundException

I had the following in my `build.gradle`:

```gradle
 task dist(type: Jar) {
     duplicatesStrategy = 'include' // Overwrites successive files; not ideal, should really be 'fail'
     manifest {
         attributes 'Main-Class': project.mainClassName
     }
     dependsOn configurations.runtimeClasspath
     from {
        configurations.runtimeClasspath.collect { it.isDirectory() ? it : zipTree(it) }
     }
     with jar
 }
```

The underlying problem is that the .jar file had `META-INF/*.SF` which are licensing files, and these were invalid. 
With an invalid license file (or something?), [Java's classloader silently fails](https://stackoverflow.com/a/18093929/39531).

The solution is to remove the `META-INF/*` files from the .jar.

## Task 'X' uses this output of task 'Y' without declaring an explicit or implicit dependency. This can lead to incorrect results being produced, depending on what order the tasks are executed.

```gradle
task distDependencies(type: Copy) {
    from {
        configurations.runtimeClasspath.collect { it.isDirectory() ? it : zipTree(it) }
    }
    into "build/dependencies"
}
```

The problem is that `configurations.runtimeClasspath` was being used without being `dependsOn`. Solution is to add `dependsOn`:

```gradle
task distDependencies(type: Copy) {
    dependsOn configurations.runtimeClasspath   // added!
    from {
        configurations.runtimeClasspath.collect { it.isDirectory() ? it : zipTree(it) }
    }
    into "build/dependencies"
}
```


