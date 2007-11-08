---
layout: page
title:  "Uploading via POST with PHP and CURL"
author: jevon
date:   2007-11-09 10:11:17 +1300
---

[[Articles]] > [[PHP]]

It's really quite simple. Make sure you have the [[CURL]] extension loaded and running. This example also adds support for cookies!

[code]// use curl to post data to a form
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
$content = curl_exec($curl);[/code]

You could also combine this with [[Downloading HTTP Basic-Authenticated Pages with PHP and CURL]].

[[Category:PHP]]
[[Category:Article]]
[[Category:Published Code]]