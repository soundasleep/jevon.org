---
layout: page
title:  "GMF Troubleshooting 7"
author: jevon
date:   2011-04-28 12:30:10 +1200
---

[[GMF]]

{{gmf-troubleshooting}}

---
{{gmf-css}}'''I cannot edit the properties of an element in the diagram editor (there are no properties -- they come up blank)'''

Try regenerating your .gmfgen for your root editor -- it is possible there are some ''Link References'' and ''Child References'' that have not been included.

If this doesn't work, then the best solution is to delete your entire "edit" plugin and regenerate it from scratch. I spent a couple of hours trying to resolve this problem, and it turns out the issue was probably missing lines in the plugin.xml.

(A less drastic solution may be just deleting your plugin.xml.)

---
'''I cannot create a shortcut to an element from the Project Navigator because it is not provided in the tree.'''
'''I have missing [[project navigator]] listings for particular model elements.'''

This can occur if the .genmodel of the container element does not have 'children' set to `true`. Only .genmodel containment references that have 'children', 'create child' and 'notify' as `true` will be provided in the Project Navigator. Try:

# Reloading the .genmodel from your .ecore
# Deleting the reference in the .genmodel and reloading the .ecore
# Making sure that only one .gmfgen/editor has ''Generate Domain Model Navigator'' [[GMF Drag Drop|set to true]]

To see what containment references will be provided in the editor, look at the ''model.edit'' plugin: ''model.provider.[ContainingObject]ItemProvider#getChildrenFeatures(Object)'' method.

---
'''Labels within a node are rendered horizontally rather than vertically'''

In the ''.gmfgraph > Figure Gallery > Figure Descriptor > Rectangle > Flow Layout'' for your node, set ''Vertical'' to ''true''.

---
'''When trying to set the font color of a Label, the color is ignored and all Labels remain black'''

See <a href="http://dev.eclipse.org/newslists/news.eclipse.modeling.gmf/msg16145.html">this newsgroup posting</a>: local preferences and defaults are overriding your labels. (<a href="http://code.google.com/p/iaml/source/detail?r=653">My approach</a>.)

---
<img src="/img/gmf/initialize-many.png" class="gmf">'''I have more than one/too many "initialize foo_diagram diagram file" in the right-click menu'''

This occurs when more than one .gmfgen has the same "Domain File Extension" set. Go into a .gmfgen and change this back to the default, or change it to something wild and wacky. 

---
'''My gmfgen is generating code that refers to an ItemProviderAdapterFactory that does not exist.'''

The problem is that in your ''edit'' plugin, the ''plugin.xml'' is referring to a package that no longer exists. Edit or delete your ''plugin.xml'' to resolve this.

You might also have a package that is empty (that is, contains no generate-able classes).

[[Category:GMF]]
[[Category:Technology]]
[[Category:Code Snippets]]