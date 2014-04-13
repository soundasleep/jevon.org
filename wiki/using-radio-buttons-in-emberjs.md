---
layout: page
title:  "Using Radio Buttons in EmberJS"
author: jevon
date:   2014-04-13 17:24:06 +1200
---

[[EmberJS]]

Based on <a href="http://thoughts.z-dev.org/2013/07/04/post/">Ember.RadioButton</a>, this updated view also updates radio buttons (with [[JQuery]]) if the model changes outside of clicking the buttons themselves with `updateChecked()`:

[code coffee]
App.RadioButton = Ember.View.extend
  tagName: "input"
  type: "radio"
  attributeBindings: [
    "name"
    "type"
    "value"
    "checked:checked:"
  ]

  click: ->
    @set "selection", @$().val()
    return

  checked: (->
    typeof @get('selection') != 'undefined' && @get("value").toString() == @get("selection").toString()
  ).property()

  updateChecked: (->
    @$().prop('checked', @get("selection") == @get("value"))
  ).observes('selection')

[/code]

These views can then be used as normal views:

[code handlebars]
<label>{{view App.RadioButton name="myRadio" selectionBinding="sortOrder" value="one"}} Option one</label>
<label>{{view App.RadioButton name="myRadio" selectionBinding="sortOrder" value="two"}} Option two</label>
<label>{{view App.RadioButton name="myRadio" selectionBinding="sortOrder" value="three"}} Option three</label>
[/code]

[[Category:EmberJS]]
[[Category:Javascript]]