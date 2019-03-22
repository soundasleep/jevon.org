---
layout: page
title:  OWL
author: jevon
date:   2011-07-12 11:21:25 +12:00
tags:
  - Semantic
  - OWL
---

[OWL](owl.md) is the [Web Ontology Language](web-ontology-language.md).

1. [Closed world assumption in OWL](closed-world-assumption-in-owl.md)
1. [Inferring properties based on types in OWL](inferring-properties-based-on-types-in-owl.md)
1. [OWL Functional Pygments Style](owl-functional-pygments-style.md)

External references:
1. <a href="http://article.gmane.org/gmane.comp.misc.ontology.protege.owl/30337">Integrating Protege with SWRL/OWL rules into Java</a>
1. <a href="http://clarkparsia.com/pellet/tutorial/">Pellet/OWL Tutorial</a>
1. <a href="http://clarkparsia.com/pellet/tutorial/iswc09">Pellet/OWL Tutorial (2)</a>

## Data type cannot be the empty string
Works in Protege 4.0.

```
Declaration(Class(Page))
SubClassOf(Page Node)
SubClassOf(Page ObjectComplementOf(DataHasValue(name ""^^xsd:string)))

Declaration(DataProperty(name))
DataPropertyDomain(name Page)
DataPropertyRange(name xsd:string)

Declaration(Individual(ValidPage))
DataPropertyAssertion(name ValidPage "test")

Declaration(Individual(InvalidPage))
ClassAssertion(InvalidPage Page)
DataPropertyAssertion(name InvalidPage "")
```

## Edge source cannot be Edge target
i.e., Edge.source != Edge.target. Works in Protege 4.0.

```
FunctionalObjectProperty(from)
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
ClassAssertion(NodeA Node)
```
