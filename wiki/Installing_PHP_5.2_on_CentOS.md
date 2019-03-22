---
layout: page
title:  Installing PHP 5.2 on CentOS
author: jevon
date:   2010-03-23 10:55:48 +13:00
tags:
  - Articles
redirect_from:
  - "/wiki/Installing PHP 5.2 on CentOS"
---

[Articles](Articles.md) > [Linux](Linux.md)

I had a problem where <a href="http://code.google.com/p/iaml/wiki/InstallationPlatform#Installing_PHP">I needed to install</a> [PHP](PHP.md) 5.2 on a CentOS system, but by default, <a href="http://www.freshblurbs.com/install-php-5-2-centos-5-2-using-yum">CentOS only supports up to PHP 5.1.6</a>.

<a href="http://www.freshblurbs.com/install-php-5-2-centos-5-2-using-yum#comment-403">As posted here</a>, one solution is to enable the CentOS testing server:

[quote]To enable centos-dev, you need to create
/etc/yum.repos.d/centos-test.repo and enter following lines in it:

```
[c5-testing]
name=CentOS-5 Testing 
baseurl=http://dev.centos.org/centos/5/testing/$basearch/
enabled=1
gpgcheck=1
gpgkey=http://dev.centos.org/centos/RPM-GPG-KEY-CentOS-testing
```[/quote]
