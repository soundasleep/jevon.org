---
layout: page
title:  Ecore
author: jevon
date:   2011-04-29 13:16:49 +12:00
tags:
  - GMF
  - EMF
  - Technology
---

See also [GMF](gmf.md).

1. [EDataType Serializable](edatatype-serializable.md)
1. <a href="http://www.ibm.com/developerworks/library/os-eclipse-emfmetamodel/index.html">Extending Ecore to define a new M3</a>

## I want to be able to go backwards through a reference
Also see [Using EOpposite in GMF](using-eopposite-in-gmf.md).

{% include gmf-css.md %}<img src="/img/gmf/eopposite-1.png" class="gmf">If you have a model like the right, which only has a one-directional link, it's not possible to find out what element the connection link came from. For example, if you have an Action A with a Connection to another Action B, you cannot ask the Connection of the source (Action A).

The solution is to make the link bi-directional, by:

1. Adding another reference attribute to each backwards reference so we can keep track of the back reference ("from" and "in" attributes)
1. Setting the eOpposite reference to the opposite attribute, that is, the eOpposite of "from" is "connection", and "to" is "in".

Once you [reload the .genmodel](gmf.md) and re-create the model/edit code, you will now be able to go Connection.getFrom() and Action.getIn().

It will also change the generated model [XML](xml.md) from:
```
<component name="Home Page">
  <component name="Link to About Page">
    <operation name="click">
      <connection name="onClick" to="//@component.1/@operation.0"/>
    </operation>
  </component>
</component>
<component name="About Page">
  <operation name="render"/>
</component>
```

<img src="/img/gmf/eopposite-2.png" class="gmf">To:
```
<component name="Home Page">
  <component name="Link to About Page">
    <operation name="click">
      <connection name="onClick" to="//@component.1/@operation.0"/>
    </operation>
  </component>
</component>
<component name="About Page">
  <operation name="render" in="//@component.0/@component.0/@operation.0/@connection.0" />
</component>
```

## Adding comments to an EMF model
<img src="/img/gmf/comment.png" class="gmf">The easiest way to do this is to add an EAnnotation like so:

```
- EAnnotation source: http://foo.com/comment
  - DetailsEntry key: comment, details: (enter in your comment here)
```

EMF/[GMF](gmf.md) will ignore the EAnnotation and the comment will remain. Another option is to add it to the _ecore_diagram_ visual editor as a note.
