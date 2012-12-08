---
layout: page
title:  "JMonkeyEngine"
author: jevon
date:   2012-12-08 19:19:08 +1300
---

[[Articles]]

An amazing [[3D]] game development engine written in [[Java]].

==org.xml.sax.SAXParseException; The value of attribute "material" associated with an element type "null" must not contain the '<' character.==
When exporting a Google [[SketchUp]] model into OgreXML format using the <a href="http://www.360code.it/projects/sketchup_ogre_export/">SketchUp to Ogre Exporter</a>, the plugin will output XML with material names using `<` and `>` characters.

In my case, a simple fix was to wrap these special characters in the [[Ruby]] source code, in `ogre_export_1_2_0b9.rb` (about line 426):

[code]
 	ogre_mat_name_fixed = ogre_mat.name.sub("<", "_lt").sub(">", "_gt")
	# out.print "      <submesh material = "#{ogre_mat.name}" usesharedvertices="false" "
	out.print "      <submesh material = "#{ogre_mat_name_fixed}" usesharedvertices="false" "
[/code]

And likewise around line 116:

[code]
		ogre_mat_name_fixed = @name.sub("<", "_lt").sub(">", "_gt")
		# s.print	"material #{@name}n" 
		s.print	"material #{ogre_mat_name_fixed}n" 
[/code]

[[Category:Game Development]]
[[Category:Java]]
[[Category:Ruby]]
[[Category:3D]]