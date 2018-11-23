---
layout: page
title:  "Execute a task before the Rake default task"
author: jevon
date:   2014-09-11 16:43:53 +1200
tags:   [Ruby]
---

[Ruby](ruby.md) / [Rake](rake.md)

I wanted the `db:test:load` task to be run before running the default `bundle exec rake` task, the key is to define a task and declare it as a dependency in your `Rakefile`:

```
# also reload data before running test
task :test => 'db:test:load'
```
