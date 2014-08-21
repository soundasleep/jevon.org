---
layout: page
title:  "Enabling Jenkins support with Ruby on Rails tests"
author: jevon
date:   2014-08-21 19:46:17 +1200
---

[[Ruby on Rails]]

1. Make sure you are using Rails 4.1+.

2. Use the <a href="https://github.com/ci-reporter/ci_reporter_minitest">ci_reporter_minitest</a> gem in your `Gemfile`, and run `bundle update`:

[code]
gem 'ci_reporter_minitest', '~> 1.0.0'
[/code]

3. Require the `ci:setup:minitest` task as a dependency of the `test` task:

[code]
# /Rakefile

# ...
Rrw::Application.load_tasks

# Require the reporter in your Rakefile, and ensure that ci:setup:minitest is a dependency of your minitest task:
require 'ci/reporter/rake/minitest'
task :test => 'ci:setup:minitest'
[/code]

4. Run `rake test`, and `test/reports/*.xml` should be generated!

[[Category:Ruby on Rails]]
[[Category:Testing]]