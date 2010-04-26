---
layout: page
title:  "Ambiguous templates in OAW"
author: jevon
date:   2010-04-27 08:09:05 +1200
---

[[OpenArchitectureWare]] has the problem where templates can be ambiguous.

Consider this [[Java]] code:

[code]public class Test {
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
}[/code]

This will not compile, because the call to ''run()'' is ambiguous between A and B.

However, if you have the same type of templates in [[OAW]]:

[code]«DEFINE run FOR model::A»
  a
«ENDDEFINE»
«DEFINE run FOR model::B»
  b
«ENDDEFINE»[/code]

This will compile, and the result is completely untrustworthy! Occasionally you will get calls to A and calls to B.

There are a number of possible solutions:

# Modify the meta-model; for example, make B extend A.
# Add a specific check in A for B, and vice versa.
# Write more specific checks, e.g. for C; this might result in a lot of work, but is also the cleanest (and the closest to the [[Java]] analogy).
# Perhaps the two methods need to be combined together? e.g. what works for B might also work for A.

[[Category:Technology]]
[[Category:Code Generation]]
[[Category:OAW]]