---
layout: page
title:  "Ruby on Rails"
author: jevon
date:   2015-06-09 21:12:08 +1200
tags:   [Ruby, Rails, Programming, Web Development]
---

[Ruby](ruby.md)

1. [Rake](rake.md)
1. [Google OAuth2 with Ruby on Rails](google-oauth2-with-ruby-on-rails.md)
1. [Using Capybara with Minitest for Integration Tests in Rails 4](using-capybara-with-minitest-for-integration-tests-in-rails-4.md)
1. <a href="http://stackoverflow.com/a/1829515/39531">Loading `seeds.rb` data into test database through `rake test`</a>
1. <a href="http://stackoverflow.com/questions/11354656/error-error-error-installing-capybara-webkit">Installing capybara-webkit on Ubuntu</a>
1. [Enabling Jenkins support with Ruby on Rails tests](enabling-jenkins-support-with-ruby-on-rails-tests.md)
1. <a href="https://github.com/ci-reporter/ci_reporter_minitest">Testing reports with Rails 4 and Minitest</a> (just follow the instructions as is)

## How I learnt Ruby on Rails

Following the <a href="http://guides.rubyonrails.org/getting_started.html">Getting Started guide</a>:

1. Don't install the [Cygwin](cygwin.md) version of Ruby or Ruby-rails. They will not work because I think cygwin paths get in the way of generating temporary files for Javascript compilation: _Error: Cannot find module 'C:/cygdrive/c/DOCUME~1/Jevon/LOCALS~1/Temp/execjs20140124-6456-ws3la8.js' (in /usr/lib/ruby/gems/1.9.1/gems/turbolinks-2.2.0/lib/assets/javascripts/turbolinks.js.coffee)_
1. Install Ruby 1.9.3 from <a href="http://rubyinstaller.org/downloads/">the Windows Installer package</a>
1. Install the Ruby 1.9.3 devkit: <a href="http://rubyinstaller.org/downloads/">download the executable</a>, extract it somewhere, <a href="https://github.com/oneclick/rubyinstaller/wiki/Development-Kit#installation-instructions">follow the install instructions</a>
1. Install rails: `gem install rails`

## SSL_connect returned=1 errno=0 state=SSLv3 read server certificate B: certificate verify failed

On [Windows](windows.md), this error occurs because the Ruby on Rails install does not come with a server certificate package. As per <a href="http://stackoverflow.com/a/16134586/39531">this StackOverflow answer</a>:

1. Download http://curl.haxx.se/ca/cacert.pem into `C:Railscacert.pem`
1. Go to your Computer -> Advanced Settings -> Environment Variables
1. Create a new System Variable: `SSL_CERT_FILE`=`C:Railscacert.pem`

Close all your command prompts, including your `rails server`, and open up a new `irb` command prompt to test that it works:

```
$irb> require 'open-uri'
$irb> open('https://www.gmail.com')
```

## Partial not rendering

Make sure you use `<%= render 'form' %>`, not the non-printing form without equals `<% render 'form' %>`. I'm guessing this is a different render to `render text:` in a controller.

## Adding a new database field after generation

Initial generation of a database table:

```
rails generate model User openid_identity:string created_at:date name:string
rake db:migrate
```

<a href="http://stackoverflow.com/questions/4805836/how-do-i-add-a-field-after-ive-run-rails-generate-model-scaffold">Adding a new field</a> 'last_login':

```
rails generate migration add_last_login_to_users last_login:date
rake db:migrate
```

## Could not find generator `monban:scaffold`

The generators were moved into a separate Gem, <a href="https://github.com/halogenandtoast/monban-generators">monban-generators</a> - add this to your Gemfile.

## RuntimeError: @controller is nil: make sure you set it in your test's setup method.

Are you trying to write an integration test in `test/integration/foo_test.rb`? Make sure that you are using `ActionDispatch::IntegrationTest` as your test superclass, rather than `ActionController::TestCase`:

```
require 'test_helper'

class FooTest < ActionDispatch::IntegrationTest
  def setup
  ...
```

## Loading additional autoload paths

In your `config/application.rb` (note everything within `app/**/*` should be autoloaded anyway!):

```
# load additional paths
    config.autoload_paths += Dir["#{config.root}/custom/services/**/"]
```

## Running a single Rspec file

```
$ rspec spec/games/playable_spec.rb --require rails_helper
```
