---
layout: page
title:  "PHP"
author: jevon
date:   2005-01-01 00:00:00
---

[[PHP]] is a neat little web development language - http://www.php.net.

And here is some code that is completely disgusting:
[code]return (isset($this->values[$name]) && $this->values[$name]) ? $this->values[$name] : ($default ? $default : (isset($this->fields[$name]["default"]) ? $this->fields[$name]["default"] : (isset($this->fields[$name]["type"]) && $this->fields[$name]["type"] == "checkbox" ? ($this->fields[$name]["checked"] ? $this->fields[$name]["value"] : false) : (isset($this->fields[$name]["value"]) ? $this->fields[$name]["value"] : ""))));[/code]

See if you can spot the bug ;)

=php_mcrypt.dll=

If you get an error with PHP on [[IIS]]/[[Windows]] saying "The specified module could not be found" when you enable '''extension=php_mcrypt.dll''' in '''php.ini''', the solution is to download the '''libmcrypt.dll''' file from http://ftp.emini.dk/pub/php/win32/mcrypt/ and place this in your ''Windows System32 directory''. (No, the PHP extensions directory won't work.)

[[Category:Technology]]
[[Category:Programming Languages]]