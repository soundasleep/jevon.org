---
layout: page
title:  "Listing the Attributes of an EmberJS DS.Model at Runtime"
author: jevon
date:   2014-06-29 21:19:26 +1200
tags:   [Javascript, EmberJS]
---

[EmberJS](emberjs.md)

With some hackery, you can list all of the attributes (not computed properties) of any given DS.Model type at EmberJS runtime, based on <a href="http://stackoverflow.com/questions/14368122/how-do-i-get-a-list-of-all-computed-properties">this answer</a> (and also references [Transient DS.Model Attributes in EmberJS](transient-ds-model-attributes-in-emberjs.md)):

```
Ember.run ->
  type = "myModel"
  model = App.__container__.lookup('store:main').createRecord(type)
  model.eachAttribute (name, attribute) ->
    if attribute.isAttribute and not attribute.options.transient?
      console.log type + " has attribute " + name
```

You should not be using this in production code - strictly for debugging and testing only.
