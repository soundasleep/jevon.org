---
layout: page
title:  EmberJS
author: jevon
date:   2014-07-28 17:40:42 +12:00
tags:
  - EmberJS
  - Web Development
  - Javascript
---

[Javascript](Javascript.md)

1. [Adding properties to a model within an EmberJS router](Adding_properties_to_a_model_within_an_EmberJS_router.md)
1. <a href="http://stackoverflow.com/questions/17923340/how-to-sort-model-in-ember-js">Sorting controller model results in EmberJS with `sortProperties`</a>
1. [Having a bidirectional computed property on an EmberJS text field](Having_a_bidirectional_computed_property_on_an_EmberJS_text_field.md)
1. <a href="http://www.akshay.cc/blog/2013-02-22-debugging-ember-js-and-ember-data.html">EmberJS debugging tips</a>
1. [Adding a Select2 View in EmberJS](Adding_a_Select2_View_in_EmberJS.md)
1. [Using Radio Buttons in EmberJS](Using_Radio_Buttons_in_EmberJS.md)
1. [Capturing EmberJS errors with Raygun.io](Capturing_EmberJS_errors_with_Raygun.io.md)
1. [Integration Testing with EmberJS and JQuery](Integration_Testing_with_EmberJS_and_JQuery.md)
1. [Adding an Index to an each iteration over a computed property in EmberJS](Adding_an_Index_to_an_each_iteration_over_a_computed_property_in_EmberJS.md)
1. <a href="https://github.com/soundasleep/emberjs-handlebars-sanity">EmberJS Handlebars sanity tests with Grunt</a>
1. [Waiting for EmberJS to update its views manually](Waiting_for_EmberJS_to_update_its_views_manually.md)
1. [Testing Mocha applications with Grunt using Jenkins](Testing_Mocha_applications_with_Grunt_using_Jenkins.md)
1. [Extending App.reset() in EmberJS](Extending_App.reset()_in_EmberJS.md)
1. <a href="http://www.cerebris.com/blog/2012/03/06/understanding-ember-object/">Understanding Ember.Object</a>
1. [Transient DS.Model Attributes in EmberJS](Transient_DS.Model_Attributes_in_EmberJS.md)
1. [Listing the Attributes of an EmberJS DS.Model at Runtime](Listing_the_Attributes_of_an_EmberJS_DS.Model_at_Runtime.md)
1. [The Problems with Chai](The_Problems_with_Chai.md)
1. <a href="http://stackoverflow.com/questions/14999745/emberjs-loading-screen-at-the-beginning">Adding an 'application loading' screen to an EmberJS application</a>
1. [Multiple JQuery versions with EmberJS](Multiple_JQuery_versions_with_EmberJS.md)
1. [npm](npm.md), [bower](Bower.md), [Handlebars](handlebars.md), [Grunt](Grunt.md), [JQuery](JQuery.md)

## How I learnt EmberJS and [Coffeescript](coffeescript.md) and [Git](Git.md)

I'll be using the tutorial at http://emberjs.com/guides/getting-started.

1. Install [Sublime Text 2](Sublime_Text_2.md) as an IDE.
1. Install [git](Git.md) and [nano](nano.md). Use [nano](nano.md) as the default git commit message editor, because vim support on the Windows command prompt is pretty poor: `git config --global core.editor nano`
1. Install the Sublime Linter plugin for ST2, which will provide syntax checking support, --by checking out <a href="https://github.com/SublimeLinter/SublimeLinter">SublimeLinter</a> into your ST2 packages directory (since Sublime Linter is ST3 now): `%APPDATA%/Sublime Text 2/Packages`-- by installing <a href="https://sublime.wbond.net/installation#st2">Package Control</a> and installing _Preferences > Package Control > Install Package > (wait for list to load) > Sublime Linter for ST3_ (seems to work OK). This will give you things like [PHP](PHP.md) syntax error checking.
1. <a href="http://nodejs.org/download/">Install Node.js</a> which will also install NPM (Node.js package manager)
1. Use npm to install coffeescript: `npm install -g coffee-script`
1. Check that coffeescript is working: `coffee -v`
1. Install the <a href="https://github.com/Xavura/CoffeeScript-Sublime-Plugin">CoffeeScript ST2 plugin</a> by going _Preferences > Package Control > Install Package > (wait for list to load) > CoffeeScript_
1. Sublime Text should now support coffeescript linting. (I couldn't get this to work properly yet.)
1. Create a file `%APPDATA%/Sublime Text 2/Packages/Default/CoffeeScript.sublime-settings` and configure ST2 to <a href="https://github.com/soundasleep/sublime-settings/blob/master/CoffeeScript.sublime-settings">use spaces rather than tabs for CoffeeScript files</a>.
1. Edit the [csslint](csslint.md) settings because they are pretty insane. _Preferences > Package Settings > SublimeLinter > Settings - Default_ and change `csslint_options`: `ids` to `false`, `overqualified-elements` to `false`
1. Create a new Github repository https://github.com/soundasleep/todomvc-emberjs-coffee
1. Checkout: `git clone https://github.com/soundasleep/todomvc-emberjs-coffee`
1. Update push.default on git to <a href="http://stackoverflow.com/questions/13148066/warning-push-default-is-unset-its-implicit-value-is-changing-in-git-2-0">a more intuitive value</a> (and also removes a warning): `git config --global push.default simple`
1. Follow the instructions in the <a href="http://emberjs.com/guides/getting-started">EmberJS getting started tutorial</a>, committing and pushing as necessary.
1. Try to <a href="http://arcturo.github.io/library/coffeescript/05_compiling.html">Cake building</a>; unfortunately I couldn't get this to work <a href="http://stackoverflow.com/questions/17516772/using-nodejss-spawn-causes-unknown-option-and-error-spawn-enoent-err">because of win32 problems</a>
1. Install [Grunt](Grunt.md) for <a href="http://takazudo.github.io/blog/entry/2012-04-14-grunt-coffee.html">building Coffeescript</a> instead: `npm install -g grunt`
1. Install the Grunt CLI: `npm install -g grunt-cli`
1. Create a <a href="https://github.com/soundasleep/todomvc-emberjs-coffee/blob/7a7f44bfa9d935e38e523bf57311d84cffaa7848/package.json">package.json</a>. <a href="http://package.json.nodejitsu.com/">Understanding package.json</a>
1. Create a <a href="https://github.com/soundasleep/todomvc-emberjs-coffee/blob/7a7f44bfa9d935e38e523bf57311d84cffaa7848/Gruntfile.js">Gruntfile.js</a>.
1. Install all of the necessary packages referenced in the Gruntfile: `npm install grunt-contrib-uglify grunt-contrib-qunit grunt-contrib-concat grunt-contrib-watch --save-dev`. `--save-dev` will also modify `package.json` with the new dependencies (under `devDependencies`).
1. Install https://github.com/gruntjs/grunt-contrib-coffee to compile coffeescript in Grunt: `npm install grunt-contrib-coffee --save-dev`
1. You can now compile Coffeescript by running `grunt coffee`. You can also configure Grunt to watch for new files by <a href="https://github.com/soundasleep/todomvc-emberjs-coffee/commit/8d1a7b2ed0134d310d619f4a7a180a9ea61a448c#diff-35b4a816e0441e6a375cd925af50752c">modifying your Gruntfile</a> and running `grunt watch`.
1. Configure Sublime Text to treat [Handlebars](handlebars.md) templates as HTML: [HTML syntax validation within Handlebars templates in Sublime Text 2](HTML_syntax_validation_within_Handlebars_templates_in_Sublime_Text_2.md)
1. Use the <a href="http://js2coffee.org/">js2coffee</a> interpreter a lot
1. You will have problems with things like `function(){...}.property("x")`; <a href="http://stackoverflow.com/questions/12777782/ember-computed-properties-in-coffeescript">wrap the function with brackets</a>

## DEPRECATION: Action handlers implemented directly on controllers are deprecated in favor of action handlers on an `actions` object

Can also mean that an error has been thrown and your ApplicationController does not define an 'error' action (or EmberJS has created you an 'error' action and its incorrectly misinterpreting it as a directly implemented action? I have no idea). 

This looks like an EmberJS bug and I guess it can be ignored - any other errors will be correctly reported (just sadly with no reliable stacktrace).

## arrangedContent.addArrayObserver is not a function

Are you trying to #each over a bare JS object rather than an Ember array? e.g. instead of going:

```
Todos.TodosIndexRoute = Ember.Route.extend(
	model: ->
		todos: @store.find 'todo'
		feeds: @store.find 'feed'
		# ...
)

{{ "{{" }}#each itemController="todo"}}
```

Going:

```
{{ "{{" }}#each todos itemController="todo"}}
```

## Computed model properties

An idea. Instead of:

```
date: DS.attr('string')
time: DS.attr('string')
```

Maybe:

```
datetime: DS.attr('date')
date: (->
  datetime = @get('datetime')
  moment(datetime).format('YYYY-MM-DD') unless Em.isEmpty(datetime)
).property('datetime')
time: (->
  datetime = @get('datetime')
  moment(datetime).format('HH:mm) unless Em.isEmpty(datetime)
).property('datetime')
```

## Cannot perform operations on a Metamorph that is not in the DOM

The *Error: Cannot perform operations on a Metamorph that is not in the DOM.* can be caused if you have a [Handlebars](handlebars.md) template <a href="http://stackoverflow.com/questions/17495659/ember-js-cannot-perform-operations-on-a-metamorph-that-is-not-in-the-dom-cau">using HTML comments rather than Handlebars comments</a>. e.g.:

```
<!-- something
      {{ "{{" }}#each controller}}
    ...
-->
```

This should be:

```
{{ "{{" }}!-- something
      {{ "{{" }}#each controller}}
    ...
--}}
```

Tested with <a href="https://github.com/soundasleep/emberjs-handlebars-sanity">emberjs-handlebars-sanity</a>.

## Hooking to `valueBinding`

You can modify an existing `View` to handle `valueBinding` in any way you want:

```
updateValue: (->
    # this.value is set to the date, correctly
    @$().select2 "val", @value
  ).observes('value')
```

## Prevent JQuery.ajax.error from triggering an error state in Ember<a name="ajax_promises"></a>

Normally if you call $.ajax() and the requests results in an error, your `errorCallback` will still be called, but then Ember in all its wisdom will redirect you to the error state regardless.

One way to solve this is to wrap the AJAX call in a Promise, which prevents the error state from being called - it looks like Ember assumes that a JQuery.ajax() error can reject the entire Promise within say, an `afterModel` callback.

```
App.MyAPI =
  query: (method, data, callback, errorCallback) ->

    App.MyAPI.queryPromise(method, data).then (results) ->
      # promise passed
      callback(results)
    , (status) ->
      # promise failed
      errorCallback(status)

  queryPromise: (method, data) ->
    new Ember.RSVP.Promise (resolve, reject) ->

      $.ajax
        type: "get"
        url: "http://whatever.com"
        crossDomain: true
        dataType: "json"
        success: (data) ->
          # All async code has to be wrapped with an Ember.run
          Ember.run ->
            resolve(data)
        error: (xhr, ajaxOptions, thrownError) ->
          Ember.run ->
            if (xhr.responseJSON) 
              resolve(xhr.responseJSON)
            else
              reject(xhr)
```

## Get an object from the data store synchronously

`this.store.getById('user', 1)` (thanks @eoinkelly)

## ManyArray

A `ManyArray` has no `.length` or `[index]` or `for obj in array`. Instead, use `.get('length')`, `.objectAt(index)` and `array.forEach(function(obj) { ... })`.

## Adding a `label from="id"` to an Ember text field or view

From http://stackoverflow.com/questions/10468164/using-ember-js-text-field-ids-for-a-label-tag, the following won't work:

```
<label {{ "{{" }}bind-attr for="content.field_id"}}> {{ "{{" }}content.label}}</label>
{{ "{{" }}view Ember.TextField valueBinding="content.data" id="content.field_id"}}
```

You need to instead use a `viewName` and reference this with a `bind-attr`:

```
<label {{ "{{" }}bind-attr for="view.textField.elementId"}}> {{ "{{" }}content.label}}</label>
{{ "{{" }}view Ember.TextField valueBinding="content.value" viewName="textField"}}
```

## Initialising model properties

See also <a href="http://reefpoints.dockyard.com/2014/04/17/ember-object-self-troll.html">this discussion</a> on why Ember uses prototype inheritance and how it can mess things up wonderfully.

```
var Month = Ember.Object.extend({
  setWeeks: function() {
    this.set('weeks', Em.A());
  }.on('init')
});
```

## Run Javascript after EmberJS Route Render

For example, if you need to enable JQuery tooltips on an element in a Handlebars template, you can <a href="http://stackoverflow.com/questions/18838405/why-is-ember-run-afterrender-not-working-for-css-transitions">Ember.run.next</a>:

```
App.FoosNewRoute = Ember.Route.extend
  model: (params) ->
    @store.createRecord('foo')

  renderTemplate: ->
    @render 'foos.new',
      controller: 'foosNew'

    Ember.run.next @, ->
      $(".tooltip-span").tooltip
        container: 'body'
```

Or, if you are using a view:

```
App.FooFormView = Ember.View.extend
  templateName: "foo/form"

  didInsertElement: ->
    Ember.run.next @, ->
      $(".tooltip-span").tooltip
        container: 'body'
```

## TypeError: cyclic object value

Make sure that you aren't trying to save an object property that isn't a DS.Model object. If you are, you may need to define a transient flag on the property, so that the JSONSerializer does not try to serialize the cycle: see [Transient DS.Model Attributes in EmberJS](Transient_DS.Model_Attributes_in_EmberJS.md).

## Untested

* `Em.set(App, 'mapInstance', Map)`
* `Em.get(App, 'mapInstance')` or `App.get('mapInstance')`
* `App.__container__.lookup('store:main')` - maybe to get the data store instance (thanks @jamesotron)
* `App.__container__.lookup('router:main').router.transitionTo('myroute')` - manually transition to a route (thanks @eoinkelly)
