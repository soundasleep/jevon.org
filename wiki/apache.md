---
layout: page
title:  "Apache"
author: jevon
date:   2013-01-07 03:48:48 +1300
---

'''configuration error: couldn't check user. check your authn provider!''' with [[Subversion]]:

This error can occur if you have digest authentication enabled to authenticate against [[Subversion]], but you haven't enabled the actual digest authentication mod, like so:

[code]LoadModule auth_digest_module /usr/lib/apache2/modules/mod_auth_digest.so[/code]

==Awstats==
If your Apache log config (in `/etc/apache2/apache.conf`) defines a log format like this:

[code conf]LogFormat "%v:%p %h %l %u %t "%r" %>s %O "%{Referer}i" "%{User-Agent}i"" vhost_combined[/code]

Then you need to modify the awstats.domain.conf LogFormat and HostAliases:

[code conf]LogFile="/var/log/apache2/other_vhosts_access.log"
LogFormat="%virtualname %host %other %logname %time1 %methodurl %code %bytesd %refererquote %uaquot"
HostAliases="localhost 127.0.0.1 jevon.org:80"[/code]

[[Category:Internet]]