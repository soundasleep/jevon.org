---
layout: page
title:  Execute a task before the Rake default task
author: jevon
date:   2014-09-11 16:43:53 +12:00
tags:
  - Ruby
redirect_from:
  - "/wiki/Execute a task before the Rake default task"
---

[Ruby](Ruby.md) / [Rake](Rake.md)

I wanted the `db:test:load` task to be run before running the default `bundle exec rake` task, the key is to define a task and declare it as a dependency in your `Rakefile`:

```
# also reload data before running test
task :test => 'db:test:load'
```
