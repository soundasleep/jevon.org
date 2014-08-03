---
layout: page
title:  "Chef"
author: jevon
date:   2014-08-03 22:06:03 +1200
---

[[Chef]] is similar to [[Puppet]], an open source server configuration manager thing.

==File /var/www exists, but is a directory==

You can get this error if you are trying to load something from `COOKBOOK/files/default/phpinfo.php` into `/var/www/phpinfo.php` using `cookbook_file`:

```ruby
cookbook_file "phpinfo.php" do
  path "/var/www"
end
```

The problem is that you are trying to replace a directory with a file. You should be using `path "/var/www/phpinfo.php"` instead, that way it will just replace the file.

[[Category:Chef]]