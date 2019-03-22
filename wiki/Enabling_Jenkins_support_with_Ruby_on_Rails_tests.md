---
layout: page
title:  Enabling Jenkins support with Ruby on Rails tests
author: jevon
date:   2015-03-24 20:25:56 +13:00
tags:
  - Ruby on Rails
  - Testing
redirect_from:
  - "/wiki/Enabling Jenkins support with Ruby on Rails tests"
---

[Ruby on Rails](Ruby_on_Rails.md)

1. Make sure you are using Rails 4.1+.

2. Use the <a href="https://github.com/ci-reporter/ci_reporter_minitest">`ci_reporter_minitest`</a> gem in your `Gemfile`, and run `bundle update`:

```
gem 'ci_reporter_minitest', '~> 1.0.0'
```

3. Require the `ci:setup:minitest` task as a dependency of the `test` task:

```
# /Rakefile

# ...
Rrw::Application.load_tasks

# Require the reporter in your Rakefile, and ensure that ci:setup:minitest is a dependency of your minitest task:
require 'ci/reporter/rake/minitest'
task :test => 'ci:setup:minitest'
```

4. Run `rake test`, and `test/reports/*.xml` should be generated!

5. Configure Jenkins to _Publish JUnit test result report_ from `test/reports/*.xml,spec/reports/*.xml`
