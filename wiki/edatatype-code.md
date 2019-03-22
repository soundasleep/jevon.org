---
layout: page
title:  edatatype-code
author: jevon
date:   2009-01-29 10:09:41 +13:00
tags: []
redirect_from:
  - "/wiki/Edatatype-code"
---

```
public CellEditor createPropertyEditor(Composite composite) {
  EClassifier eType = ((EStructuralFeature) itemPropertyDescriptor.getFeature(object)).getEType();

  final EDataType dataType = (EDataType) eType;
  if (dataType.equals(DomainPackage.eINSTANCE.getFileReference())) {
    CellEditor result = new ExtendedDialogCellEditor(composite, getEditLabelProvider()) {
      protected EDataTypeValueHandler valueHandler = new EDataTypeValueHandler(dataType);

      @Override
      protected Object openDialogBox(Control cellEditorWindow) {
        Shell shell = PlatformUI.getWorkbench().getDisplay().getActiveShell();
        FileDialog dialog = new FileDialog(shell, SWT.OPEN);
        dialog.setFileName(valueHandler.toString(getValue()));
        String fileSelected = dialog.open();
        if (fileSelected == null) {
          return getValue();
        }

        return valueHandler.toValue(fileSelected);
      }
    };
    return result;
  }
  return super.createPropertyEditor(composite);
}
```
