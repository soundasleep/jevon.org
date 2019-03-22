---
layout: page
title:  Transient DS.Model Attributes in EmberJS
author: jevon
date:   2014-06-12 15:13:47 +12:00
tags:
  - EmberJS
redirect_from:
  - "/wiki/Transient DS.Model Attributes in EmberJS"
---

[EmberJS](EmberJS.md)

In [EmberJS](EmberJS.md), by default model properties are always saved through the serializers. This can be a problem if you have an Object in your model that is not a DS.Model, and you may get _TypeError: cyclic object value_ errors in _JSON.stringify_ when trying to serialize the model back to [LocalStorage](localstorage.md).

By extending the JSONSerializer (<a href="https://github.com/emberjs/data/pull/303">or the RESTSerializer in the same way</a>), you can provide a new property `transient` to your model properties that will not persist this property when the object is saved:

```
DS.JSONSerializer.reopen({
  serializeAttribute: function(record, json, key, attribute) {
    if (!attribute.options.transient) {
      return this._super(record, json, key, attribute);
    }
  }
});

App.User = DS.Model.create({
  admin: DS.attr('boolean', { transient: true })
})
```
