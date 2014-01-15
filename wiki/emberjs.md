---
layout: page
title:  "EmberJS"
author: jevon
date:   2014-01-15 16:41:25 +1300
---

[[Javascript]]

==How I learnt EmberJS and [[Coffeescript]] and [[Git]]==

I'll be using the tutorial at http://emberjs.com/guides/getting-started.

# Install Sublime Text 2 as an IDE
# Install the Sublime Linter by checking out <a href="https://github.com/SublimeLinter/SublimeLinter">SublimeLinter</a> into your ST2 packages directory (since Sublime Linter is ST3 now): `%APPDATA%Sublime Text 2Packages`. This will give you things like [[PHP]] syntax error checking.
# <a href="http://nodejs.org/download/">Install Node.js</a> which will also install NPM (Node.js package manager)
# Use npm to install coffeescript: `npm install -g coffee-script`
# Check that coffeescript is working: `coffee -v`
# Install the <a href="https://github.com/Xavura/CoffeeScript-Sublime-Plugin">CoffeeScript ST2 plugin</a> by going _Preferences > Package Control > Install Package > (wait for list to load) > CoffeeScript_
# Sublime Text should now support coffeescript linting. (I couldn't get this to work properly yet.)
# Edit the [[csslint]] settings because they are pretty insane. _Preferences > Package Settings > SublimeLinter > Settings - Default_ and change `csslint_options`: `ids` to `false`, `overqualified-elements` to `false`
# Create a new Github repository https://github.com/soundasleep/todomvc-emberjs-coffee
# Checkout: `git clone https://github.com/soundasleep/todomvc-emberjs-coffee`
# Update push.default on git to <a href="http://stackoverflow.com/questions/13148066/warning-push-default-is-unset-its-implicit-value-is-changing-in-git-2-0">a more intuitive value</a> (and also removes a warning): `git config --global push.default simple`
# Follow the instructions in the <a href="http://emberjs.com/guides/getting-started">EmberJS getting started tutorial</a>, committing and pushing as necessary.
# Try to <a href="http://arcturo.github.io/library/coffeescript/05_compiling.html">Cake building</a>; unfortunately I couldn't get this to work <a href="http://stackoverflow.com/questions/17516772/using-nodejss-spawn-causes-unknown-option-and-error-spawn-enoent-err">because of win32 problems</a>
# Install Grunt for <a href="http://takazudo.github.io/blog/entry/2012-04-14-grunt-coffee.html">building Coffeescript</a> instead: `npm install -g grunt`
# Install the Grunt CLI: `npm install -g grunt-cli`
# Create a package.json (TODO link). <a href="http://package.json.nodejitsu.com/">Understanding package.json</a>
# Create a Gruntfile.js (TODO link)
# Install all of the necessary packages referenced in the Gruntfile: `npm install grunt-contrib-uglify grunt-contrib-qunit grunt-contrib-concat grunt-contrib-watch --save-dev`. `--save-dev` will also modify `package.json` with the new dependencies (under `devDependencies`).
# Install https://github.com/gruntjs/grunt-contrib-coffee to compile coffeescript in Grunt: `npm install grunt-contrib-coffee --save-dev`

[[Category:Web Development]]
[[Category:Javascript]]