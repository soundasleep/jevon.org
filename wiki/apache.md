---
layout: page
title:  "Apache"
author: jevon
date:   2011-12-06 07:16:07 +1300
---

'''configuration error: couldn't check user. check your authn provider!''' with [[Subversion]]:

This error can occur if you have digest authentication enabled to authenticate against [[Subversion]], but you haven't enabled the actual digest authentication mod, like so:

[code]LoadModule auth_digest_module /usr/lib/apache2/modules/mod_auth_digest.so[/code]

[[Category:Todo]]
[[Category:Internet]]