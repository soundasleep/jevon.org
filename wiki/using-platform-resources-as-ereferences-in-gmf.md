---
layout: page
title:  "Using Platform Resources as EReferences in GMF"
author: jevon
date:   2011-05-09 15:28:33 +1200
---

[[GMF]] - [[EMF]]

In my GMF-based project, I wanted to have a model like so:

[code]Thing
- type : XSDSimpleTypeDefinition[/code]

The idea behind this is that I could use a third-party XSD model as the target for the 'type' reference. This works fine if you are using XSD models that are in the same workspace as the current model/diagram; it will result in XMI such as

[code]<type href="my.xsd#//foo" />[/code]

However, I wanted to ''also'' provide a <a href="http://code.google.com/p/iaml/source/browse/trunk/org.openiaml.model/model/datatypes.xsd?spec=svn1681&r=1681">predefined XSD</a> as the initial source of possible types; this would be specified as part of the plugin environment. Ideally this would be achieved through namespaces (e.g. "http://openiaml.org/model/datatypes#MyDataType"), but I don't know how to do this yet.

I managed to get the development .xsd loaded into the ResourceSet of the current plugin with the following code (<a href="http://code.google.com/p/iaml/source/browse/trunk/org.openiaml.model/templates/aspects/xpt/diagram/commands/CreateNodeCommand.xpt?spec=svn1682&r=1682">dynamic template</a>). This just emulates ''Load Resource'', because in GMF you cannot ''Load Resource'' with a registered package (not that .xsds are registered packages).

(XXXCreateCommand)

[code]protected CommandResult doExecuteWithResult(IProgressMonitor monitor, IAdaptable info) throws ExecutionException {
  XXX newElement = ModelFactory.eINSTANCE.createXXX();

  Container owner = (Container) getElementToEdit();
  owner.getXXXs().add(newElement);

  // custom code starts here
  URI uri = URI.createPlatformPluginURI("/org.openiaml.model/model/datatypes.xsd", false);
  ResourceSet set = owner.eResource().getResourceSet();
  set.getResource(uri, true);

  // .. continues
}[/code]

This is fine, except that the serialised models were losing the path to the absolute .xsd:

[code]<type href="../../../../plugin/org.openiaml.model/model/datatypes.xsd#//foo"/>[/code]

After a non-insignificant amount of time, I found that by <a href="http://www.eclipse.org/forums/index.php?t=msg&goto=501234&">adding the ''OPTION_URI_HANDLER'' option</a> to the save options, you can modify how absolute URIs are deresolved (which is where they were being turned into relative URIs):

(XXXDiagramEditorUtil)

[code]public static Map getSaveOptions() {
  // ...
  saveOptions.put(XMLResource.OPTION_URI_HANDLER, new MyURIHandler());
  // ...
}[/code]

Finally, I could implement a URIHandler that would keep platform:/plugin/ URIs absolute, but force others to be relative:

[code]<type href="platform:/plugin/org.openiaml.model/model/datatypes.xsd#//foo"/>[/code]

In fact, there is one already defined in EMF: <a href="http://dev.eclipse.org/newslists/news.eclipse.tools.emf/msg37443.html">URIHandlerImpl.PlatformSchemeAware</a>.

This was then implemented as part of a <a href="http://code.google.com/p/iaml/source/browse/trunk/org.openiaml.model/templates/aspects/xpt/editor/DiagramEditorUtil.xpt?spec=svn1682&r=1682#30">dynamic template</a>.

==In EMF-generated editors==
If you are using [[EMF]]/genmodel to generate your editors, you will need to add the following line to XXXEditor.doSave():

[code]saveOptions.put(XMLResource.OPTION_URI_HANDLER, new URIHandlerImpl.PlatformSchemeAware());[/code]

(<a href="http://www.eclipse.org/forums/index.php/t/208504/">reference</a>)

[[Category:GMF]]