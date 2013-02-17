---
layout: page
title:  "PHP"
author: jevon
date:   2013-02-17 20:41:09 +1300
---

[[Articles]]

[[PHP]] is a neat little web development language - http://www.php.net. Also see [[Pear]], [[Symfony]] and [[Drupal]].

# [[Downloading HTTP Basic-Authenticated Pages with PHP and CURL]]
# [[Uploading via POST with PHP and CURL]]
# [[Comparing Two SimpleXML Documents]]
# [[Installing PHP 5.2 on CentOS]]
# <a href="http://www.delicious.com/jevonwright/php" class="delicious">Other pages tagged as "php"</a>

And here is some code that is completely disgusting:
[code]return (isset($this->values[$name]) && $this->values[$name]) ? $this->values[$name] : ($default ? $default : 
(isset($this->fields[$name]["default"]) ? $this->fields[$name]["default"] : (isset($this->fields[$name]["type"]) 
&& $this->fields[$name]["type"] == "checkbox" ? ($this->fields[$name]["checked"] ? $this->fields[$name]["value"] : false) 
: (isset($this->fields[$name]["value"]) ? $this->fields[$name]["value"] : ""))));[/code]

See if you can spot the bug ;)

==php_mcrypt.dll==

If you get an error with PHP on [[IIS]]/[[Windows]] saying "The specified module could not be found" when you enable '''extension=php_mcrypt.dll''' in '''php.ini''', the solution is to download the '''libmcrypt.dll''' file from http://ftp.emini.dk/pub/php/win32/mcrypt/ and place this in your ''Windows System32 directory''. (No, the PHP extensions directory won't work.)

==How to turn off magic_quotes_gpc==

This option can't be changed with ini_set. With [[Apache]], you can turn this option off in .htaccess by:

[code]php_flag magic_quotes_gpc off[/code]

==Simple Template Matching==
[code]function template_compile($template, $data) {
	$out = $template;
	foreach ($data as $key => $value) {
		$out = str_replace("{" . $key . "}", $value, $out);
	}
	return $out;
}[/code]

==PHPSESSID is not working==
In [[PHP]] 5.3.0, they changed the default setting for "session.use_only_cookies" from "true" to "false". This means that passing the session ID in the URL will no longer work. This can be set with ''ini_set'':

[code]ini_set("session.use_only_cookies", false);[/code]

==Improving the speed of `fgets`==
If your script using <a href="http://php.net/fgets">`fgets`</a> is fairly slow, try reducing the size of your maximum line (`$length`). Reducing this by three orders of magnitude improved the speed of my script by about 50%-75%.

[[Category:Technology]]
[[Category:Languages]]
[[Category:PHP]]
[[Category:Programming Snippets]]