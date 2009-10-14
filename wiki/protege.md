---
layout: page
title:  "Protege"
author: jevon
date:   2009-10-15 11:46:53 +1300
---

[[Protege]] is an [[OWL]] editor written in [[Java]]. See also [[Jena]] and [[Pellet]].{{gmf-css}}

# <a href="http://article.gmane.org/gmane.comp.misc.ontology.protege.owl/30337">Integrating Protege SWRL rules into a Java application</a>

==IllegalArgumentException==
[code]IllegalArgumentException: null
    java.net.URI.create(Unknown Source)  
    org.protege.editor.owl.ui.frame.OWLAnnonymousIndividualAnnotationValueEditor.setEditedObject(OWLAnnonymousIndividualAnnotationValueEditor.java:88)
    org.protege.editor.owl.ui.frame.OWLAnnotationEditor.setAnnotation(OWLAnnotationEditor.java:132)
    ...[/code]

I got this error when I was opening an OWL ontology with the following definition line, and was trying to create new Annotations:
[code]<owl:Ontology rdf:about="http://openiaml.org/model0.2#"/>[/code]

The cause of the exception was actually:

[code]Caused by: java.net.URISyntaxException: Illegal character in fragment at index 29: http://openiaml.org/model0.2##genid445186983782686
        at java.net.URI$Parser.fail(Unknown Source)
        at java.net.URI$Parser.checkChars(Unknown Source)
        at java.net.URI$Parser.parse(Unknown Source)
        at java.net.URI.<init>(Unknown Source)
        ... 35 more[/code]

Changing it to this resolved the error:
[code]<owl:Ontology rdf:about="http://openiaml.org/model0.2"/>[/code]

==Writing Property Chains==

To write a <a href="http://semwebprogramming.org/?p=175">property chain</a> in Protege, you need to use the '''o''' operator, e.g.:<img src="/img/gmf/protege-chains.png" class="gmf">

[code]parent o brother -> uncle[/code]

[[Category:Java]]
[[Category:OWL]]