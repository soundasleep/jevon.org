---
layout: page
title:  "Adding an Index to an each iteration over a computed property in EmberJS"
author: jevon
date:   2014-04-30 22:07:24 +1200
tags:   [Javascript, EmberJS]
---

[EmberJS](EmberJS.md)

In normal [EmberJS](EmberJS.md) you can't do something like this (note that this _is_ possible in [Handlebars](handlebars.md), but not EmberJS's version of Handlebars):

```
{{ "{{" }}#each foo in bazFoos}}
  {{ "{{" }}foo}} index: {{ "{{" }}index}}, first: {{ "{{" }}first}}
{{ "{{" }}/each}}
```

However, you can create an amazing hack to the computed property to add this information in:

```
App.MyModel = DS.Model.extend
  bazFoos: (->
    @get("foos").filterBy("bar", "baz").map (item, index, enumerable) ->
      item.set('index', index)
      item.set('first', index == 0)
  ).property("foos")
```
