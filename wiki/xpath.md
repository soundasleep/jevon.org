---
layout: page
title:  "XPath"
author: jevon
date:   2009-04-06 17:55:53 +1200
---

[[XML]]

# [[Using XPath to find EMF elements]]

Consider this tree:

[code]A
- B
--- B
- B (desired)
--- B
----- B ($current)[/code]

To get to the node desired, you can use the following XPath query:

[code]$current/ancestor::B[parent::A][/code]

[[Category:Technology]]
[[Category:XML]]