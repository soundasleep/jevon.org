---
layout: page
title:  "GMF Diagram Partitioning"
author: jevon
date:   2008-09-25 07:03:51 +1200
---

{{gmf-css}}The goal of this tutorial is to be able to create a [[GMF]] editor, where you can expand certain boxes to edit their contents, like so:

<img src="/img/gmf/demo1.png" class="gmf-left">
<img src="/img/gmf/demo2.png" class="gmf-left">

This tutorial was based on an excellent [[Eclipse]] <a href="http://dev.eclipse.org/newslists/news.eclipse.modeling.gmf/msg06184.html">news posting</a> (<a href="http://wiki.eclipse.org/Diagram_Partitioning">reposted</a>) and <a href="http://dev.eclipse.org/newslists/news.eclipse.modeling.gmf/msg05492.html">another discussion</a>. Also see [[GMF]], [[GMF Troubleshooting]] and [[Creating a new GMF Editor]].

If you want to add nodes within a node itself, try the second part of the GMF tutorial: http://wiki.eclipse.org/GMF_Tutorial_Part_2

<div class="gmf_code"><ul>
<li>Create your source.ecore</li>
  <ul>
  <li>We are using the following example .ecore:</li>
  <li><img src="/img/gmf/ecore.png" class="gmf-left"></li>
  </ul>
  
<li>Create your source.genmodel</li>
  <ul>
  <li>Make sure you set the package</li>
  <li>Right click .genmodel and generate model code</li>
  <li>Right click .genmodel and generate edit code</li>
  </ul>
</ul></div>

Now we create the super diagramming code.

<div class="gmf_code"><ul>
<li>Generate super.gmfgraph from source.genmodel</li>
  <ul>
  <li>Right click source.genmodel and select New > GMF > Simple Graphical Definition Model</li>
  <li>Select the root container object</li>
  <li>Only specify the creation of nodes that will actually exist</li>
    <ul>
    <li>In our case: <img src="/img/gmf/super-gmfgraph.png" class="gmf"></li>
    <li>WebApplication as the root</li>
    <li>DataTable as a node</li>
    <li>DataTable.name as a label</li>
    </ul>
  </ul>
    
<li>Generate super.gmftool from super.gmfgraph</li>
  <ul>
  <li>Right click super.gmfgraph and select New > GMF > Simple Tooling Definition Model</li>
  <li>Select the root container object</li>
  <li>Only specify the creation of nodes that will actually exist</li>
    <ul>
    <li>In our case: <img src="/img/gmf/super-gmftool.png" class="gmf"></li>
    <li>WebApplication as the root</li>
    <li>DataTable as a node</li>
    </ul>
  </ul>

<li>Generate super.gmfmap from super.gmftool</li>
  <ul>
  <li>Right click super.gmftool and select New > GMF > Guide Mapping Model Creation</li>
  <li>Select the root container object</li>
  <li>Remove invalid links and nodes</li>
    <ul>
    <li>In our case we remove DataColumn, because WebApplication cannot contain them</li>
    </ul>
  </ul>

<li>Generate super.gmfgen from super.gmfmap</li>
  <ul>
  <li>Right click super.gmfmap and select Create Generator</li>
  <li>Generate the diagram code to test everything is working OK (see [[GMF Troubleshooting]])</li>
  </ul>
</ul></div>

We have created the super diagramming code, now we want to generate the sub-diagramming code.

<div class="gmf_code"><ul>
<li>Generate sub.gmfgraph from source.genmodel</li>
  <ul>
  <li>Select the sub container object</li>
  <li>Only specify the creation of nodes that will actually exist</li>
    <ul>
    <li>In our case:<img src="/img/gmf/sub-root.png" class="gmf"></li>
    <li>DataTable as the root</li>
    <li>DataColumn as a node</li>
    <li>DataColumn.name as a label</li>
    <li>DataColumn.type as a label</li>
    </ul>
  </ul>
    
<li>Generate sub.gmftool from sub.gmfgraph</li>
  <ul>
  <li>Select the sub container object</li>
  <li>Only specify the creation of nodes that will actually exist</li>
    <ul>
    <li>In our case:</li>
    <li>DataTable as the root</li>
    <li>DataColumn as a node</li>
    </ul>
  </ul>

<li>Generate sub.gmfmap from sub.gmftool</li>
  <ul>
  <li>Select the sub container object</li>
  <li>Remove invalid links and nodes</li>
  </ul>

<li>Generate sub.gmfgen from sub.gmfmap</li>
  <ul>
  <li>Right click super.gmfmap and select Create Generator</li>
  </ul>
</ul></div>

We now need to do some configuration to link the two diagram codes together.

<div class="gmf_code"><ul>
<li>First, we need to make sub.gmfgen unique:</li>
  <ul>
  <li>Change ''sub.gmfgen > Gen Editor Generator > Domain File Extension''</li>
  <li>Change ''sub.gmfgen > Gen Editor Generator > ModelID'' [1] <input type="text"></li>
  <li>Change ''sub.gmfgen > Gen Editor Generator > Package Name Prefix''</li>
  <li>Change ''sub.gmfgen > Gen Editor Generator > Plugin Diagram > ID''</li>
  <li>Change ''sub.gmfgen > Gen Editor Generator > Plugin Diagram > Name''</li>
  <li>Look at the value for ''sub.gmfgen > Gen Editor Generator > Gen Editor View > ID'' <input type="text"></li>
  </ul>

<li>Now, link them together:</li>
  <ul>
  <li>Open super.gmfgen</li>
  <li>Go to the corresponding ''super.gmfgen > Gen Editor Generator > Gen Diagram > Gen Top Level Node'' for the sub element</li>
  <li>Right click the node and create a new ''Open Diagram Behaviour''</li>
  <li>On the new node, set the following properties:</li>
    <ul>
    <li>Change ''Diagram Kind'' to ''sub.gmfgen > Gen Editor Generator > ModelID'' [1]</li>
    <li>Change ''Editor ID'' to ''sub.gmfgen > Gen Editor Generator > Gen Editor View > ID''</li>
    <li>If you have more than one diagram editor for ''super.gmfgen'', make sure you also make ''Edit Policy Class Name'' unique in ''sub.gmfgen > Gen Editor Generator > Gen Editor View > ID''</li>
    </ul>
  </ul>
</ul></div>

Finally we can get everything working:

<div class="gmf_code"><ul>
<li><img src="/img/gmf/packages.png" class="gmf">Generate the diagram code from BOTH super.gmfgen and sub.gmfgen</li>
<li>You now need to start a new Eclipse application which includes BOTH of these new packages</li>
</ul></div>

This setup will allow users to create the following type of [[ecore]] [[XML]]:

[code]<?xml version="1.0" encoding="UTF-8"?>
<org.openiaml.test.two:WebApplication xmi:version="2.0" xmlns:xmi="http://www.omg.org/XMI" xmlns:org.openiaml.test.two="http://openiaml.org/two">
  <tables name="my table">
    <columns name="my column"/>
  </tables>
</org.openiaml.test.two:WebApplication>[/code]

If you have any issues, look into [[GMF Troubleshooting]].

[[Category:GMF]]
[[Category:Article]]
[[Category:Technology]]