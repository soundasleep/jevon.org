---
layout: page
title:  "Ruby"
author: jevon
date:   2015-06-09 21:11:07 +1200
---

[[Ruby]] is a programming language which is used as the basis of [[Ruby on Rails]].

# [[Rake]]

==ERROR:  While executing gem ... (Gem::RemoteFetcher::FetchError) too many connection resets ==

I was getting this error when trying to install the gem https://au-m.rubygems.org/quick/Marshal.4.8/turbolinks-2.3.0.gemspec.rz. It looks like it was <a href="http://help.rubygems.org/discussions/problems/18728-unable-to-install-gems-in-australia">a temporary issue with the server</a>, and running `gem install turbolinks -v '2.3.0' --source "http://production.s3.rubygems.org"` didn't make any difference.

One workaround is to download the gem file manually (e.g. http://au-m.rubygems.org/gems/turbolinks-2.3.0.gem --> http://production.s3.rubygems.org/gems/turbolinks-2.3.0.gem) and then `gem install turbolinks-2.3.0.gem`.

==Running a single Rspec file==

[code]
$ rspec spec/games/playable_spec.rb --require rails_helper
[/code]

[[Category:Ruby]]