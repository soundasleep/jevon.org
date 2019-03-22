---
layout: page
title:  "XPath"
author: jevon
date:   2009-04-06 17:55:53 +1200
tags:   [Technology, XML]
---

[XML](xml.md)

1. [Using XPath to find EMF elements](using-xpath-to-find-emf-elements.md)

Consider this tree:

```
A
- B
--- B
- B (desired)
--- B
----- B ($current)
```

To get to the node desired, you can use the following XPath query:

`$current/ancestor::B[parent::A]`
