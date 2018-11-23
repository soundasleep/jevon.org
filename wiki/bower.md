---
layout: page
title:  "Bower"
author: jevon
date:   2014-04-17 17:57:16 +1200
tags:   [Dependencies, Git, Web development, Javascript]
---

[Bower](bower.md) is a package manager, similar to [npm](npm.md) and [composer](composer.md), but seems to be more about client side stuff.

## Registering and publishing a package on bower

This is particularly complicated if you are <a href="https://github.com/bower/bower/issues/135">trying to fork an existing repository into a new Bower package</a>.

1. Create your Github repository.
1. Run `bower register <your-package-name> git://github.com/username/repository.git`
1. Bower uses _[Git](git.md) tags_ to register new versions, so you need to create a new tag in order to correctly register the component.
1. Run `git tag -a v3.0.1` and then `git push --tags` to create and push the tags to Github.
1. You can now run `bower info <your-package-name>` to see the current version and tags available.
1. Or install it with `bower install --save-dev <your-package-name>` in another project.

For example, my first Bower component:
