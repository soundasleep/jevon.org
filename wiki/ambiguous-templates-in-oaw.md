---
layout: page
title:  "Ambiguous templates in OAW"
author: jevon
date:   2010-04-27 08:09:05 +1200
tags:   [Technology, Code Generation, OAW]
---

[OpenArchitectureWare](openarchitectureware.md) has the problem where templates can be ambiguous.

Consider this [Java](java.md) code:

```
public class Test {
  public static interface A { }
  public static interface B { }
  public static class C implements A, B { }
  
  public static void main(String[] args) {
    C c = new C();
    run(c);
  }

  private static void run(A a) {
    System.out.println("a");
  }
  private static void run(B a) {
    System.out.println("b");
  }
}
```

This will not compile, because the call to _run()_ is ambiguous between A and B.

However, if you have the same type of templates in [OAW](oaw.md):

```
«DEFINE run FOR model::A»
  a
«ENDDEFINE»
«DEFINE run FOR model::B»
  b
«ENDDEFINE»
```

This will compile, and the result is completely untrustworthy! Occasionally you will get calls to A and calls to B.

There are a number of possible solutions:

1. Modify the meta-model; for example, make B extend A.
1. Add a specific check in A for B, and vice versa.
1. Write more specific checks, e.g. for C; this might result in a lot of work, but is also the cleanest (and the closest to the [Java](java.md) analogy).
1. Perhaps the two methods need to be combined together? e.g. what works for B might also work for A.
