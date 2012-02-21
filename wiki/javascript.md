---
layout: page
title:  "Javascript"
author: jevon
date:   2012-02-22 09:17:38 +1300
---

Some Javascript snippets:

# <a href="http://journals.jevon.org/users/jevon-phd/entry/19924">Block Scope in Javascript</a>

==Confirm Page Exit==
To pop up a dialog saying "Are you sure you want to navigate away from this page? Press OK to continue, or Cancel to stay on the current page." when you try to leave the page, you can use this:
[code]<script type="text/javascript">
    function confirmExit() { return "You might lose your changes if you leave this page."; }
</script>

<body onbeforeunload="return confirmExit()"> ... </body>[/code]

This is an [[Internet Explorer]]-only feature (<a href="http://msdn.microsoft.com/workshop/author/dhtml/reference/events/onbeforeunload.asp">not in any public standard</a>) but [[Firefox]] has implemented it as well.

==Select All Checkboxes==
To select all the checkbox elements in a &lt;select&gt; form (until it reaches an element with a name of 'select_all'):
[code]function selectAll(selectelem) {
	var form = selectelem.form;
	var i = 0;
	while (form[i].type == 'checkbox' && form[i].name != 'select_all') {
		form[i].checked = selectelem.checked;
		i++;
	}
}[/code]

==Check E-mail Validity==
A simple check to check the validity of e-mail addresses (I think it works for most cases):
[code]function check_email(obj) {
	x = new RegExp("\\w+@\\w+\\.\\w");
	if (x.test(obj.value)) {
		return true;
	} else {
		alert("Your value of \"" + obj.value + "\" is not a valid e-mail address.");
		return false;
	}
}[/code]

==Print Specific Content Within a Page==
You can either just go within a normal page to print out the entire page:
[code]window.print()[/code]

Or, you could be clever and create an IFRAME to print from:
[code]var c = document.createElement("IFRAME");
c.innerHTML = "text you want to print";
// you may want to apply styles here as well
c.contentWindow.focus();
c.contentWindow.print();
document.body.removeChild(c);[/code]

Note that this can reduce accessibility.

==Inline Associative Array Initialisation==

[code]var arr = {"key" : "value", "key2" : "value2"}; [/code]

[[Category:Languages]]
[[Category:Programming Snippets]]
[[Category:Technology]]