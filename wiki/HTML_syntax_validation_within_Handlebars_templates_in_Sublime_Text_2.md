---
layout: page
title:  HTML syntax validation within Handlebars templates in Sublime Text 2
author: jevon
date:   2014-01-15 18:37:23 +13:00
tags:
  - Sublime Text
  - HTML
  - IDEs
redirect_from:
  - "/wiki/HTML syntax validation within Handlebars templates in Sublime Text 2"
---

To enable [HTML](html.md) syntax validation within [Handlebars](handlebars.md) templates in [Sublime Text 2](Sublime_Text_2.md), follow similar instructions to http://stackoverflow.com/questions/5578472/amend-html-grammar-based-on-attributes-in-textmate.

```
<body>  
	<script type="text/x-handlebars" data-template-name="todos">
		<section id="todoapp">
		<!-- ... -->
		</section>
	</script>
</body>
```

Even with ST2 plugins such as <a href="https://github.com/nrw/sublime-text-handlebars">sublime-text-handlebars</a>, the HTML code still would not be presented as HTML (and you had to change the syntax of the file to Handlebars, removing ALL HTML syntax validation). Ideally we would keep the HTML file syntax as HTML.

Edit `%APPDATA%/Sublime Text 2/Packages/HTML/HTML.tmLanguage` and change:

```
<dict>
			<key>begin</key>
			<string>(?:^s+)?(&lt;)((?i:script))b(?![^&gt;]*/&gt;)</string>
			<key>beginCaptures</key>
```

to:

```
<dict>
			<key>begin</key>
			<string>(?:^s+)?(&lt;)((?i:script))b(?!([^>]*text/x-handlebars[^&gt;]*|[^&gt;]*/>))</string>
			<key>beginCaptures</key>
```

The change will be instant; to see if it works, try commenting out a block (Ctrl-/) within a `script` tag. If Sublime Text thinks it is currently in HTML mode, they will be wrapped with HTML comments; otherwise Javascript comments.

(I don't know if there is a better place to put this that won't be overridden by updates yet.)
