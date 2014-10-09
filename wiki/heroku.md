---
layout: page
title:  "Heroku"
author: jevon
date:   2014-10-09 19:48:27 +1300
---

[[Heroku]] is a free cloud hosting service that lets you scale and things.

==Using MySQL with Rails applications on Heroku==

This is actually very difficult because by default Heroku overwrites your `database.yml`, you need to follow the instructions for <a href="https://devcenter.heroku.com/articles/cleardb#configuring-your-ruby-application-to-use-cleardb">Configuring your Ruby application to use ClearDB</a>:

[code]
heroku config | grep CLEARDB_DATABASE_URL
heroku config:set DATABASE_URL='mysql://example:example@us-cdbr-east.cleardb.com/heroku_db?reconnect=true'
[/code]

[[Category:Rails]]
[[Category:Ruby]]
[[Category:Hosting]]
[[Category:Web Development]]