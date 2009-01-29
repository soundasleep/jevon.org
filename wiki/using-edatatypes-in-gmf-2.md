---
layout: page
title:  "Using EDataTypes in GMF 2"
author: jevon
date:   2009-01-30 08:33:54 +1300
---

[[GMF]]

{{gmf-css}}<img src="/img/gmf/edatatype-2.png" align="right" class="gmf">In our [[Using EDataTypes in GMF|previous page]], we successfully created an EDataType and the structure to link it up to a custom editor. However, in order to deal with EDataTypes, you also need to deal with the values you get through an EDataTypeValueHandler. As <a href="http://dev.eclipse.org/newslists/news.eclipse.modeling.gmf/msg16435.html">discussed in my thread on the GMF mailing list</a>, the solution can be something like the following:

[code]public CellEditor createPropertyEditor(Composite composite) {
  EClassifier eType = ((EStructuralFeature) itemPropertyDescriptor.getFeature(object)).getEType();

  final EDataType dataType = (EDataType) eType;
  if (dataType.equals(DomainPackage.eINSTANCE.getFileReference())) {
    CellEditor result = new ExtendedDialogCellEditor(composite, getEditLabelProvider()) {
      protected EDataTypeValueHandler valueHandler = new EDataTypeValueHandler(dataType);

[/code][code]      @Override
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
}[/code]

This can be implemented as <a href="http://code.google.com/p/iaml/source/browse/trunk/org.openiaml.model/templates/aspects/xpt/propsheet/PropertySection.xpt?spec=svn415&r=415">a dynamic template</a>, as I <a href="http://code.google.com/p/iaml/source/detail?r=415">implemented in the IAML editor</a>.

In the next page I discuss how to provide an [[File Property Editor for GMF|absolute path-based File property editor for GMF]].

[[Category:GMF]]
[[Category:Technology]]
[[Category:EMF]]