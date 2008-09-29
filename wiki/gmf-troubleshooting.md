---
layout: page
title:  "GMF Troubleshooting"
author: jevon
date:   2008-09-29 13:39:46 +1300
---

Part of [[Creating a new GMF Editor]] and [[GMF Diagram Partitioning]]. Also see [[GMF]].

{{gmf-troubleshooting}}

{{gmf-css}}<img src="/img/emf-errors-1.png" class="gmf">'''If you end up with items in your generated tool palette that have no icons and cannot be dragged onto the canvas:'''

You've tried to add too many elements to the definition. For example, the diagram on the right was generated with the following code:

<div class="gmf_code">
  <ul>
  <li>.gmfgraph:</li>
    <ul>
    <li>Page: set as node</li>
      <ul>  
      <li>title: set as label</li>
      <li>content: set as label</li>
      <li>links: set as link '''-- shouldn't be selected'''</li>
      </ul>
    <li>Link: set as node '''-- should be a link'''</li>
      <ul>
      <li>link: set as link '''-- shouldn't be selected'''</li>
      </ul>
    </ul>
    
  <li>.gmfgraph:</li>
    <ul>
    <li>Page: set as node</li>
      <ul>
      <li>links: set as link '''-- shouldn't be selected'''</li>
      </ul>
    <li>Link: set as node '''-- should be a link'''</li>
      <ul>
      <li>set as link '''-- shouldn't be selected'''</li>
      </ul>
    </ul>
  </ul>
</div>

---
'''To edit the model after generating the application...'''

<div class="gmf_code">
<ul>
  <li>After changing the .ecore file</li>
    <ul>
    <li>Right click .gmfmodel</li>
    <li>Select "Reload..." and select your .ecore file</li>
    <li>It should load the model again</li>
    </ul>
  </li>
</ul>
</div>

However, my version of [[GMF]] doesn't properly reload changes, especially to attributes of the .ecore (for example, setting 'Containment' to true). The best solution in this case is to just delete the whole .genmodel and recreate it. '''Make sure you set the base package again!!!'''

---
<img src="/img/emf-errors-2.png" class="gmf">'''Cannot place a new object onto the Canvas'''

This problem occurs when you try and place something on the canvas, which cannot be contained in it. For example, you're trying to insert a HTML into a SPAN.

The solution is to open the .ecore model for the canvas element (e.g. Application), and set it's 'Containment' property for the problematic reference to true, like so:

<img src="/img/emf-errors-2-1.png" class="gmf-left"> <img src="/img/emf-errors-2-2.png" class="gmf-left">

Make sure you then properly re-generate the .genmodel and re-generate the diagram code.

---
<img src="/img/emf-errors-3.png" class="gmf">'''Error: Save could not be completed: The object [..] is not contained in a resource.'''

This error occurs when you try to save a model like so:

[code]<a>
  <b />
  <b />
</a>[/code]

But items of ''b'' cannot be contained in ''a''. The solution to this is to set the 'Containment' property for ''a'''s ''b'' to true. You then have to recreate the .genmodel (follow instructions above) and go through the rest of the generation instructions.

Alternatively, if you have been changing the [[Ecore]] model around and are trying to open an old model file, it may be because [[GMF]] no longer knows what to do with the old elements - it doesn't want to delete them, but it can't place them anywhere else, so it crashes out. You might have to edit your model manually.

[[Category:Technology]]
[[Category:Eclipse]]
[[Category:GMF]]