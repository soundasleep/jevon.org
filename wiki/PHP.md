---
layout: page
title:  "PHP"
author: jevon
date:   2014-04-17 17:56:52 +1200
tags:   [Technology, Languages, PHP, Programming Snippets]
---

[Articles](Articles.md)

[PHP](PHP.md) is a neat little web development language - http://www.php.net. Also see [Pear](Pear.md), [Symfony](Symfony.md) and [Drupal](Drupal.md).

1. [Downloading HTTP Basic-Authenticated Pages with PHP and CURL](Downloading_HTTP_Basic-Authenticated_Pages_with_PHP_and_CURL.md)
1. [Uploading via POST with PHP and CURL](Uploading_via_POST_with_PHP_and_CURL.md)
1. [Comparing Two SimpleXML Documents](Comparing_Two_SimpleXML_Documents.md)
1. [Installing PHP 5.2 on CentOS](Installing_PHP_5.2_on_CentOS.md)
1. [PDT vs PHPEclipse vs PhpStorm](PDT_vs_PHPEclipse_vs_PhpStorm.md)
1. [Composer](Composer.md)
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

If you get an error with PHP on [IIS](iis.md)/[Windows](Windows.md) saying "The specified module could not be found" when you enable **extension=php_mcrypt.dll** in **php.ini**, the solution is to download the **libmcrypt.dll** file from http://ftp.emini.dk/pub/php/win32/mcrypt/ and place this in your _Windows System32 directory_. (No, the PHP extensions directory won't work.)

## How to turn off magic_quotes_gpc

This option can't be changed with ini_set. With [Apache](Apache.md), you can turn this option off in .htaccess by:

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
In [PHP](PHP.md) 5.3.0, they changed the default setting for "session.use_only_cookies" from "true" to "false". This means that passing the session ID in the URL will no longer work. This can be set with _ini_set_:

`ini_set("session.use_only_cookies", false);`

## Improving the speed of `fgets`
If your script using <a href="http://php.net/fgets">`fgets`</a> is fairly slow, try reducing the size of your maximum line (`$length`). Reducing this by three orders of magnitude improved the speed of my script by about 50%-75%.
