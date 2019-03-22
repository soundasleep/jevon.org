---
layout: page
title:  Creating a new GMF Editor
author: jevon
date:   2008-06-18 12:43:37 +12:00
tags:
  - Technology
  - Eclipse
  - GMF
redirect_from:
  - "/wiki/Creating a new GMF Editor"
---

Also see [GMF](GMF.md) for more details. Having issues? Look at [GMF Troubleshooting](gmf-troubleshooting.md).

This tutorial applies to [GMF](GMF.md) 2.0.2; [GEF](gef.md) SDK 3.3.2.

Some more tutorials:
1. [GMF Diagram Partitioning](GMF_Diagram_Partitioning.md)

{% include gmf-css.md %}<div class="gmf_code"><ul>
<li>Open up the GMF cheat sheet (CS), we will use this to do most of the work.</li>
<li>Create a new project (CS)</li>
<li>Create an ecore model, either by hand or through Java annotations</li>
  <ul>
  <li>In this example, I am using the following .ecore:</li>
    <ul>
    <li>[package "foo"] ns: "org.package.bar", uri: "http://jevon.org/package"</li>
      <ul>
      <li>[class Application]</li>
        <ul>
        <li>reference pages [0..*] : Page **(make sure you set 'containment' to true!)**</li>
        </ul>
      <li>[class Page]</li>
        <ul>
        <li>attribute title : String</li>
        <li>attribute content : String</li>
        <li>reference links [0..*] : Link **(again with containment to true)**</li>
        </ul>
      <li>[class Link]</li>
        <ul>
        <li>reference page [0..1] : Page **(containment to false)**</li>
        </ul>
      </ul>
     </ul>
   </ul>

<li>Create .genmodel (CS)</li>
  <ul>
  <li>Set the package manually to org.foo - this will create the edit code in org.foo.*</li>
  <li>Right click the root of the .genmodel</li>
    <ul>
    <li>Generate model code</li>
    <li>Generate edit code</li>
    </ul>
  <li>_If there are any errors, make sure your .ecore model is behaving. Once you do this, make sure you do the following:_</li>
    <ul>
    <li>Delete the .genmodel, plugin.xml, MANIFEST.MF files</li>
    <li>Delete the .edit project</li>
    <li>Try creating the model again</li>
    </ul>
  </ul>

<li>Create .gmfgraph (CS)</li>
  <ul>
  <li>Select "Application" as the diagram element</li>
  <li>There are three types of elements here: node; link; and label.</li>
    <ul>
    <li>Application (the root): all to blank</li>
    <li>Page: set as node</li>
      <ul>
      <li>title: set as label</li>
      <li>content: set as label</li>
      </ul>
    <li>Link: set as link</li>
    </ul>
  </ul>

<li>Create .gmftool (CS)</li>
  <ul>
  <li>Select "Application" as the diagram element</li>
  <li>Once again, three types of elements:</li>
    <ul>
    <li>Application (the root): all to blank</li>
    <li>Page: set as node</li>
    <li>Link: set as link</li>
    </ul>
  </ul>

<li>Create .gmfmap (CS)</li>
  <ul>
  <li>Wizard properties</li>
    <ul>
    <li>Canvas mapping: [package foo] / Application</li>
    <li>Nodes area: select Page</li>
    <li>Links area: select Link</li>
    <li>_If you don't have any Nodes or Links displaying here... I haven't worked out why yet._</li>
    </ul>
  <li>Edit feature label mapping</li>
    <ul>
    <li>select .gmfmap / Mapping / pages: Page / Node / Feature Label</li>
      <ul>
      <li>set Diagram Label to PageTitle</li>
      </ul>
    </ul>
  </ul>

<li>Generate code (CS)</li>
  <ul>
  <li>gmfmap > create generator</li>
  <li>gmfgen > generate diagram code</li>
  </ul>

<li>Run as Eclipse application</li>
<li>Create a new diagram by selecting New > Examples > Foo diagram</li>
</ul>
</div>

This will allow the generation of the following [ecore](Ecore.md)-based [XML](XML.md) model:

```
<?xml version="1.0" encoding="UTF-8"?>
<org.package.bar:Application xmi:version="2.0" xmlns:xmi="http://www.omg.org/XMI" xmlns:org.package.bar="http://jevon.org/package">
  <pages title="a page" content="some content">
    <links page="//@pages.1"/>
    <links page="//@pages.2"/>
  </pages>
  <pages title="another page" content="some content"/>
  <pages title="yet another"/>
</org.package.bar:Application>
```

If you are having any issues, try looking at [GMF Troubleshooting](gmf-troubleshooting.md).
