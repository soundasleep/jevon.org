---
layout: page
title:  "EmberJS"
author: jevon
date:   2014-02-25 18:25:01 +1300
---

[[Javascript]]

# [[Adding properties to a model within an EmberJS router]]
# <a href="http://stackoverflow.com/questions/17923340/how-to-sort-model-in-ember-js">Sorting controller model results in EmberJS with `sortProperties`</a>

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
# Install Grunt for <a href="http://takazudo.github.io/blog/entry/2012-04-14-grunt-coffee.html">building Coffeescript</a> instead: `npm install -g grunt`
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

[[Category:EmberJS]]
[[Category:Web Development]]
[[Category:Javascript]]