---
layout: page
title:  "Tips and Techniques for Improving Drools Performance"
author: jevon
date:   2010-07-12 13:53:28 +1200
---

[[Drools]]

# [[Improving Drools Memory Performance]]

Here are various notes I've collected from developing a large ruleset in [[Drools]] in order to improve performance.

# Using the `==` operator over `equals()` is recommended as this allows for hashing to mprove performance (<a href="http://downloads.jboss.com/drools/docs/4.0.4.17825.GA/html_single/index.html#d0e3504">link</a>)
# Nested accessors are much slower than direct field access, e.g. `age > $p.children[0].age` (<a href="http://downloads.jboss.com/drools/docs/4.0.4.17825.GA/html_single/index.html#d0e3630">link</a>)
# ''"StatelessSessions also support sequential mode, which is a special optimised mode that uses less memory and executes faster"''
# Factor out code from the rule body; i.e., the rule bodies should be as small as possible (<a href="http://www.mail-archive.com/rules-users@lists.jboss.org/msg12693.html">link</a>)

[[Category:Articles]]
[[Category:Drools]]