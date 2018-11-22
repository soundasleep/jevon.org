---
layout: page
title:  "Waiting for EmberJS to update its views manually"
author: jevon
date:   2014-05-06 18:20:02 +1200
tags:   [Javascript, EmberJS]
---

[EmberJS](emberjs.md)

If you are writing [integration tests](integration-tests.md) for [EmberJS](emberjs.md) and you have a situation where Promises and async calls are not being used everywhere, you might have a problem where `andThen()` and `wait()` do not work:

```
describe 'feature', ->
  it 'does something', (done) ->
    visit('/')
      .then ->
        doSomething()
      .then ->
        wait()
      .then ->
        expect($('button:contains("Go"):disabled').length).to.equal(0)
        done()
```

It's much more likely though, that you have an error in your tests or you are failing to capture an asynchronous event. So you should not do what follows next.

Here is a terrible approach, inspired by <a href="http://stackoverflow.com/questions/12086848/emberjs-how-to-wait-until-a-template-is-fully-rendered-before-accessing-its-ch">this StackOverflow answer</a>, which can be used to wait until a given view has been updated correctly:

```
describe 'feature', ->
  it 'does something', (done) ->
    visit('/')
      .then ->
        doSomething()
      .then ->
        new Em.RSVP.Promise (resolve, reject) ->
          count = 0
          waitFunction = ->
            console.log "waiting for ember to update its views..."
            reject("spent too long waiting for ember to update its views") if ++count > 1e4
            if $('button:contains("Go"):disabled').length > 0
              Ember.run.next ->
                waitFunction()
            else
              resolve()
          waitFunction()
      .then ->
        expect($('button:contains("Go"):disabled').length).to.equal(0)
        done()
```
