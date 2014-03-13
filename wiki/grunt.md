---
layout: page
title:  "Grunt"
author: jevon
date:   2014-03-12 18:45:26 +1300
---

[[Grunt]] is a build tool much like [[Ant]] or [[Maven]], but using the beauty of [[Javascript]].

# <a href="http://gruntjs.com/api/grunt.file">grunt.file</a> - reading, writing files

My Grunt plugins:

# <a href="https://github.com/soundasleep/emberjs-handlebars-sanity">emberjs-handlebars-sanity</a>

==Publishing a new Grunt plugin==

See <a href="http://gruntjs.com/creating-plugins">Creating Plugins in Grunt</a>. In particular:

# Install grunt-init with `npm install -g grunt-init`
# Install the gruntplugin template with `git clone git://github.com/gruntjs/grunt-init-gruntplugin.git ~/.grunt-init/gruntplugin`
# Run `grunt-init ~/.grunt-init/gruntplugin` in an empty directory. <a href="https://github.com/gruntjs/grunt-init/tree/master/templates/licenses">Valid licenses</a> are MIT, GPL-2.0, etc.
# Run `npm install` to prepare the development environment.
# Author your plugin.
# Run `npm adduser` to create a new user for publishing plugins - use any username/password/etc you want.
# Run `npm publish` to publish the Grunt plugin to npm!

[[Category:Javascript]]
[[Category:Coffeescript]]
[[Category:Build tools]]