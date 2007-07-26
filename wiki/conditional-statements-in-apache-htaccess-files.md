---
layout: page
title:  "Conditional Statements in Apache .htaccess Files"
author: jevon
date:   2007-06-14 09:48:11 +1200
---

==Problem==
I wanted to have only one '''.htaccess''' file for one site, but have it work differently in two different environments. (One being [[Apache]] 1.3, the other 2.0.)

==Solution==
By having a look at my [[Apache]] httpd.conf, I looked for a module that would most likely not be loaded on the remote host. In my case, I decided on '''mod_asapi.so'''. I then added the conditional statements like so:

[code]# Turn on register_globals on local machine (turned on by default remotely)
<IfModule isapi_module>
	php_flag register_globals 1
</IfModule>[/code]

If you wanted something which worked only on the other machine, you could just use the ! operator to negate the test.

[[Category:Programming]]
[[Category:Web]]
[[Category:Technology]]