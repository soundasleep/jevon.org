---
layout: page
title:  "Apache"
author: jevon
date:   2013-12-02 15:01:12 +1300
---

[[Apache]] is a web server.

# [[Installing SSL on Apache]]
# [[awstats]]

===configuration error: couldn't check user. check your authn provider!''' with [[Subversion]]===

This error can occur if you have digest authentication enabled to authenticate against [[Subversion]], but you haven't enabled the actual digest authentication mod, like so:

[code]LoadModule auth_digest_module /usr/lib/apache2/modules/mod_auth_digest.so[/code]

[[Category:Internet]]