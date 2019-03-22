---
layout: page
title:  Grunt
author: jevon
date:   2014-12-15 14:47:06 +13:00
tags:
  - Javascript
  - Coffeescript
  - Build tools
redirect_from:
  - "/wiki/grunt"
---

[Grunt](grunt.md) is a build tool much like [Ant](ant.md) or [Maven](maven.md), but using the beauty of [Javascript](javascript.md).

1. <a href="http://gruntjs.com/api/grunt.file">grunt.file</a> - reading, writing files
1. [Testing Mocha applications with Grunt using Jenkins](testing-mocha-applications-with-grunt-using-jenkins.md)

My Grunt plugins:

1. <a href="https://github.com/soundasleep/emberjs-handlebars-sanity">emberjs-handlebars-sanity</a>
1. <a href="https://github.com/soundasleep/grunt-contrib-spritify">grunt-contrib-spritify</a>

## Publishing a new Grunt plugin

See <a href="http://gruntjs.com/creating-plugins">Creating Plugins in Grunt</a>. In particular:

1. Install grunt-init with `npm install -g grunt-init`
1. Install the gruntplugin template with `git clone git://github.com/gruntjs/grunt-init-gruntplugin.git ~/.grunt-init/gruntplugin`
1. Run `grunt-init gruntplugin` in an empty directory. <a href="https://github.com/gruntjs/grunt-init/tree/master/templates/licenses">Valid licenses</a> are MIT, GPL-2.0, etc.
1. Run `npm install` to prepare the development environment.
1. Author your plugin.
1. Run `npm adduser` to create a new user for publishing plugins - use any username/password/etc you want.
1. Run `npm publish` to publish the Grunt plugin to npm!
1. Use `npm search <plugin-name>` to check the plugin is now there

## Pushing a new version of a Grunt plugin

1. Update `version` in `package.json`
1. Run `npm publish` to republish the Grunt plugin to npm
1. Use `npm search <plugin-name>` to check the plugin version is updated

There's no git tagging or anything like that.

## Getting Gruntfile.coffee working

1. Install necessary Grunt packages: `npm install --save-dev grunt grunt-contrib-coffee grunt-cli`
1. Create a `Gruntfile.coffee`:
```
module.exports = (grunt) ->
  grunt.registerTask 'default', 'Try Logging', ->
    grunt.log.write('Running the default task')
```
1. Run `grunt`

## Concatenating Javascript files together

Use the <a href="https://github.com/trek/grunt-neuter">grunt-neuter</a> task.

```
neuter:
      dist:
        src: 'site/generated/js/generated-coffee.js',
        dest: 'site/generated/js/generated-coffee-compiled.js'
```

`generated-coffee.js` can have things like `require('path/*')`.
