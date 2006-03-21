---
layout: page
title:  "ICQ Contacts in XML"
author: jevon
date:   2006-03-21 22:26:06 +1300
---

I've written a quick and dirty hack, which will allow you to retrieve some basic contact information about a user in ICQ via [[XML]]. It takes this page:
<blockquote>http://www.icq.com/whitepages/about_me.php?uin=41466024</blockquote>
And returns this: 
<blockquote>http://www.jevon.org/old/icqxml.php?uin=41466024 (click to view the [[XML]])</blockquote>
You can use this service for whatever you like. This may break any time in the future, and it's supplied with no warranties, blah blah. Also, it probably won't work with weird character sets.

An alternative way to access the information is to fill in this form:
<form class="siteForm" action="/old/icqxml.php" method="get">UIN: <input type="text" name="uin" value="41466024" size="20">
<input type="submit"></form>
'''Note:''' If you request results too often, the site will temporarily blacklist you and you won't be able to get any for a while. :(

[[Category:Article]]
[[Category:Todo]]