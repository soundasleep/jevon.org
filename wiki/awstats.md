---
layout: page
title:  "awstats"
author: jevon
date:   2013-12-02 15:01:25 +1300
---

[[awstats]] is a web statistics program.

==Apache Log Format==
If your Apache log config (in `/etc/apache2/apache.conf`) defines a log format like this:

[code conf]LogFormat "%v:%p %h %l %u %t "%r" %>s %O "%{Referer}i" "%{User-Agent}i"" vhost_combined[/code]

Then you need to modify the awstats.domain.conf LogFormat and HostAliases:

[code conf]LogFile="/var/log/apache2/other_vhosts_access.log"
LogFormat="%virtualname %host %other %logname %time1 %methodurl %code %bytesd %refererquote %uaquot"
HostAliases="localhost 127.0.0.1 jevon.org:80"[/code]

[[Category:Software]]
[[Category:Web]]