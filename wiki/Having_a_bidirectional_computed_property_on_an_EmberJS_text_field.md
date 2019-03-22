---
layout: page
title:  Having a bidirectional computed property on an EmberJS text field
author: jevon
date:   2014-04-01 21:28:52 +13:00
tags:
  - Javascript
redirect_from:
  - "/wiki/Having a bidirectional computed property on an EmberJS text field"
---

[EmberJS](EmberJS.md)

We had an issue where we had an EmberJS model with an attribute `time`, but we wanted to display this as a human-readable time that was also user-editable. 

We couldn't just add a computed property and use an `{<!-- -->{input valueBinding="..."}<!-- -->}`, because `valueBinding` is one directional only (if we change the _TextField_, it may change the computed property but this computed property will not change the original property). It seemed too messy to create a new model property `timeHumanReadable` that would then be updated accordingly - we only want to store the original time for API purposes.

The solution was to first create a computed property `timeHumanReadable` on the original Ember model:

```
App.MyModel = DS.Model.extend
  # this HAS to be format '11:00'
  time: DS.attr('string', {
    defaultValue: moment(new Date()).format("HH:mm")
  })

  timeHumanReadable: ( ->
    moment(@get("time"), "HH:mm").format("h:mma")
  ).property("time")
```

And then create a new View called _TextFieldTime_, which would get a reference to the original model object and update times accordingly:

```
App.TextFieldTime = Ember.TextField.extend
  init: ->
    @_super()
    @model = @get("parentView").get("context").get("content")

  focusOut: ->
    # we first convert the human time into HH:mm, and then display the reformatted human time
    converted = App.TimeHelper.convert(@value, moment().format("HH:mm"))
    @model.set('time', converted)
    # setting 'time' in focusOut doesn't seem to update listening properties, and setting it through @$().val
    # will not persist across page transitions, so we just update the computed property directly - seems to work
    @model.set('timeHumanReadable', moment(converted, 'HH:mm').format('h:mma'))
```

Finally, using this in a [Handlebars](handlebars.md) template:

```
{{ "{{" }}view App.TextFieldTime valueBinding="timeHumanReadable" isVisibleBinding="isNormalTime" class="my-time-input-class"}}
```
