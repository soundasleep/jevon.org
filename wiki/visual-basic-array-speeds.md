---
layout: page
title:  "Visual Basic Array Speeds"
author: jevon
date:   2005-07-03 19:15:08 +1200
tags:   [Article]
---

[Articles](articles.md)

An interesting concept is how to store a dynamic array. The best dynamic array would optimally take the least amount of space, be the fastest array possible, and be as efficient as possible. I quickly did an investigation in 2003 into the speed of creating dynamic arrays a different number of ways, all in [Visual Basic](visual-basic.md) 6.

My results for inserting 25000 new strings into arrays were as follows:

**Fixed size array:** _0.148 sec_
**Stepped dynamic array:** 0.164 sec
**Collection:** 0.234 sec
**Incremental dynamic array:** 1.664 sec

An "incremental" dynamic array was one which is redimensioned every new item, and a "stepped" dynamic array is one whose size doubles when it's appropriate. Experience tells that the stepped version is significantly faster than the incremental version; in practice, it may be better to only increase the array size by 10-30% every step, to reduce memory use.

I did not use any wild optimisations, and did not take into account other factors like the actual memory size used. It's interesting to see that using a Collection, a really flexible array type that can store Objects and Classes, is quite fast (not as fast as the array methods of course, but that's to be expected).

The code I used for each benchmark is provided below.

```
Function BenchmarkArray(n)
Dim b()
ReDim b(0 To n)
For i = 0 To UBound(b)
    b(i) = "some string"
Next
End Function

Function BenchmarkCollection(n)
Dim c As Collection
Set c = New Collection
For i = 0 To n
    c.Add "some string"
Next
End Function

Function BenchmarkDynamic(n)
Dim b()
ReDim b(0)
For i = 0 To n
    ReDim Preserve b(i)
    b(i) = "some string"
Next
End Function

Function BenchmarkDynamic2(n)
Dim b()
ReDim b(0)
For i = 0 To n
    If i > UBound(b) Then
        ReDim Preserve b(UBound(b) * 2 + 1)
    End If
    b(i) = "some string"
Next
End Function
```
----
