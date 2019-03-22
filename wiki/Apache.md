---
layout: page
title:  "Apache"
author: jevon
date:   2013-12-02 15:01:12 +1300
tags:   [Internet]
---

[Apache](Apache.md) is a web server.

1. [Installing SSL on Apache](Installing_SSL_on_Apache.md)
1. [awstats](awstats.md)

### configuration error: couldn't check user. check your authn provider!''' with [Subversion](Subversion.md)

This error can occur if you have digest authentication enabled to authenticate against [Subversion](Subversion.md), but you haven't enabled the actual digest authentication mod, like so:

`LoadModule auth_digest_module /usr/lib/apache2/modules/mod_auth_digest.so`
