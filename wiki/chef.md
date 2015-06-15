---
layout: page
title:  "Chef"
author: jevon
date:   2014-08-11 20:22:44 +1200
---

[[Chef]] is similar to [[Puppet]], an open source server configuration manager thing.

# <a href="http://gettingstartedwithchef.com/first-steps-with-chef.html">Getting started with Chef</a> (excellent tutorial)
# <a href="https://github.com/applicationsonline/librarian-chef" class="github">librarian-chef</a> (manage `Cheffile`s rather than manually managing a repository of download cookbooks)

==File /var/www exists, but is a directory==

You can get this error if you are trying to load something from `COOKBOOK/files/default/phpinfo.php` into `/var/www/phpinfo.php` using <a href="http://docs.getchef.com/resource_cookbook_file.html">`cookbook_file`</a>:

[code ruby]
cookbook_file "phpinfo.php" do
  path "/var/www"
end
[/code]

The problem is that you are trying to replace a directory with a file. You should be using `path "/var/www/phpinfo.php"` instead, that way it will just replace the file.

==had an error: LoadError: cannot load such file -- mysql==
==could not find recipe ruby for cookbook mysql==

If you are getting this while trying to execute `mysql_database()`, then you may not be loading the `database::mysql` recipe in your recipe.

[[Category:Chef]]