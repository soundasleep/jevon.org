---
layout: page
title:  "EmberJS"
author: jevon
date:   2014-01-15 15:33:02 +1300
---

[[Javascript]]

==How I learnt EmberJS and [[Coffeescript]]==

I'll be using the tutorial at http://emberjs.com/guides/getting-started.

# Install Sublime Text 2 as an IDE
# Install the Sublime Linter by checking out <a href="https://github.com/SublimeLinter/SublimeLinter">SublimeLinter</a> into your ST2 packages directory (since Sublime Linter is ST3 now): `%APPDATA%Sublime Text 2Packages`. This will give you things like [[PHP]] syntax error checking.
# <a href="http://nodejs.org/download/">Install Node.js</a> which will also install NPM (Node.js package manager)
# Use npm to install coffeescript: `npm install -g coffee-script`
# Check that coffeescript is working: `coffee -v`
# Install the <a href="https://github.com/Xavura/CoffeeScript-Sublime-Plugin">CoffeeScript ST2 plugin</a> by going _Preferences > Package Control > Install Package > (wait for list to load) > CoffeeScript_
# Sublime Text should now support coffeescript linting. (I couldn't get this to work properly yet.)
# Edit the [[csslint]] settings because they are pretty insane. _Preferences > Package Settings > SublimeLinter > Settings - Default_ and change `csslint_options`: `ids` to `false`, `overqualified-elements` to `false`

[[Category:Web Development]]
[[Category:Javascript]]