---
layout: page
title:  "Getting IDs on EMF model elements"
author: jevon
date:   2008-10-16 11:56:46 +1300
---

[[GMF Code Samples]] / [[GMF]] / [[EMF]]

This is actually an [[EMF]] thing. The idea is that we want to have a model change from:

[code]<root>
  <children name="one" />
  <children name="two">
    <wire from="//@children.0" to="//@children.1"/>
  </children>
</root>[/code]

To:

[code]<root id="id1">
  <children id="id2" name="one" />
  <children id="id3" name="two">
    <wire id="id4" from="id2" to="id3"/>
  </children>
</root>[/code]

First, you need to edit your .ecore, and add an attribute "id" that has eID set to true. 

If you want this to apply to ALL elements created in the model, the easiest way is just to add it to the Factory instance that creates all of the elements themselves.

For example, in your generated ''model.impl.ModelPackageImpl'':

[code]public Wire createWire() {
  Wire wire = new WireImpl();
  generateID(wire);
  return wire;
}

private static long generate_id_counter = 0;

protected void generateID(EObject obj) {
  if (obj instanceof ContainsIDs) {
    ContainsIDs ge = (ContainsIDs) obj;     
    generate_id_counter++;      
    ge.setId( this.getEPackage().getName() + "." + Long.toHexString(generate_id_counter) );
  }
}[/code]

It's up to you how you want to generate the IDs used in your model.

Another way to achieve this is to use EcoreUtil.getID() and EcoreUtil.setID() on an existing EObject.

You can <a href="http://code.google.com/p/iaml/source/detail?r=166">see all of the changes</a> I did when I applied this to my own EMF project.

[[Category:GMF]]
[[Category:EMF]]
[[Category:Code Samples]]