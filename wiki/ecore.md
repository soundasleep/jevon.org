---
layout: page
title:  "Ecore"
author: jevon
date:   2011-04-29 13:16:49 +1200
---

See also [[GMF]].

# [[EDataType Serializable]]
# <a href="http://www.ibm.com/developerworks/library/os-eclipse-emfmetamodel/index.html">Extending Ecore to define a new M3</a>

==I want to be able to go backwards through a reference==
Also see [[Using EOpposite in GMF]].

{{gmf-css}}<img src="/img/gmf/eopposite-1.png" class="gmf">If you have a model like the right, which only has a one-directional link, it's not possible to find out what element the connection link came from. For example, if you have an Action A with a Connection to another Action B, you cannot ask the Connection of the source (Action A).

The solution is to make the link bi-directional, by:

# Adding another reference attribute to each backwards reference so we can keep track of the back reference ("from" and "in" attributes)
# Setting the eOpposite reference to the opposite attribute, that is, the eOpposite of "from" is "connection", and "to" is "in".

Once you [[GMF|reload the .genmodel]] and re-create the model/edit code, you will now be able to go Connection.getFrom() and Action.getIn().

It will also change the generated model [[XML]] from:
[code]<component name="Home Page">
  <component name="Link to About Page">
    <operation name="click">
      <connection name="onClick" to="//@component.1/@operation.0"/>
    </operation>
  </component>
</component>
<component name="About Page">
  <operation name="render"/>
</component>[/code]

<img src="/img/gmf/eopposite-2.png" class="gmf">To:
[code]<component name="Home Page">
  <component name="Link to About Page">
    <operation name="click">
      <connection name="onClick" to="//@component.1/@operation.0"/>
    </operation>
  </component>
</component>
<component name="About Page">
  <operation name="render" in="//@component.0/@component.0/@operation.0/@connection.0" />
</component>[/code]

==Adding comments to an EMF model==
<img src="/img/gmf/comment.png" class="gmf">The easiest way to do this is to add an EAnnotation like so:

[code]- EAnnotation source: http://foo.com/comment
  - DetailsEntry key: comment, details: (enter in your comment here)[/code]

EMF/[[GMF]] will ignore the EAnnotation and the comment will remain. Another option is to add it to the ''ecore_diagram'' visual editor as a note.

[[Category:GMF]]
[[Category:EMF]]
[[Category:Technology]]