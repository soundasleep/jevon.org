---
layout: page
title:  "HTML syntax validation within Handlebars templates in Sublime Text 2"
author: jevon
date:   2014-01-15 18:06:42 +1300
---

To enable [[HTML]] syntax validation within [[Handlebars]] templates in [[Sublime Text 2]], follow similar instructions to http://stackoverflow.com/questions/5578472/amend-html-grammar-based-on-attributes-in-textmate.

[code html]
<body>  
	<script type="text/x-handlebars" data-template-name="todos">
		<section id="todoapp">
		<!-- ... -->
		</section>
	</script>
</body>
[/code]

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

The change will be instant; to see if it works, try commenting out a block (Ctrl-/) within a `script` tag. If Sublime Text thinks it is currently in HTML mode, they will be wrapped with HTML comments; otherwise Javascript comments.

(I don't know if there is a better place to put this that won't be overridden by updates yet.)

[[Category:Sublime Text]]
[[Category:HTML]]
[[Category:IDEs]]
