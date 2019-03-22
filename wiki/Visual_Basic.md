---
layout: page
title:  "Visual Basic"
author: jevon
date:   2014-10-16 18:28:12 +1300
tags:   [Technology, Languages, Programming Snippets]
---

1. [Visual Basic Runtimes](Visual_Basic_Runtimes.md)

## Invalid Picture
If you are getting an _Run-time error 481: Invalid picture_ error by running code like this:

```
Printer.PaintPicture PictureBox1.Picture, 0, 0
Printer.EndDoc
```

My solution was to change it to:
```
Printer.PaintPicture PictureBox1.Image, 0, 0
Printer.EndDoc
```

 :s *shrug*

## Open a Browser Window
```
Declare Function ShellExecute Lib "shell32.dll" Alias "ShellExecuteA" (ByVal hwnd As Long, ByVal lpOperation As String, ByVal lpFile As String, ByVal lpParameters As String, ByVal lpDirectory As String, ByVal nShowCmd As Long) As Long

ShellExecute hwnd, "open", "http://www.jevon.org", vbNullString, vbNullString, conSwNormal
```

## Get the Filename/Directory From a String
```
Function GetDirectoryFromFn(fn As String)
    GetDirectoryFromFn = Mid(fn, 1, Len(fn) - InStr(StrReverse(fn), ""))
End Function

Function GetFilenameFromFn(fn As String)
    GetFilenameFromFn = Mid(fn, Len(fn) - InStr(StrReverse(fn), "") + 2)
End Function
```

Examples:
```
GetDirectoryFromFn("c:somewheredirectoryfile.ext") = "c:somewheredirectory"
GetFilenameFromFn("c:somewheredirectoryfile.ext") = "file.ext"
```

## Load Text File
This code will attempt to load a text file, read all the text in it, and return the text. This should only be used on actual text files, without any binary in the file. Also, you should implement some error checking for making sure the file exists before running the function, because although an error message will pop up, no text will be returned in case of an error. Also, the function doesn't include any error catching other than checking that the file exists. (If you want a function to do this, write it yourself :D)

```
Function LoadTextFile(fn As String) As String
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
End Function
```

## Bubble Sort
```
Function OrderSortElements(ByVal ElementsArray As Variant) As Variant
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
End Function
```

## Format File Size
This code will convert 1048576 bytes into 1.00 MB, etc.

```
Function FileSizeFormat(sz)
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
End Function
```

## Leading Zero
```
Function LeadingZero(szString, lngDecimals As Long, Optional szChar As String = "0") As String
LeadingZero = String(szChar, lngDecimals - Len(szString)) & szString
End Function
```

For example:
`HexVal = LeadingZero(Hex(15), 2)`
This will return a hex value "0F".
