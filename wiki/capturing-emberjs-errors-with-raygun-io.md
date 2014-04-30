---
layout: page
title:  "Capturing EmberJS errors with Raygun.io"
author: jevon
date:   2014-04-30 18:05:24 +1200
---

[[EmberJS]]

To capture <a href="https://raygun.io">raygun.io</a> errors within an Ember application, at the most basic level you can add an error handler to Ember.onerror:

[code coffeescript]
Ember.onerror = (error) ->
  Raygun.send(error)
[/code]

If you have an error handler in your ApplicationRoute that captures and discards all errors, you should also capture the errors within the `error` action:

[code coffeescript]
App.ApplicationRoute = Ember.Route.extend
  actions:
    error: (error, transition) ->
      # Log with Raygun.io
      Raygun.send(error)

      # Silently continue
      return true
[/code]

[[Category:EmberJS]]
[[Category:Javascript]]