---
layout: page
title:  "File Property Editor for GMF"
author: jevon
date:   2009-01-30 08:37:37 +1300
tags:   [GMF, Technology, EMF]
---

[GMF](gmf.md)

In our [previous](using-edatatypes-in-gmf.md) [pages](using-edatatypes-in-gmf-2.md), we successfully created an EDataType and the structure to link it up to a custom editor, and a FileDialog in order to select it.

By default, the values returned here will be absolute paths. If instead you would like them to be relative to the path of the model file itself (this is a good idea for transportability!), here is some code that will let you do this:

```
protected Object openDialogBox(Control cellEditorWindow) {
  Shell shell = PlatformUI.getWorkbench().getDisplay().getActiveShell();
  FileDialog dialog = new FileDialog(shell, SWT.OPEN);

  // set the default path
  URI uri = ((EObject) object).eResource().getURI();
  URI resolved = CommonPlugin.resolve(uri);
  resolved = resolved.trimFileExtension(); // remove the file part
  dialog.setFilterPath(resolved.toFileString());

  // set the default file
  // (the FileDialog also handles absolute/relative files)
  dialog.setFileName(valueHandler.toString(getValue()));

  String fileSelected = dialog.open();
  if (fileSelected == null) {
    return getValue();
  }

  // extract out the source path to make it relative
  URI deres = URI.createFileURI(fileSelected).deresolve(resolved);

  fileSelected = deres.toString();

  return valueHandler.toValue(fileSelected);
}
```

Like the previous page, this can also be <a href="http://code.google.com/p/iaml/source/detail?r=427">implemented in dynamic templates</a>.
