---
layout: page
title:  Javascript
author: jevon
date:   2014-06-17 16:57:46 +12:00
tags:
  - Languages
  - Programming Snippets
  - Technology
  - Javascript
redirect_from:
  - "/wiki/javascript"
---

Also see [Coffeescript](coffeescript.md).

1. <a href="http://journals.jevon.org/users/jevon-phd/entry/19924">Block Scope in Javascript</a>
1. [Grunt](grunt.md)
1. [EmberJS](emberjs.md)
1. [Bower](bower.md)
1. [Chai](chai.md) and [Mocha](mocha.md)
1. [Leaflet](leaflet.md)
1. [Selectize](selectize.md) and [Select2](select2.md)

Some (very old) Javascript snippets:

## Confirm Page Exit
To pop up a dialog saying "Are you sure you want to navigate away from this page? Press OK to continue, or Cancel to stay on the current page." when you try to leave the page, you can use this:
```
<script type="text/javascript">
    function confirmExit() { return "You might lose your changes if you leave this page."; }
</script>

<body onbeforeunload="return confirmExit()"> ... </body>
```

This is an [Internet Explorer](internet-explorer.md)-only feature (<a href="http://msdn.microsoft.com/workshop/author/dhtml/reference/events/onbeforeunload.asp">not in any public standard</a>) but [Firefox](firefox.md) has implemented it as well.

## Select All Checkboxes
To select all the checkbox elements in a &lt;select&gt; form (until it reaches an element with a name of 'select_all'):
```
function selectAll(selectelem) {
	var form = selectelem.form;
	var i = 0;
	while (form[i].type == 'checkbox' && form[i].name != 'select_all') {
		form[i].checked = selectelem.checked;
		i++;
	}
}
```

## Check E-mail Validity
A simple check to check the validity of e-mail addresses (I think it works for most cases):
```
function check_email(obj) {
	x = new RegExp("w+@w+.w");
	if (x.test(obj.value)) {
		return true;
	} else {
		alert("Your value of "" + obj.value + "" is not a valid e-mail address.");
		return false;
	}
}
```

## Print Specific Content Within a Page
You can either just go within a normal page to print out the entire page:
`window.print()`

Or, you could be clever and create an IFRAME to print from:
```
var c = document.createElement("IFRAME");
c.innerHTML = "text you want to print";
// you may want to apply styles here as well
c.contentWindow.focus();
c.contentWindow.print();
document.body.removeChild(c);
```

Note that this can reduce accessibility.

## Inline Associative Array Initialisation

`var arr = {"key" : "value", "key2" : "value2"}; `
