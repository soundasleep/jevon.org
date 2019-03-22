---
layout: page
title:  Execute a task before the Rake default task
author: jevon
date:   2014-09-11 16:43:53 +12:00
tags:
  - Ruby
redirect_from:
  - "/wiki/execute_a_task_before_the_rake_default_task"
  - "/wiki/Execute A Task Before The Rake Default Task"
  - "/wiki/execute a task before the rake default task"
  - "/wiki/Execute_A_Task_Before_The_Rake_Default_Task"
---

[Ruby](Ruby.md) / [Rake](Rake.md)

I wanted the `db:test:load` task to be run before running the default `bundle exec rake` task, the key is to define a task and declare it as a dependency in your `Rakefile`:

```
# also reload data before running test
task :test => 'db:test:load'
```
