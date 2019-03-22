---
layout: page
title:  "JMonkeyEngine"
author: jevon
date:   2012-12-08 19:19:08 +1300
tags:   [Game Development, Java, Ruby, 3D]
---

[Articles](Articles.md)

An amazing [3D](3d.md) game development engine written in [Java](Java.md).

## org.xml.sax.SAXParseException; The value of attribute "material" associated with an element type "null" must not contain the '<' character.
When exporting a Google [SketchUp](sketchup.md) model into OgreXML format using the <a href="http://www.360code.it/projects/sketchup_ogre_export/">SketchUp to Ogre Exporter</a>, the plugin will output XML with material names using `<` and `>` characters.

In my case, a simple fix was to wrap these special characters in the [Ruby](Ruby.md) source code, in `ogre_export_1_2_0b9.rb` (about line 426):

```
ogre_mat_name_fixed = ogre_mat.name.sub("<", "_lt").sub(">", "_gt")
	# out.print "      <submesh material = "#{ogre_mat.name}" usesharedvertices="false" "
	out.print "      <submesh material = "#{ogre_mat_name_fixed}" usesharedvertices="false" "
```

And likewise around line 116:

```
ogre_mat_name_fixed = @name.sub("<", "_lt").sub(">", "_gt")
		# s.print	"material #{@name}n" 
		s.print	"material #{ogre_mat_name_fixed}n"
```
