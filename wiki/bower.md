---
layout: page
title:  "Bower"
author: jevon
date:   2014-03-24 16:58:53 +1300
---

[[Bower]] is a package manager, similar to [[npm]], but seems to be more about client side stuff.

==Registering and publishing a package on bower==

This is particularly complicated if you are <a href="https://github.com/bower/bower/issues/135">trying to fork an existing repository into a new Bower package</a>.

# Create your Github repository.
# Run `bower register <your-package-name> git://github.com/username/repository.git`
# Bower uses _[[Git]] tags_ to register new versions, so you need to create a new tag in order to correctly register the component.
# Run `git tag -a v3.0.1` and then `git push --tags` to create and push the tags to Github.
# You can now run `bower info <your-package-name>` to see the current version and tags available.
# Or install it with `bower install --save-dev <your-package-name>` in another project.

For example, my first Bower component: 

[[Category:Project management]]
[[Category:Javascript]]