---
layout: page
title:  "GMF Drag Drop"
author: jevon
date:   2008-12-15 07:37:08 +1300
---

Part of a never-ending series of articles on [[GMF]].

{{gmf-css}}<img src="/img/gmf/drag-drop.png" class="gmf">If you want to be able to drag and drop elements from the domain navigator model to a view part, like on the right, GMF can actually generate all of this code for you! All you need to do is follow <a href="http://www.eclipse.org/newsportal/article.php?id=14391&group=eclipse.modeling.gmf#14391">these instructions</a>. That is:

# Set ''.gmfgen > Editor > Diagram > Contains Shortcuts To'' to all of the file extensions that contain the elements you want to be able to create shortcuts to.
# Set ''.gmfgen > Editor > Diagram > Shortcuts Provided For'' to all the Model IDs (''.gmfgen > Editor > Editor > Model ID'') that you'd like this component to provide shortcut functionality to.

When it creates these '''GMF Shortcuts''', they appear and operate just like normal elements except they are not represented as part of the domain model. 

'''Note''' that this will only work if the specific ''.gmfgen > Editor > Navigator > Generate Domain Model Navigator'' is set to true. Also it is probably a good idea to only have '''one''' .gmfgen with this set to true.

You might need to enable [[GMF Diagram Partitioning]] in order for this to be of any use.

This is a good solution to representing associations between elements on different levels:

[code]<container>
  <foo />
</container>
<container>
  <reference link_to="//@component.0/@foo.0" />
</container>[/code]

And you can still double-click them to open the original element in their original editor.

For some more ideas of what you can achieve after adding shortcuts to your model, check out [[GMF Code Samples]].

As far as I understand it, you can only render shortcut elements for those which can actually be contained in the root element. (<a href="http://www.eclipse.org/newsportal/article.php?id=15226&group=eclipse.modeling.gmf#15226">newsgroup posting</a>)

==My shortcut elements don't display the shortcut icon==
The easiest way to solve this problem is just to add the Editor IDs for all of your models to all other ''.gmfgen > Editor > Diagram > Shortcuts Provided For''s, so every model can contain every model element. You still won't be able to drag elements into the model that wouldn't make sense displayed there.

[[Category:GMF]]
[[Category:Technology]]