---
layout: page
title:  OpenID
author: jevon
date:   2010-04-23 11:33:41 +12:00
tags:
  - Technology
---

<a href="http://openid.net">OpenID</a> is a distributed authentication (but not trust) technology, implemented by <a href="http://www.livejournal.com">LiveJournal</a> and other providers.

1. <a href="http://dev.aol.com/article/2007/openid_primer_for_php">A Primer for OpenID with PHP</a>

## error:Unknown mode
I got this error while trying to authenticate [OpenID](OpenID.md) with the LiveJournal server.

It turns out the problem is that in the <a href="http://openid.net/specs/openid-authentication-1_1.html#mode_check_authentication">(poorly laid-out) specs</a>, the **check_authentication** step needs to be provided as **POST**, not **GET**. (<a href="http://groups.google.com/group/joid-dev/msg/069f1fc4b00a692c">Source</a>)
