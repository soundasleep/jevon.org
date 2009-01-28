---
layout: page
title:  "Using EDataTypes in GMF"
author: jevon
date:   2009-01-29 10:28:41 +1300
---

[[GMF]]

'''EDataType'''s in [[GMF]] allow you to specify custom data types in an [[Ecore]] model. In this page I will try and describe the steps to create your own editor to a custom data type, in particular an editor that allows the user to select a file.

{{gmf-css}}<img src="/img/gmf/edatatype-1.png" align="right" class="gmf">

# Create an EDataType, specifying the ''Name'' and the ''Instance Class Name''.
# Create the new data types somewhere in your project, e.g. <a href="http://code.google.com/p/iaml/source/browse/trunk/org.openiaml.model/src/org/openiaml/model/FileReference.java?spec=svn414&r=414">FileReference interface</a> and the <a href="http://code.google.com/p/iaml/source/browse/trunk/org.openiaml.model/src/org/openiaml/model/impl/FileReferenceImpl.java?spec=svn414&r=414">FileReferenceImpl implementation</a>.
# Create another EClass somewhere that uses this EDataType in an EAttribute.

If you now connect this new EClass to your .gmfgraph/.gmfgen/.gmfmodel, you will end up with an editor that accepts text input, but just throws '''IllegalArgumentException'''s. This will occur if you have set the [[EDataType Serializable|EDataType as serialized]].

(If no properties show up for your new EClass, try deleting the [[GMF Troubleshooting 6|edit plugin.xml]].)

To resolve this, you will have to go into the <a href="http://code.google.com/p/iaml/source/browse/trunk/org.openiaml.model/src/org/openiaml/model/model/domain/impl/DomainFactoryImpl.java?spec=svn414&r=414">FactoryImpl for the package</a> the datatype resides, and edit ''createFileReferenceFromString()'' and ''convertFileReferenceToString()'':

[code]/**
 * @generated NOT
 */
public FileReference createFileReferenceFromString(EDataType eDataType, String initialValue) {
  return new FileReferenceImpl(initialValue);
}

/**
 * @generated NOT
 */
public String convertFileReferenceToString(EDataType eDataType, Object instanceValue) {
  if (instanceValue == null)
    return null;
  return ((FileReference) instanceValue).toString();
}[/code]

The strings passed here will now be saved in the model file. The next step is to provide a dialog for editing the Strings, and not just a String editor.

Following <a href="http://dev.eclipse.org/newslists/news.eclipse.modeling.gmf/msg10837.html">a newsgroup discussion</a> that was hard to find, the solution is to modify the generated diagram.sheet.XXXPropertySection like so:

[code]public IPropertySource getPropertySource(Object object) {
  if (object instanceof IPropertySource) {
    return (IPropertySource) object;
  }
  AdapterFactory af = getAdapterFactory(object);
  if (af != null) {
    IItemPropertySource ips = (IItemPropertySource) af.adapt(object,
        IItemPropertySource.class);
    if (ips != null) {
      return new CustomisedPropertySource(object, ips); // new code!!!
    }
  }
  if (object instanceof IAdaptable) {
    return (IPropertySource) ((IAdaptable) object)
        .getAdapter(IPropertySource.class);
  }
  return null;
}[/code]

This refers to additional classes, which are as follows:

[code]public class CustomizedPropertyDescriptor extends PropertyDescriptor implements IPropertyDescriptor {
  public CustomizedPropertyDescriptor(Object object,
      IItemPropertyDescriptor itemPropertyDescriptor) {
    super(object, itemPropertyDescriptor);
  }

  @Override
  protected CellEditor createEDataTypeCellEditor(EDataType dataType,
      Composite composite) {
    if (dataType.equals( DomainPackage.eINSTANCE.getFileReference() )) {
      System.out.println("kittens!");  // success!
    }
    return super.createEDataTypeCellEditor(dataType, composite);
  }
}[/code]

[code]public class CustomisedPropertySource extends PropertySource implements IPropertySource {
  public CustomisedPropertySource(Object object,
      IItemPropertySource itemPropertySource) {
    super(object, itemPropertySource);
  }

  protected IPropertyDescriptor createPropertyDescriptor(
      IItemPropertyDescriptor itemPropertyDescriptor) {
    return new CustomizedPropertyDescriptor(object, itemPropertyDescriptor);
  }
}[/code]

'''However, in order to deal with EDataTypes, [[Using EDataTypes in GMF 2|you must also go through an EDataTypeValueHandler]].'''

[[Category:GMF]]
[[Category:Technology]]
[[Category:EMF]]