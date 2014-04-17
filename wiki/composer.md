---
layout: page
title:  "Composer"
author: jevon
date:   2014-04-17 17:57:27 +1200
---

[[PHP]]

<a href="https://getcomposer.org/">Composer</a> is a package management software similar to [[bower]] or [[npm]].

==The requested package could not be found in any version, there may be a typo in the package name.==

I got this error while trying to install a forked package.

# Check that the package `composer.json` is referencing the new package name and GitHub URL everywhere.
# Check that you have pushed your changes to Github.
# Check that you have tagged and pushed your tag to Github; e.g. `git tag 0.1.3 && git push --tags`.
# Try uploading the package to <a href="https://packagist.org/">Packagist</a>, their help messages are more informative than composer's.

Another option, rather than using [[Packagist]], is to specify a VCS directly in your project's `composer.json`:

[code]
{
  "repositories": [{
    "type": "vcs",
    "url": "https://github.com/soundasleep/html5lib-php"
  }]
}
[/code]

[[Category:PHP]]