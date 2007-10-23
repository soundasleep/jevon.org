---
layout: page
title:  "Visual Basic"
author: jevon
date:   2007-10-24 12:51:19 +1300
---

==Invalid Picture==
If you are getting an ''Run-time error 481: Invalid picture'' error by running code like this:

[code]Printer.PaintPicture PictureBox1.Picture, 0, 0
Printer.EndDoc[/code]

My solution was to change it to:
[code]Printer.PaintPicture PictureBox1.Image, 0, 0
Printer.EndDoc[/code]

 :s *shrug*

==Open a Browser Window==
[code]Declare Function ShellExecute Lib "shell32.dll" Alias "ShellExecuteA" (ByVal hwnd As Long, ByVal lpOperation As String, ByVal lpFile As String, ByVal lpParameters As String, ByVal lpDirectory As String, ByVal nShowCmd As Long) As Long

ShellExecute hwnd, "open", "http://www.jevon.org", vbNullString, vbNullString, conSwNormal[/code]

==Get the Filename/Directory From a String==
[code]Function GetDirectoryFromFn(fn As String)
    GetDirectoryFromFn = Mid(fn, 1, Len(fn) - InStr(StrReverse(fn), "\"))
End Function

Function GetFilenameFromFn(fn As String)
    GetFilenameFromFn = Mid(fn, Len(fn) - InStr(StrReverse(fn), "\") + 2)
End Function[/code]

Examples:
[code]GetDirectoryFromFn("c:\somewhere\directory\file.ext") = "c:\somewhere\directory"
GetFilenameFromFn("c:\somewhere\directory\file.ext") = "file.ext"[/code]

==Load Text File==
This code will attempt to load a text file, read all the text in it, and return the text. This should only be used on actual text files, without any binary in the file. Also, you should implement some error checking for making sure the file exists before running the function, because although an error message will pop up, no text will be returned in case of an error. Also, the function doesn't include any error catching other than checking that the file exists. (If you want a function to do this, write it yourself :D)

[code]Function LoadTextFile(fn As String) As String
Dim z As Long, tmp1 As String
z = FreeFile
If Dir(fn) = "" Then MsgBox "Error: The file """ & fn & """ does not exist.", vbExclamation, "Error": Exit Function
Open fn For Input Access Read As #z
Do
    Line Input #z, tmp1
    tmp = tmp & tmp1 & vbCrLf
Loop Until EOF(z)
Close #z
LoadTextFile = tmp
End Function[/code]

==Bubble Sort==
[code]Function OrderSortElements(ByVal ElementsArray As Variant) As Variant
For n = UBound(ElementsArray) To 0 Step -1
    Do
        changes = 0
        For i = 0 To n - 1
            If ElementsArray(i) > ElementsArray(i + 1) Then
                temp = ElementsArray(i + 1)
                ElementsArray(i + 1) = ElementsArray(i)
                ElementsArray(i) = temp
                changes = changes + 1
            End If
        Next
    Loop While changes > 0
Next
OrderSortElements = ElementsArray
End Function[/code]

==Format File Size==
This code will convert 1048576 bytes into 1.00 MB, etc.

[code]Function FileSizeFormat(sz)
gb = 1024 ^ 3
Select Case Len(Format(sz / 1024, "#############0"))
    Case 0: t = Format(sz, "##,##0") & " bytes"
    Case 1: t = Format(sz / 1024, "0.00") & " KB"
    Case 2: t = Format(sz / 1024, "#0.0") & " KB"
    Case 3: t = Format(sz / 1024, "##0") & " KB"
    Case 4: t = Format(sz / 1048576, "0.00") & " MB"
    Case 5: t = Format(sz / 1048576, "#0.0") & " MB"
    Case 6: t = Format(sz / 1048576, "##0") & " MB"
    Case 7: t = Format(sz / gb, "0.00") & " GB"
    Case 8: t = Format(sz / gb, "#0.0") & " GB"
    Case 9, 10, 11, 12, 13: t = Format(sz / gb, "###,###,###,##0") & " GB"
    Case Else: t = Format(sz, "#,###,###,###,##0") & " bytes"
End Select
FileSizeFormat = t
End Function[/code]

==Leading Zero==
[code]Function LeadingZero(szString, lngDecimals As Long, Optional szChar As String = "0") As String
LeadingZero = String(szChar, lngDecimals - Len(szString)) & szString
End Function[/code]

For example:
[code]HexVal = LeadingZero(Hex(15), 2)[/code]
This will return a hex value "0F".

[[Category:Technology]]
[[Category:Languages]]
[[Category:Programming Snippets]]