---
layout: page
title:  "awstats"
author: jevon
date:   2013-12-02 21:00:32 +1300
---

[[awstats]] is a web statistics program.

# <a href="https://help.ubuntu.com/community/AWStats">Installing awstats on Ubuntu 12.04</a>

==How I install awstats==

# Based off the <a href="https://help.ubuntu.com/community/AWStats">Ubuntu awstats wiki page</a>. First install packages:
[code]
sudo apt-get install awstats libnet-ip-perl libnet-dns-perl
[/code]
# Edit /etc/awstats/awstats.conf, modify `LogFile` to merge archived data, `LogFormat` to use [[Apache]] log format (see below), and `LoadPlugin="ipv6"` :
[code]
LogFile="perl /usr/share/awstats/tools/logresolvemerge.pl /var/log/apache2/other_vhosts_access.log /var/log/apache2/other_vhosts_access.log.1 /var/log/apache2/other_vhosts_access.log.2.gz |"
[/code]
# Create a crontab in /root/crontab to set world-readable permissions to your log files (otherwise you have to run awstats as root):
[code]
# every hour at 0:17 every day, fix /var/log/apache2 permissions for awstats
17 */1 * * * chmod a+r /var/log/apache2/* > /var/log/apache2/fix_permissions.log 2>&1
[/code]
# Create a folder to store generated awstats HTML:
[code]
mkdir /var/www/path/to/awstats
chmod a+rw /var/www/path/to/awstats (or perhaps chown user /var/www/path/to/awstats)
[/code]
# Create a [[bash]] script to update awstats and generate HTML:
[code]
!/bin/bash

perl /usr/lib/cgi-bin/awstats.pl -config=mydomain.ext -update -showcorrupted
perl /usr/share/awstats/tools/awstats_buildstaticpages.pl -config=mydomain.ext -dir=/var/www/path/to/awstats -awstatsprog=/usr/lib/cgi-bin/awstats.pl -showcorrupted
[/code]
# Set up a crontab job to execute this script
# Configure [[Apache]] to serve awstats with appropriate `Require: valid-user` permissions as necessary.

==Apache Log Format==
If your [[Apache]] log config (in `/etc/apache2/apache2.conf`) defines a log format like this:

[code conf]LogFormat "%v:%p %h %l %u %t "%r" %>s %O "%{Referer}i" "%{User-Agent}i"" vhost_combined[/code]

Then you need to modify the awstats.domain.conf LogFormat and HostAliases:

[code conf]LogFile="/var/log/apache2/other_vhosts_access.log"
LogFormat="%virtualname %host %other %logname %time1 %methodurl %code %bytesd %refererquote %uaquot"
HostAliases="localhost 127.0.0.1 jevon.org:80"[/code]

[[Category:Software]]
[[Category:Web]]