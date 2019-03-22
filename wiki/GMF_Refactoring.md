---
layout: page
title:  GMF Refactoring
author: jevon
date:   2008-10-02 16:41:43 +13:00
tags:
  - GMF
redirect_from:
  - "/wiki/gmf_refactoring"
  - "/wiki/Gmf Refactoring"
  - "/wiki/gmf refactoring"
  - "/wiki/Gmf_Refactoring"
---

[GMF](GMF.md)

It's challenging to refactor in [GMF](GMF.md), but definitely not impossible. Here are some things to watch out for.

1. In many cases if you do your editing in the .gmfmap editor, the editor will automatically fix the other models to match your changes.
1. Moving around the order of tools in .gmftool will screw up your Tool mappings in the .gmfmap. You will have to probably reset them.
1. If you regenerate the .gmfgen directly onto itself, you will lose any _Open Diagram Behaviour_s. The easiest way to solve this (assuming you have the file stored on [SVN](SVN.md)) is to diff the new file with itself and re-apply the _Open Diagram Behaviour_s.
1. If you regenerate the .gmfgen directly onto itself, it will not rename the helper class names - for example, if you have an OperationNameEditPart, and later rename Operation to Foo, your code will still be referring to OperationNameEditPart. The easiest way to solve this is to copy your old .gmfgen, then generate the .gmfgen again manually - and then use diff between the two files to copy over elements such as _Contains Shortcuts To_, _Plugin Information_ and _Open Diagram Behaviour_.
1. When generating code, the generated code will _not_ delete any existing files. This may result in errors of files referring to missing model elements, or just extra baggage lying around.
1. When generating code, it may struggle to remove missing imports. The easiest solution for this is to select all of your generated code and press Shift-Ctrl-O to organise all the imports.
