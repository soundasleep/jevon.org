---
layout: page
title:  "EmberJS"
author: jevon
date:   2014-05-12 17:35:55 +1200
---

[[Javascript]]

# [[Adding properties to a model within an EmberJS router]]
# <a href="http://stackoverflow.com/questions/17923340/how-to-sort-model-in-ember-js">Sorting controller model results in EmberJS with `sortProperties`</a>
# [[Having a bidirectional computed property on an EmberJS text field]]
# <a href="http://www.akshay.cc/blog/2013-02-22-debugging-ember-js-and-ember-data.html">EmberJS debugging tips</a>
# [[Adding a Select2 View in EmberJS]]
# [[Using Radio Buttons in EmberJS]]
# [[Capturing EmberJS errors with Raygun.io]]
# [[Integration Testing with EmberJS and JQuery]]
# [[Adding an Index to an each iteration over a computed property in EmberJS]]
# <a href="https://github.com/soundasleep/emberjs-handlebars-sanity">EmberJS Handlebars sanity tests with Grunt</a>
# [[Waiting for EmberJS to update its views manually]]
# [[Testing Mocha applications with Grunt using Jenkins]]
# [[npm]], [[bower]], [[Handlebars]], [[Grunt]]

==How I learnt EmberJS and [[Coffeescript]] and [[Git]]==

I'll be using the tutorial at http://emberjs.com/guides/getting-started.

# Install [[Sublime Text 2]] as an IDE.
# Install [[git]] and [[nano]]. Use [[nano]] as the default git commit message editor, because vim support on the Windows command prompt is pretty poor: `git config --global core.editor nano`
# Install the Sublime Linter plugin for ST2, which will provide syntax checking support, --by checking out <a href="https://github.com/SublimeLinter/SublimeLinter">SublimeLinter</a> into your ST2 packages directory (since Sublime Linter is ST3 now): `%APPDATA%/Sublime Text 2/Packages`-- by installing <a href="https://sublime.wbond.net/installation#st2">Package Control</a> and installing _Preferences > Package Control > Install Package > (wait for list to load) > Sublime Linter for ST3_ (seems to work OK). This will give you things like [[PHP]] syntax error checking.
# <a href="http://nodejs.org/download/">Install Node.js</a> which will also install NPM (Node.js package manager)
# Use npm to install coffeescript: `npm install -g coffee-script`
# Check that coffeescript is working: `coffee -v`
# Install the <a href="https://github.com/Xavura/CoffeeScript-Sublime-Plugin">CoffeeScript ST2 plugin</a> by going _Preferences > Package Control > Install Package > (wait for list to load) > CoffeeScript_
# Sublime Text should now support coffeescript linting. (I couldn't get this to work properly yet.)
# Create a file `%APPDATA%/Sublime Text 2/Packages/Default/CoffeeScript.sublime-settings` and configure ST2 to <a href="https://github.com/soundasleep/sublime-settings/blob/master/CoffeeScript.sublime-settings">use spaces rather than tabs for CoffeeScript files</a>.
# Edit the [[csslint]] settings because they are pretty insane. _Preferences > Package Settings > SublimeLinter > Settings - Default_ and change `csslint_options`: `ids` to `false`, `overqualified-elements` to `false`
# Create a new Github repository https://github.com/soundasleep/todomvc-emberjs-coffee
# Checkout: `git clone https://github.com/soundasleep/todomvc-emberjs-coffee`
# Update push.default on git to <a href="http://stackoverflow.com/questions/13148066/warning-push-default-is-unset-its-implicit-value-is-changing-in-git-2-0">a more intuitive value</a> (and also removes a warning): `git config --global push.default simple`
# Follow the instructions in the <a href="http://emberjs.com/guides/getting-started">EmberJS getting started tutorial</a>, committing and pushing as necessary.
# Try to <a href="http://arcturo.github.io/library/coffeescript/05_compiling.html">Cake building</a>; unfortunately I couldn't get this to work <a href="http://stackoverflow.com/questions/17516772/using-nodejss-spawn-causes-unknown-option-and-error-spawn-enoent-err">because of win32 problems</a>
# Install [[Grunt]] for <a href="http://takazudo.github.io/blog/entry/2012-04-14-grunt-coffee.html">building Coffeescript</a> instead: `npm install -g grunt`
# Install the Grunt CLI: `npm install -g grunt-cli`
# Create a <a href="https://github.com/soundasleep/todomvc-emberjs-coffee/blob/7a7f44bfa9d935e38e523bf57311d84cffaa7848/package.json">package.json</a>. <a href="http://package.json.nodejitsu.com/">Understanding package.json</a>
# Create a <a href="https://github.com/soundasleep/todomvc-emberjs-coffee/blob/7a7f44bfa9d935e38e523bf57311d84cffaa7848/Gruntfile.js">Gruntfile.js</a>.
# Install all of the necessary packages referenced in the Gruntfile: `npm install grunt-contrib-uglify grunt-contrib-qunit grunt-contrib-concat grunt-contrib-watch --save-dev`. `--save-dev` will also modify `package.json` with the new dependencies (under `devDependencies`).
# Install https://github.com/gruntjs/grunt-contrib-coffee to compile coffeescript in Grunt: `npm install grunt-contrib-coffee --save-dev`
# You can now compile Coffeescript by running `grunt coffee`. You can also configure Grunt to watch for new files by <a href="https://github.com/soundasleep/todomvc-emberjs-coffee/commit/8d1a7b2ed0134d310d619f4a7a180a9ea61a448c#diff-35b4a816e0441e6a375cd925af50752c">modifying your Gruntfile</a> and running `grunt watch`.
# Configure Sublime Text to treat [[Handlebars]] templates as HTML: [[HTML syntax validation within Handlebars templates in Sublime Text 2]]
# Use the <a href="http://js2coffee.org/">js2coffee</a> interpreter a lot
# You will have problems with things like `function(){...}.property("x")`; <a href="http://stackoverflow.com/questions/12777782/ember-computed-properties-in-coffeescript">wrap the function with brackets</a>

==DEPRECATION: Action handlers implemented directly on controllers are deprecated in favor of action handlers on an `actions` object==

Can also mean that an error has been thrown and your ApplicationController does not define an 'error' action (or EmberJS has created you an 'error' action and its incorrectly misinterpreting it as a directly implemented action? I have no idea). 

This looks like an EmberJS bug and I guess it can be ignored - any other errors will be correctly reported (just sadly with no reliable stacktrace).

==arrangedContent.addArrayObserver is not a function==

Are you trying to #each over a bare JS object rather than an Ember array? e.g. instead of going:

[code]
Todos.TodosIndexRoute = Ember.Route.extend(
	model: ->
		todos: @store.find 'todo'
		feeds: @store.find 'feed'
		# ...
)

{{#each itemController="todo"}}
[/code]

Going:

[code]
{{#each todos itemController="todo"}}
[/code]

==Computed model properties==

An idea. Instead of:

[code coffeescript]
date: DS.attr('string')
time: DS.attr('string')
[/code]

Maybe:

[code coffeescript]
datetime: DS.attr('date')
date: (->
  datetime = @get('datetime')
  moment(datetime).format('YYYY-MM-DD') unless Em.isEmpty(datetime)
).property('datetime')
time: (->
  datetime = @get('datetime')
  moment(datetime).format('HH:mm) unless Em.isEmpty(datetime)
).property('datetime')
[/code]

==Cannot perform operations on a Metamorph that is not in the DOM==

The *Error: Cannot perform operations on a Metamorph that is not in the DOM.* can be caused if you have a [[Handlebars]] template <a href="http://stackoverflow.com/questions/17495659/ember-js-cannot-perform-operations-on-a-metamorph-that-is-not-in-the-dom-cau">using HTML comments rather than Handlebars comments</a>. e.g.:

[code]
<!-- something
      {{#each controller}}
    ...
-->
[/code]

This should be:

[code]
{{!-- something
      {{#each controller}}
    ...
--}}
[/code]

Tested with <a href="https://github.com/soundasleep/emberjs-handlebars-sanity">emberjs-handlebars-sanity</a>.

==Hooking to `valueBinding`==

You can modify an existing `View` to handle `valueBinding` in any way you want:

[code coffeescript]
  updateValue: (->
    # this.value is set to the date, correctly
    @$().select2 "val", @value
  ).observes('value')
[/code]

==Prevent JQuery.ajax.error from triggering an error state in Ember<a name="ajax_promises"></a>==

Normally if you call $.ajax() and the requests results in an error, your `errorCallback` will still be called, but then Ember in all its wisdom will redirect you to the error state regardless.

One way to solve this is to wrap the AJAX call in a Promise, which prevents the error state from being called - it looks like Ember assumes that a JQuery.ajax() error can reject the entire Promise within say, an `afterModel` callback.

[code coffeescript]
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
              
[/code]

==Get an object from the data store synchronously==

`this.store.getById('user', 1)` (thanks @eoinkelly)

==ManyArray==

A `ManyArray` has no `.length` or `[index]` or `for obj in array`. Instead, use `.get('length')`, `.objectAt(index)` and `array.forEach(function(obj) { ... })`.

==Adding a `label from="id"` to an Ember text field or view==

From http://stackoverflow.com/questions/10468164/using-ember-js-text-field-ids-for-a-label-tag, the following won't work:

[code hbs]
<label {{bind-attr for="content.field_id"}}> {{content.label}}</label>
{{view Ember.TextField valueBinding="content.data" id="content.field_id"}}
[/code]

You need to instead use a `viewName` and reference this with a `bind-attr`:

[code hbs]
<label {{bind-attr for="view.textField.elementId"}}> {{content.label}}</label>
{{view Ember.TextField valueBinding="content.value" viewName="textField"}}
[/code]

==Initialising model properties==

See also <a href="http://reefpoints.dockyard.com/2014/04/17/ember-object-self-troll.html">this discussion</a> on why Ember uses prototype inheritance and how it can mess things up wonderfully.

[code javascript]
var Month = Ember.Object.extend({
  setWeeks: function() {
    this.set('weeks', Em.A());
  }.on('init')
});
[/code]

==Run Javascript after EmberJS Route Render==

For example, if you need to enable JQuery tooltips on an element in a Handlebars template, you can <a href="http://stackoverflow.com/questions/18838405/why-is-ember-run-afterrender-not-working-for-css-transitions">Ember.run.next</a>:

[code coffeescript]
App.FoosNewRoute = Ember.Route.extend
  model: (params) ->
    @store.createRecord('foo')

  renderTemplate: ->
    @render 'foos.new',
      controller: 'foosNew'

    Ember.run.next @, ->
      $(".tooltip-span").tooltip
        container: 'body'
[/code]

Or, if you are using a view:

[code coffeescript]
App.FooFormView = Ember.View.extend
  templateName: "foo/form"

  didInsertElement: ->
    Ember.run.next @, ->
      $(".tooltip-span").tooltip
        container: 'body'
[/code]

==Untested==

* `Em.set(App, 'mapInstance', Map)`
* `Em.get(App, 'mapInstance')` or `App.get('mapInstance')`
* `App.__container__.lookup('store:main')` - maybe to get the data store instance (thanks @jamesotron)
* `App.__container__.lookup('router:main').router.transitionTo('myroute')` - manually transition to a route (thanks @eoinkelly)

[[Category:EmberJS]]
[[Category:Web Development]]
[[Category:Javascript]]