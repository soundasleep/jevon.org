---
layout: page
title:  "OWL"
author: jevon
date:   2011-07-12 11:21:25 +1200
---

[[OWL]] is the [[Web Ontology Language]].

# [[Closed world assumption in OWL]]
# [[Inferring properties based on types in OWL]]
# [[OWL Functional Pygments Style]]

External references:
# <a href="http://article.gmane.org/gmane.comp.misc.ontology.protege.owl/30337">Integrating Protege with SWRL/OWL rules into Java</a>
# <a href="http://clarkparsia.com/pellet/tutorial/">Pellet/OWL Tutorial</a>
# <a href="http://clarkparsia.com/pellet/tutorial/iswc09">Pellet/OWL Tutorial (2)</a>

==Data type cannot be the empty string==
Works in Protege 4.0.

[code]Declaration(Class(Page))
SubClassOf(Page Node)
SubClassOf(Page ObjectComplementOf(DataHasValue(name ""^^xsd:string)))

Declaration(DataProperty(name))
DataPropertyDomain(name Page)
DataPropertyRange(name xsd:string)

Declaration(Individual(ValidPage))
DataPropertyAssertion(name ValidPage "test")

Declaration(Individual(InvalidPage))
ClassAssertion(InvalidPage Page)
DataPropertyAssertion(name InvalidPage "")[/code]

==Edge source cannot be Edge target==
i.e., Edge.source != Edge.target. Works in Protege 4.0.

[code]FunctionalObjectProperty(from)
ObjectPropertyDomain(from Wire)
ObjectPropertyRange(from Node)
DisjointObjectProperties(from to)

FunctionalObjectProperty(to)
ObjectPropertyDomain(to Wire)
ObjectPropertyRange(to Node)
DisjointObjectProperties(to from)

Declaration(Individual(InvalidSyncWire))
ClassAssertion(InvalidSyncWire SyncWire)
ObjectPropertyAssertion(to InvalidSyncWire NodeA)
ObjectPropertyAssertion(from InvalidSyncWire NodeA)

Declaration(Individual(NodeB))
ClassAssertion(NodeB Node)

Declaration(Individual(NodeA))
ClassAssertion(NodeA Node)[/code]

[[Category:Semantic]]
[[Category:OWL]]