---
layout: page
title:  "Improving EMF Model Loading Performance"
author: jevon
date:   2009-10-30 10:56:27 +1300
---

[[EMF]]

To load a model instance in EMF, I was using code similar to the following:

[code]protected EObject loadModelDirectly(String filename) throws IOException {
  ResourceSet resourceSet = new ResourceSetImpl();
  URI uri = URI.createFileURI(filename);
  org.eclipse.emf.ecore.resource.Resource resource = resourceSet.getResource(uri, true);
  assertNotNull(resource);
  assertEquals("there should only be one contents in the model file", 1, resource.getContents().size());
  return resource.getContents().get(0);[/code]

For a model of about 7,600 elements, it was taking 52 seconds to load this model. This model used '''intrinsic IDs''' (that is, explicitly defined EAttributes with id=true).

[code]protected EObject loadModelDirectly(String filename) throws IOException {
  ResourceSet resourceSet = new ResourceSetImpl();
  URI uri = URI.createFileURI(filename);
  org.eclipse.emf.ecore.resource.Resource resource = resourceSet.getResource(uri, true);
  assertNotNull(resource);
  Map<Object,Object> options = new HashMap<Object,Object>();
  resource.load(options);
  assertEquals("there should only be one contents in the model file", 1, resource.getContents().size());
  return resource.getContents().get(0);
}[/code]

50 seconds.

Adding '''org.eclipse.emf.ecore.xmi''' to the plug-in dependencies: 50 seconds.

[code]options.put(XMLResource.OPTION_DEFER_IDREF_RESOLUTION, true);[/code]

51 seconds.

[code]resourceSet.getLoadOptions().put(XMLResource.OPTION_DEFER_IDREF_RESOLUTION, true);[/code]

72 seconds.

[code]resourceSet.getLoadOptions().put(XMIResource.OPTION_DEFER_ATTACHMENT, true);
resourceSet.getLoadOptions().put(XMIResource.OPTION_DEFER_IDREF_RESOLUTION, true);
resourceSet.getLoadOptions().put(XMIResource.OPTION_USE_DEPRECATED_METHODS, true);
resourceSet.getLoadOptions().put(XMIResource.OPTION_USE_PARSER_POOL, xmlParserPool);
resourceSet.getLoadOptions().put(XMIResource.OPTION_USE_XML_NAME_TO_FEATURE_MAP, new HashMap<Object,Object>());[/code]

73 seconds.

[code]resourceSet.getLoadOptions().put(XMIResource.OPTION_USE_DEPRECATED_METHODS, false);
resourceSet.getLoadOptions().put(XMIResource.OPTION_USE_PARSER_POOL, xmlParserPool);
resourceSet.getLoadOptions().put(XMIResource.OPTION_USE_XML_NAME_TO_FEATURE_MAP, new HashMap<Object,Object>());[/code]

52 seconds.

[[Category:Java]]
[[Category:Eclipse]]
[[Category:EMF]]