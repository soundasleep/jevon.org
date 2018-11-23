---
layout: page
title:  "Integration Testing with EmberJS and JQuery"
author: jevon
date:   2014-04-30 19:31:05 +1200
tags:   [Javascript, Testing, EmberJS]
---

[EmberJS](emberjs.md) / [JQuery](jquery.md)

We use `mocha` and `chai` and `sinon` and `sinon-chai` for testing our [EmberJS](emberjs.md) applications.

If you have functionality that needs to be tested by changing form elements directly (e.g. `$(".class").val('hello')`) but requires asynchronous behaviour, such as updating the underlying Ember model, you can <a href="http://emberjs.com/guides/testing/testing-user-interaction/">use `andThen(function)` to chain these asynchronous events</a>:

```
describe 'interface', ->

  it 'can change the underlying model', (done) ->
    @timeout 5e3    # set timeout to 5s

    # visit the application root
    visit '/'
    Ember.run ->
      expect(find(".date-input")).not.to.be.empty
      expect(find(".time-type")).not.to.be.empty

      # defaults
      expect(find(".time-type").val()).to.equal("")
      expect(find(".date-input").val()).to.equal('original')

      # now change
      $(".time-type").val('change')
      $(".time-type").change()  # trigger on('change'), this will update model.date-input

      andThen ->
        # should now have changed
        expect(find(".date-input").val()).to.equal('updated')

        done()
```
