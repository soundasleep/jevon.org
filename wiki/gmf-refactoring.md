---
layout: page
title:  "GMF Refactoring"
author: jevon
date:   2008-10-02 16:41:43 +1300
---

[[GMF]]

It's challenging to refactor in [[GMF]], but definitely not impossible. Here are some things to watch out for.

# In many cases if you do your editing in the .gmfmap editor, the editor will automatically fix the other models to match your changes.
# Moving around the order of tools in .gmftool will screw up your Tool mappings in the .gmfmap. You will have to probably reset them.
# If you regenerate the .gmfgen directly onto itself, you will lose any ''Open Diagram Behaviour''s. The easiest way to solve this (assuming you have the file stored on [[SVN]]) is to diff the new file with itself and re-apply the ''Open Diagram Behaviour''s.
# If you regenerate the .gmfgen directly onto itself, it will not rename the helper class names - for example, if you have an OperationNameEditPart, and later rename Operation to Foo, your code will still be referring to OperationNameEditPart. The easiest way to solve this is to copy your old .gmfgen, then generate the .gmfgen again manually - and then use diff between the two files to copy over elements such as ''Contains Shortcuts To'', ''Plugin Information'' and ''Open Diagram Behaviour''.
# When generating code, the generated code will ''not'' delete any existing files. This may result in errors of files referring to missing model elements, or just extra baggage lying around.
# When generating code, it may struggle to remove missing imports. The easiest solution for this is to select all of your generated code and press Shift-Ctrl-O to organise all the imports.

[[Category:GMF]]