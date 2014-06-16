---
layout: page
title:  "The Problems with Chai"
author: jevon
date:   2014-06-16 21:54:05 +1200
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

==Chaining your own properties is way too hard==

It's easy enough to define a basic assertion, for example `expect(foo).to.be.present`.

But if you want to also support `expect(foo).to.not.be.present`, then you have to go through a huge amount of work to store these properties through the assertion chains or something.

==All assertions are defined in terms of the expect() object==

That means you cannot (easily) have a new assertion like `expect(".class").to.be.present`, because we need to define the ".present" w.r.t. the `".class"` string, and not what would eventually be a $() selector.

That also means that you can not have an easy-to-understand message for the presence (or not) of elements, because the only context that you have available is the tested object.

(In our project, we could not use the `jquery` module because it interfered with [[EmberJS]].)

[[Category:Testing]]
[[Category:Chai]]