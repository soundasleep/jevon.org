---
layout: page
title:  "HTML syntax validation within Handlebars templates in Sublime Text 2"
author: jevon
date:   2014-01-15 18:02:05 +1300
---

To enable [[HTML]] syntax validation within [[Handlebars]] templates in [[Sublime Text 2]], follow similar instructions to http://stackoverflow.com/questions/5578472/amend-html-grammar-based-on-attributes-in-textmate.

That is, edit `%APPDATA%/Sublime Text 2/Packages/HTML/HTML.tmLanguage` and change:

[code xml]
		<dict>
			<key>begin</key>
			<string>(?:^s+)?(&lt;)((?i:script))b(?![^&gt;]*/&gt;)</string>
			<key>beginCaptures</key>
[/code]

to:

[code xml]
		<dict>
			<key>begin</key>
			<string>(?:^s+)?(&lt;)((?i:script))b(?!([^>]*text/x-handlebars[^&gt;]*|[^&gt;]*/>))</string>
			<key>beginCaptures</key>
[/code]

(I don't know if there is a better place to put this that won't be overridden by updates yet.)

[[Category:Sublime Text]]
[[Category:HTML]]
[[Category:IDEs]]
