---
layout: page
title:  Uploading via POST with PHP and CURL
author: jevon
date:   2007-11-09 10:11:17 +13:00
tags:
  - PHP
  - Article
  - Published Code
redirect_from:
  - "/wiki/uploading_via_post_with_php_and_curl"
  - "/wiki/Uploading Via Post With Php And Curl"
  - "/wiki/uploading via post with php and curl"
  - "/wiki/Uploading_Via_Post_With_Php_And_Curl"
---

[Articles](Articles.md) > [PHP](PHP.md)

It's really quite simple. Make sure you have the [CURL](curl.md) extension loaded and running. This example also adds support for cookies!

```
// use curl to post data to a form
$url = "http://www.something.com/post";
$params = array("id" => 1, "title" => "Foo Bar", "content" => "This is an example POST-submitted form."); // values to submit via POST
$cookies = "cookie_one=" . urlencode("cookie_value_one") . "; cookie_two=" . url_encode("cookie_value_two");  // optional

$curl = curl_init();
curl_setopt($curl, CURLOPT_URL, $url);
curl_setopt($curl, CURLOPT_POST, 1);
curl_setopt($curl, CURLOPT_HEADER, 1);
curl_setopt($curl, CURLOPT_POSTFIELDS, $params);
curl_setopt($curl, CURLOPT_RETURNTRANSFER, true);
curl_setopt($curl, CURLOPT_COOKIE, $cookies);  // optional
$content = curl_exec($curl);
```

You could also combine this with [Downloading HTTP Basic-Authenticated Pages with PHP and CURL](Downloading_HTTP_Basic-Authenticated_Pages_with_PHP_and_CURL.md).
