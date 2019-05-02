---
layout: page
title:  GMF Code Samples
author: jevon
date:   2010-04-28 14:49:05 +12:00
tags:
  - GMF
  - Technology
  - Code to Clean Up
redirect_from:
  - "/wiki/GMF Code Samples"
---

[GMF](GMF.md)

Here's lots of code samples for [GMF](GMF.md). Currently they are stored on [SVN](SVN.md) purely as text; in the future, once my [research](reSearch.md) is progressing further, they will actually link to real-world code. Also all this code is pretty messy.

For more information on activating shortcuts in GMF and what they can achieve, check out [GMF Drag Drop](GMF_Drag_Drop.md).

1. [Setting up an EMF/JET testing project with JUnit and Eclipse](setting-up-an-emf/jet-testing-project-with-junit-and-Eclipse.md)
1. [Add a right click menu to generate code from EMF using Java JET](JET.md)
1. [Loading an EMF model from an XMI file](Loading_an_EMF_model_from_an_XMI_file.md)
1. [Getting IDs on EMF model elements](Getting_IDs_on_EMF_model_elements.md)
1. [Programatically opening a sub-diagram in GMF](Programatically_opening_a_sub-diagram_in_GMF.md)
1. <a href="http://code.google.com/p/iaml/source/browse/trunk/org.openiaml.model.tests/src/org/openiaml/model/tests/eclipse/InitializeDiagramTestCase.java?spec=svn324&r=324">Programatically initialising a new diagram in GMF</a> (SVN)
1. <a href="http://code.google.com/p/iaml/source/browse/trunk/org.openiaml.model.tests/src/org/openiaml/model/tests/eclipse/CreateNewDiagramTestCase.java?spec=svn661&r=661#26">Programatically creating a new diagram and domain model in GMF</a> (SVN)
1. [Unit testing of GMF diagram editors and shortcuts with JUnit](Unit_testing_of_GMF_diagram_editors_and_shortcuts_with_JUnit.md)
1. <a href="http://code.google.com/p/iaml/source/detail?r=345">Programatically exporting a model diagram to one image</a>, or <a href="http://code.google.com/p/iaml/source/browse/trunk/org.openiaml.model.diagram.custom/src/org/openiaml/model/diagram/custom/actions/ExportImagePartsAction.java?spec=svn347&r=347">multiple images</a> (SVN, also see GMF's <a href="http://dev.eclipse.org/viewcvs/index.cgi/org.eclipse.gmf/plugins/org.eclipse.gmf.runtime.diagram.ui.render/src/org/eclipse/gmf/runtime/diagram/ui/render/actions/CopyToImageAction.java?root=Modeling_Project&view=co">CopyToImageAction</a>)
1. <a href="https://bugs.eclipse.org/bugs/show_bug.cgi?id=255745">Automatically re-validating the model when the diagram is saved</a>
1. <a href="http://code.google.com/p/iaml/source/browse/branches/2008-11-ecore-0.2/org.openiaml.model.tests/src/org/openiaml/model/tests/model/ModelTestCase.java?spec=svn377&r=377">Testing all EMF model elements with JUnit</a>
1. [Using EDataTypes in GMF](using-edatatypes-in-GMF.md)
1. [Custom Property Editors for EDataTypes in GMF](using-edatatypes-in-GMF.md)
1. [File Property Editor for GMF](File_Property_Editor_for_GMF.md)
1. [Breadcrumbs in GMF Editors](Breadcrumbs_in_GMF_Editors.md)
1. <a href="https://bugs.eclipse.org/bugs/show_bug.cgi?id=272613">Creating Connections from Shortcut Elements in GMF</a>
1. [Adding a Custom Label in GMF](Adding_a_Custom_Label_in_GMF.md)
1. [GMF Label OpenDiagramEditPolicies](GMF_Label_OpenDiagramEditPolicies.md)
1. [Initialising new elements in a new GMF diagram](Initialising_new_elements_in_a_new_GMF_diagram.md)
1. <a href="http://code.google.com/p/iaml/source/detail?r=1193">Exporting entire GMF diagrams into clickable HTML</a> (example coming soon)
1. [Using Platform Resources as EReferences in GMF](using-platform-resources-as-ereferences-in-GMF.md)
1. [Putting Generated GMF Diagram Editors into a New Category](Putting_Generated_GMF_Diagram_Editors_into_a_New_Category.md)

{% include tag-todo.md comment="export example" %}

## Automatically refresh a GMF EditPart
Here is some code which will automatically refresh all the nodes and connections visible in a given GMF [EditPart](editpart.md).

1. http://iaml.svn.sourceforge.net/viewvc/iaml/trunk/examples/gmf/RefreshElementCommand.java?view=markup

## Create Missing Shortcuts for a View
{% include gmf-css.md %}<img src="/img/gmf/shortcuts-1.png" class="gmf">If you would like to automatically create shortcuts for a given EditPart, such as to the images on the right, you can use the code provided below.

1. http://iaml.svn.sourceforge.net/viewvc/iaml/trunk/examples/gmf/CreateMissingShortcutsAction.java?view=markup
1. http://iaml.svn.sourceforge.net/viewvc/iaml/trunk/examples/gmf/CreateMissingShortcutsCommand.java?view=markup

Basically, the code first searches the current EditPart for elements that it needs to add as shortcuts; it then adds each of these elements along with a shortcut annotation, and finally, the view is refreshed (_RefreshElementCommand_ above) to connect these shortcuts up to the nodes currently viewable.

The XML file for this example could be something like so:

<img src="/img/gmf/shortcuts-2.png" class="gmf">

```
<root>
  <view name="external">
    <operation name="external link 1" />
    <operation name="external link 2" />
  </view>
  <view name="current">
    <component name="component">
      <connection name="connection 1" to="//@view.0/@operation.0" />
      <connection name="connection 2" to="//@view.0/@operation.1" />
    </component>
  </view>
</root>
```

## Automatically creating shortcuts on an EditPart
As an extension to the code above, this will automatically populate an EditPart with the shortcuts it needs when the EditPart is activated.

1. http://iaml.svn.sourceforge.net/viewvc/iaml/trunk/examples/gmf/Uml3ShortcutsEditPartProvider.java?view=markup

The code that is particularly interesting is:
`if (part instanceof ComponentEditPart) { ... }`

And add this to your _plugin.xml_:

```
<extension point="org.eclipse.gmf.runtime.diagram.ui.editpartProviders">
  <editpartProvider class="org.openiaml.test.uml3.diagram.component.custom.edit.providers.Uml3ShortcutsEditPartProvider">
    <Priority name="Low" />
    <object class="org.eclipse.gmf.runtime.notation.Node" id="MyOverride">
      <method name="getElement()">
        <value class="org.openiaml.test.uml3.model.Component"/>
      </method>
    </object>
    <context
         views="MyOverride"/>
  </editpartProvider>
</extension>
```

## Adding elements and attribute values to a container element
This code will add an "Event" object and set its "title" attribute to "test".

1. http://iaml.svn.sourceforge.net/viewvc/iaml/trunk/examples/gmf/CreateChildContentsCommand.java?view=markup

## Automatically adding elements and attributes to a newly created element
As an extension to the code sample above. This code isn't complete; it will happily add the elements to each element every time you both create it and open it for editing. But the basic content is there.

1. http://iaml.svn.sourceforge.net/viewvc/iaml/trunk/examples/gmf/Uml3ShortcutsEditPartProvider.java?view=markup

The code that is particularly interesting is:
`if (part instanceof LinkComponentEditPart) { ... }`

{% include tag-todo.md comment="point to actual SVN project code" %}
