---
layout: page
title:  Downloading HTTP Basic-Authenticated Pages with PHP and CURL
author: jevon
date:   2007-11-09 10:11:09 +13:00
tags:
  - PHP
  - Article
  - Published Code
redirect_from:
  - "/wiki/Downloading HTTP Basic-Authenticated Pages with PHP and CURL"
---

[Articles](Articles.md) > [PHP](PHP.md)

It's really quite simple. Make sure you have the [CURL](curl.md) extension loaded and running.

```
// use curl to get basic authentication
$url = "https://api.del.icio.us/v1/posts/all?";
$username = "delicious.username";
$password = "delicious.password";

$curl = curl_init();
curl_setopt($curl, CURLOPT_URL, $url);
curl_setopt($curl, CURLOPT_RETURNTRANSFER, true);
curl_setopt($curl, CURLOPT_USERPWD, $username . ":" . $password);
$content = curl_exec($curl);
```

If you're downloading via [HTTPS](https.md), you may need to enable **CURLOPT_SSL_VERIFYPEER**. You can also combine this with [Uploading via POST with PHP and CURL](Uploading_via_POST_with_PHP_and_CURL.md).
