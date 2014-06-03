---
layout: page
title:  "Extending App.reset() in EmberJS"
author: jevon
date:   2014-06-03 17:32:36 +1200
---

[[EmberJS]]

If you want to extend `App.reset()` in your EmberJS application, you need to make sure that you extend the _prototype_ of App, rather than the _creation_ of your specific App. That is, instead of:

[code coffee]
App = window.App = Ember.Application.create
  LOG_TRANSITIONS: true

  # NOTE will not work!
  reset: ->
    @_super()
    App.isEmbedded = null
[/code]

You need to define both a prototype (which can access `@_super()`) and the creator:

[code coffee]
# we need to extend so it's available to each instance of the class
AppPrototype = Ember.Application.extend
  reset: ->
    @_super()
    App.isEmbedded = null

App = window.App = AppPrototype.create
  LOG_TRANSITIONS: true
[/code]

Otherwise you will get `App is not defined` errors. See also <a href="http://www.cerebris.com/blog/2012/03/06/understanding-ember-object/">Understanding Ember.Object</a>.

[[Category:EmberJS]]
[[Category:Javascript]]