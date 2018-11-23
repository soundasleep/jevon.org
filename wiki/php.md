---
layout: page
title:  "PHP"
author: jevon
date:   2014-04-17 17:56:52 +1200
tags:   [Technology, Languages, PHP, Programming Snippets]
---

[Articles](articles.md)

[PHP](php.md) is a neat little web development language - http://www.php.net. Also see [Pear](pear.md), [Symfony](symfony.md) and [Drupal](drupal.md).

1. [Downloading HTTP Basic-Authenticated Pages with PHP and CURL](downloading-http-basic-authenticated-pages-with-php-and-curl.md)
1. [Uploading via POST with PHP and CURL](uploading-via-post-with-php-and-curl.md)
1. [Comparing Two SimpleXML Documents](comparing-two-simplexml-documents.md)
1. [Installing PHP 5.2 on CentOS](installing-php-5-2-on-centos.md)
1. [PDT vs PHPEclipse vs PhpStorm](pdt-vs-phpeclipse-vs-phpstorm.md)
1. [Composer](composer.md)
1. <a href="http://www.delicious.com/jevonwright/php" class="delicious">Other pages tagged as "php"</a>

And here is some code that is completely disgusting:
```
return (isset($this->values[$name]) && $this->values[$name]) ? $this->values[$name] : ($default ? $default : 
(isset($this->fields[$name]["default"]) ? $this->fields[$name]["default"] : (isset($this->fields[$name]["type"]) 
&& $this->fields[$name]["type"] == "checkbox" ? ($this->fields[$name]["checked"] ? $this->fields[$name]["value"] : false) 
: (isset($this->fields[$name]["value"]) ? $this->fields[$name]["value"] : ""))));
```

See if you can spot the bug ;)

## php_mcrypt.dll

If you get an error with PHP on [IIS](iis.md)/[Windows](windows.md) saying "The specified module could not be found" when you enable **extension=php_mcrypt.dll** in **php.ini**, the solution is to download the **libmcrypt.dll** file from http://ftp.emini.dk/pub/php/win32/mcrypt/ and place this in your _Windows System32 directory_. (No, the PHP extensions directory won't work.)

## How to turn off magic_quotes_gpc

This option can't be changed with ini_set. With [Apache](apache.md), you can turn this option off in .htaccess by:

`php_flag magic_quotes_gpc off`

## Simple Template Matching
```
function template_compile($template, $data) {
	$out = $template;
	foreach ($data as $key => $value) {
		$out = str_replace("{" . $key . "}", $value, $out);
	}
	return $out;
}
```

## PHPSESSID is not working
In [PHP](php.md) 5.3.0, they changed the default setting for "session.use_only_cookies" from "true" to "false". This means that passing the session ID in the URL will no longer work. This can be set with _ini_set_:

`ini_set("session.use_only_cookies", false);`

## Improving the speed of `fgets`
If your script using <a href="http://php.net/fgets">`fgets`</a> is fairly slow, try reducing the size of your maximum line (`$length`). Reducing this by three orders of magnitude improved the speed of my script by about 50%-75%.
