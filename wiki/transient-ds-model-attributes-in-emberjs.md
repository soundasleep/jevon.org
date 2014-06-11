---
layout: page
title:  "Transient DS.Model Attributes in EmberJS"
author: jevon
date:   2014-06-11 22:25:43 +1200
---

[[EmberJS]]

In [[EmberJS]], by default model properties are always saved through the serializers. This can be a problem if you have an Object in your model that is not a DS.Model, and you may get _TypeError: cyclic object value_ errors in _JSON.stringify_ when trying to serialize the model back to [[LocalStorage]].

By extending the JSONSerializer (<a href="https://github.com/emberjs/data/pull/303">or the RESTSerializer in the same way</a>), you can provide a new property `transient` to your model properties that will not persist this property when the object is saved:

[code javascript]
DS.JSONSerializer.reopen({
  serializeAttribute: function(record, json, key, attribute) {
    if (!attribute.type.transient) {
      return this._super(record, json, key, attribute);
    }
  }
});

App.User = DS.Model.create({
  admin: DS.attr('boolean', { transient: true })
})
[/code]

[[Category:EmberJS]]