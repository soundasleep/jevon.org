---
layout: page
title:  "GMF Code Samples"
author: jevon
date:   2010-04-28 14:49:05 +1200
---

[[GMF]]

Here's lots of code samples for [[GMF]]. Currently they are stored on [[SVN]] purely as text; in the future, once my [[research]] is progressing further, they will actually link to real-world code. Also all this code is pretty messy.

For more information on activating shortcuts in GMF and what they can achieve, check out [[GMF Drag Drop]].

# [[Setting up an EMF/JET testing project with JUnit and Eclipse]]
# [[JET|Add a right click menu to generate code from EMF using Java JET]]
# [[Loading an EMF model from an XMI file]]
# [[Getting IDs on EMF model elements]]
# [[Programatically opening a sub-diagram in GMF]]
# <a href="http://code.google.com/p/iaml/source/browse/trunk/org.openiaml.model.tests/src/org/openiaml/model/tests/eclipse/InitializeDiagramTestCase.java?spec=svn324&r=324">Programatically initialising a new diagram in GMF</a> (SVN)
# <a href="http://code.google.com/p/iaml/source/browse/trunk/org.openiaml.model.tests/src/org/openiaml/model/tests/eclipse/CreateNewDiagramTestCase.java?spec=svn661&r=661#26">Programatically creating a new diagram and domain model in GMF</a> (SVN)
# [[Unit testing of GMF diagram editors and shortcuts with JUnit]]
# <a href="http://code.google.com/p/iaml/source/detail?r=345">Programatically exporting a model diagram to one image</a>, or <a href="http://code.google.com/p/iaml/source/browse/trunk/org.openiaml.model.diagram.custom/src/org/openiaml/model/diagram/custom/actions/ExportImagePartsAction.java?spec=svn347&r=347">multiple images</a> (SVN, also see GMF's <a href="http://dev.eclipse.org/viewcvs/index.cgi/org.eclipse.gmf/plugins/org.eclipse.gmf.runtime.diagram.ui.render/src/org/eclipse/gmf/runtime/diagram/ui/render/actions/CopyToImageAction.java?root=Modeling_Project&view=co">CopyToImageAction</a>)
# <a href="https://bugs.eclipse.org/bugs/show_bug.cgi?id=255745">Automatically re-validating the model when the diagram is saved</a>
# <a href="http://code.google.com/p/iaml/source/browse/branches/2008-11-ecore-0.2/org.openiaml.model.tests/src/org/openiaml/model/tests/model/ModelTestCase.java?spec=svn377&r=377">Testing all EMF model elements with JUnit</a>
# [[Using EDataTypes in GMF]]
# [[Using EDataTypes in GMF|Custom Property Editors for EDataTypes in GMF]]
# [[File Property Editor for GMF]]
# [[Breadcrumbs in GMF Editors]]
# <a href="https://bugs.eclipse.org/bugs/show_bug.cgi?id=272613">Creating Connections from Shortcut Elements in GMF</a>
# [[Adding a Custom Label in GMF]]
# [[GMF Label OpenDiagramEditPolicies]]
# [[Initialising new elements in a new GMF diagram]]
# <a href="http://code.google.com/p/iaml/source/detail?r=1193">Exporting entire GMF diagrams into clickable HTML</a> (example coming soon)
# [[Using Platform Resources as EReferences in GMF]]
# [[Putting Generated GMF Diagram Editors into a New Category]]

{{tag-todo|export example}}

==Automatically refresh a GMF EditPart==
Here is some code which will automatically refresh all the nodes and connections visible in a given GMF [[EditPart]].

# http://iaml.svn.sourceforge.net/viewvc/iaml/trunk/examples/gmf/RefreshElementCommand.java?view=markup

==Create Missing Shortcuts for a View==
{{gmf-css}}<img src="/img/gmf/shortcuts-1.png" class="gmf">If you would like to automatically create shortcuts for a given EditPart, such as to the images on the right, you can use the code provided below.

# http://iaml.svn.sourceforge.net/viewvc/iaml/trunk/examples/gmf/CreateMissingShortcutsAction.java?view=markup
# http://iaml.svn.sourceforge.net/viewvc/iaml/trunk/examples/gmf/CreateMissingShortcutsCommand.java?view=markup

Basically, the code first searches the current EditPart for elements that it needs to add as shortcuts; it then adds each of these elements along with a shortcut annotation, and finally, the view is refreshed (''RefreshElementCommand'' above) to connect these shortcuts up to the nodes currently viewable.

The XML file for this example could be something like so:

<img src="/img/gmf/shortcuts-2.png" class="gmf">[code]<root>
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
</root>[/code]

==Automatically creating shortcuts on an EditPart==
As an extension to the code above, this will automatically populate an EditPart with the shortcuts it needs when the EditPart is activated.

# http://iaml.svn.sourceforge.net/viewvc/iaml/trunk/examples/gmf/Uml3ShortcutsEditPartProvider.java?view=markup

The code that is particularly interesting is:
[code]if (part instanceof ComponentEditPart) { ... }[/code]

And add this to your ''plugin.xml'':

[code]<extension point="org.eclipse.gmf.runtime.diagram.ui.editpartProviders">
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
</extension>[/code]

==Adding elements and attribute values to a container element==
This code will add an "Event" object and set its "title" attribute to "test".

# http://iaml.svn.sourceforge.net/viewvc/iaml/trunk/examples/gmf/CreateChildContentsCommand.java?view=markup

==Automatically adding elements and attributes to a newly created element==
As an extension to the code sample above. This code isn't complete; it will happily add the elements to each element every time you both create it and open it for editing. But the basic content is there.

# http://iaml.svn.sourceforge.net/viewvc/iaml/trunk/examples/gmf/Uml3ShortcutsEditPartProvider.java?view=markup

The code that is particularly interesting is:
[code]if (part instanceof LinkComponentEditPart) { ... }[/code]

{{tag-todo|point to actual SVN project code}}

[[Category:GMF]]
[[Category:Technology]]
[[Category:Code to Clean Up]]