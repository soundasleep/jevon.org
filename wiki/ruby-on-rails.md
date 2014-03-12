---
layout: page
title:  "Ruby on Rails"
author: jevon
date:   2014-01-23 18:56:02 +1300
---

[[Ruby]]

==How I learnt Ruby on Rails==

Following the <a href="http://guides.rubyonrails.org/getting_started.html">Getting Started guide</a>:

# Don't install the [[Cygwin]] version of Ruby or Ruby-rails. They will not work because I think cygwin paths get in the way of generating temporary files for Javascript compilation: _Error: Cannot find module 'C:/cygdrive/c/DOCUME~1/Jevon/LOCALS~1/Temp/execjs20140124-6456-ws3la8.js' (in /usr/lib/ruby/gems/1.9.1/gems/turbolinks-2.2.0/lib/assets/javascripts/turbolinks.js.coffee)_
# Install Ruby 1.9.3 from <a href="http://rubyinstaller.org/downloads/">the Windows Installer package</a>
# Install the Ruby 1.9.3 devkit: <a href="http://rubyinstaller.org/downloads/">download the executable</a>, extract it somewhere, <a href="https://github.com/oneclick/rubyinstaller/wiki/Development-Kit#installation-instructions">follow the install instructions</a>
# Install rails: `gem install rails`

==Partial not rendering==

Make sure you use `<%= render 'form' %>`, not the non-printing form without equals `<% render 'form' %>`. I'm guessing this is a different render to `render text:` in a controller.

==Adding a new database field after generation==

Initial generation of a database table:

[code]
rails generate model User openid_identity:string created_at:date name:string
rake db:migrate
[/code]

<a href="http://stackoverflow.com/questions/4805836/how-do-i-add-a-field-after-ive-run-rails-generate-model-scaffold">Adding a new field</a> 'last_login':

[code]
rails generate migration add_last_login_to_users last_login:date
rake db:migrate
[/code]

[[Category:Ruby]]
[[Category:Rails]]
[[Category:Programming]]
[[Category:Web Development]]