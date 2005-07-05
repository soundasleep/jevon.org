---
layout: page
title:  "Converting Bases"
author: jevon
date:   2005-07-06 08:57:10 +1200
---

[[Articles]]

Here's an assortment of code to convert between different base systems. I have provided code in both [[Visual Basic]] and [[PHP]]. The original articles were quite old (written in 2002!) so this code may be quite outdated, but it still works.

==Decimal to Hexadecimal==
=Visual Basic=
[code]output = Hex(number)[/code]

=PHP=
[code]$output = sprintf("%x", $number);[/code]

==Hexadecimal to Decimal==
=Visual Basic=
[code]decimal = Val("&H" & hexnumber)[/code]

=PHP=
[code]sscanf($input, "%x", $decimal);[/code]

==Decimal to Binary==
=Visual Basic=
[code]For i = 7 To 0 Step -1
	If n >= 2 ^ i Then
		n = n - (2 ^ i)
		output = output & "1"
	Else
		output = output & "0"
	End If
Next[/code]

=PHP=
[code]$output = sprintf("%b", $number);[/code]

==Binary to Decimal==
=Visual Basic=
[code]For i = Len(bin) To 1 Step -1
	If Mid(bin, i, 1) = "1" Then
		n = n + (2 ^ (Len(bin) - i))
	End If
Next[/code]

=PHP=
[code]sscanf($input, "%b", $num);[/code]
----
[[Category:Article]]
[[Category:Todo]]