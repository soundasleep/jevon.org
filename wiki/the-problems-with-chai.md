---
layout: page
title:  "The Problems with Chai"
author: jevon
date:   2014-06-16 21:51:10 +1200
---

[[Javascript]] - [[EmberJS]] - [[Testing]]

[[Chai]] is a pretty reasonable testing framework. But there are some key problems that make it much harder than it should be to test.

==Very few methods provide an optional message==

* `expect(true).to.be.false('message')`
* `expect(undefined).to.exist('message')`

Both of these assertions will fail with "is not a function". This means the only message you will get back is _expected true to be false_ and _expected undefined to be defined_. How helpful.

I've created https://github.com/chaijs/chai/issues/272 to hopefully resolve this.

==`define` and `it` cannot have parameterised tests==

[code]
define 'my thing', ->
  for i in [0..6]
    it 'tests ' + i, ->
      expect(i).to.equal(i)
[/code]

This won't work. I haven't found a way to do parameterised tests yet.

[[Category:Testing]]
[[Category:Chai]]