---
layout: page
title:  "XMLSpy"
author: jevon
date:   2005-08-29 11:12:28 +1200
---

[[Articles]]

=Root element 'xs:<!-- -->schema' not defined in DTD/Schema=
I got this problem when I had a project set up with a validating stylesheet, and the XML Schema was also in the project. XMLSpy would try and validate the XML Schema with respect to the same XML Schema, thus the problem.

The solution was to not use projects, or remove it from the project itself.

----
[[Category:Article]]