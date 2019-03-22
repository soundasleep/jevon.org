---
layout: page
title:  Capturing EmberJS errors with Raygun.io
author: jevon
date:   2014-05-05 19:23:43 +12:00
tags:
  - EmberJS
  - Javascript
redirect_from:
  - "/wiki/Capturing EmberJS errors with Raygun.io"
---

[EmberJS](EmberJS.md)

To capture <a href="https://raygun.io">raygun.io</a> errors within an Ember application, at the most basic level you can add an error handler to `Ember.onerror`:

```
Ember.onerror = (error) ->
  Raygun.send(error)
  console.error(error)    # optional: fixes https://github.com/emberjs/ember.js/issues/4817
```

If you have an error handler in your ApplicationRoute that captures and discards all errors, you should also capture the errors within the `error` action:

```
App.ApplicationRoute = Ember.Route.extend
  actions:
    error: (error, transition) ->
      # Log with Raygun.io
      Raygun.send(error)

      # Silently continue
      return true
```
