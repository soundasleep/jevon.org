---
layout: page
title:  Adding a Select2 View in EmberJS
author: jevon
date:   2014-04-13 17:06:18 +12:00
tags:
  - EmberJS
  - Javascript
redirect_from:
  - "/wiki/Adding a Select2 View in EmberJS"
---

[EmberJS](EmberJS.md)

This is one way to use a [select2](select2.md) component in [EmberJS](EmberJS.md). First, define a view:

```
App.SelectOrder = Ember.TextField.extend

  layoutName: 'select/option'
  type: 'hidden'
  placeholder: 'initial text'

  # parameters for select2
  width: '15%'

  didInsertElement: ->
    console.log("select2 is required for SelectOrder") unless @$().select2

    data = [
      { id: "option1", text: "Option one" }
      { id: "option2", text: "Option two" }
      { id: "option3", text: "Option three" }
    ]

    @$().select2
      placeholder: @get('placeholder')
      width: @get('width')
      data: data

  updateValue: (->
    # this.value is set to the date, correctly
    @$().select2 "val", @value
  ).observes('value')
```

`updateValue()` is important to reflect changes in the model/controller.

You can then use this View in a [Handlebars](handlebars.md) template:

```
{{ "{{" }}view App.SelectOrder valueBinding="sortOrder" class="sort-order"}}
```

If you are populating the select2 at runtime, then the following may be useful to update the model with e.g. the hidden ID once an element has been selected:

```
@$().on "change", (event) =>
      model = @get("parentView").get("context").get("content")

      # Get result object from select2
      data = event.added
      model.set 'hiddenParameter', data
```
