---
layout: page
title:  awstats
author: jevon
date:   2013-12-02 21:00:32 +13:00
tags:
  - Software
  - Web
---

[awstats](awstats.md) is a web statistics program.

1. <a href="https://help.ubuntu.com/community/AWStats">Installing awstats on Ubuntu 12.04</a>

## How I install awstats

1. Based off the <a href="https://help.ubuntu.com/community/AWStats">Ubuntu awstats wiki page</a>. First install packages:
```
sudo apt-get install awstats libnet-ip-perl libnet-dns-perl
```
1. Edit /etc/awstats/awstats.conf, modify `LogFile` to merge archived data, `LogFormat` to use [Apache](apache.md) log format (see below), and `LoadPlugin="ipv6"` :
```
LogFile="perl /usr/share/awstats/tools/logresolvemerge.pl /var/log/apache2/other_vhosts_access.log /var/log/apache2/other_vhosts_access.log.1 /var/log/apache2/other_vhosts_access.log.2.gz |"
```
1. Create a crontab in /root/crontab to set world-readable permissions to your log files (otherwise you have to run awstats as root):
```
# every hour at 0:17 every day, fix /var/log/apache2 permissions for awstats
17 */1 * * * chmod a+r /var/log/apache2/* > /var/log/apache2/fix_permissions.log 2>&1
```
1. Create a folder to store generated awstats HTML:
```
mkdir /var/www/path/to/awstats
chmod a+rw /var/www/path/to/awstats (or perhaps chown user /var/www/path/to/awstats)
```
1. Create a [bash](bash.md) script to update awstats and generate HTML:
```
!/bin/bash

perl /usr/lib/cgi-bin/awstats.pl -config=mydomain.ext -update -showcorrupted
perl /usr/share/awstats/tools/awstats_buildstaticpages.pl -config=mydomain.ext -dir=/var/www/path/to/awstats -awstatsprog=/usr/lib/cgi-bin/awstats.pl -showcorrupted
```
1. Set up a crontab job to execute this script
1. Configure [Apache](apache.md) to serve awstats with appropriate `Require: valid-user` permissions as necessary.

## Apache Log Format
If your [Apache](apache.md) log config (in `/etc/apache2/apache2.conf`) defines a log format like this:

```
LogFormat "%v:%p %h %l %u %t "%r" %>s %O "%{Referer}i" "%{User-Agent}i"" vhost_combined
```

Then you need to modify the awstats.domain.conf LogFormat and HostAliases:

```
LogFile="/var/log/apache2/other_vhosts_access.log"
LogFormat="%virtualname %host %other %logname %time1 %methodurl %code %bytesd %refererquote %uaquot"
HostAliases="localhost 127.0.0.1 jevon.org:80"
```
