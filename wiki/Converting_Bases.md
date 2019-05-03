---
layout: page
title:  Converting Bases
author: jevon
date:   2005-07-06 08:57:10 +12:00
tags:
  - Article
  - Todo
redirect_from:
  - "/wiki/Converting Bases"
---

[Articles](Articles.md)

Here's an assortment of code to convert between different base systems. I have provided code in both [Visual Basic](Visual_Basic.md) and [PHP](PHP.md). The original articles were quite old (written in 2002!) so this code may be quite outdated, but it still works.

## Decimal to Hexadecimal
# Visual Basic
`output = Hex(number)`

# PHP
`$output = sprintf("%x", $number);`

## Hexadecimal to Decimal
# Visual Basic
`decimal = Val("&H" & hexnumber)`

# PHP
`sscanf($input, "%x", $decimal);`

## Decimal to Binary
# Visual Basic
```
For i = 7 To 0 Step -1
  If n >= 2 ^ i Then
    n = n - (2 ^ i)
    output = output & "1"
  Else
    output = output & "0"
  End If
Next
```

# PHP
`$output = sprintf("%b", $number);`

## Binary to Decimal
# Visual Basic
```
For i = Len(bin) To 1 Step -1
  If Mid(bin, i, 1) = "1" Then
    n = n + (2 ^ (Len(bin) - i))
  End If
Next
```

# PHP
`sscanf($input, "%b", $num);`
