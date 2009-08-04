---
layout: page
title:  "Closed world assumption in OWL"
author: jevon
date:   2009-08-05 07:46:19 +1200
---

[[OWL]]

By default, [[OWL]] operates on an open world assumption, i.e. if you specify the following constraint:

[code]Declaration(Class(Container))
SubClassOf(Container ObjectMinCardinality(2 contains Node))[/code]

This will by default never throw an exception, because in an open world there may always be more elements which would satisfy the constraint.

The solution, as mentioned by <a href="http://clarkparsia.com/pellet/faq/closed-world/">the Pellet FAQ</a>, is to force the world closed. This can be achieved by making owl:Thing equivalent only to the individuals defined in your world:

[code]SubClassOf(owl:Thing ObjectOneOf(Node1 Node2 Node3 SampleContainer))[/code]

This can be achieved in Protege as on the bottom, or by selecting "Superclasses" and typing in the following. In Protege 4.0, no help or auto-complete pops up.

[code]{Node1, Node2, Node3, SampleContainer}[/code]

This might still not work, because in your model, you may only be making positive assertions about the world, so unstated assertions may still be true. As a result, you might also have to set negative assertions for what is definitely '''not''' true:

[code]Declaration(Individual(SampleContainer))
ClassAssertion(SampleContainer Container)
DifferentIndividuals(Node1 Node2 Node3 SampleContainer)
ObjectPropertyAssertion(contains SampleContainer Node3)
NegativeObjectPropertyAssertion(contains SampleContainer Node1)
NegativeObjectPropertyAssertion(contains SampleContainer Node2)
NegativeObjectPropertyAssertion(contains SampleContainer SampleContainer)[/code]

{{gmf-css}}<img src="/img/gmf/protege-oneOf.png" class="gmf-left">

<img src="/img/gmf/protege-individuals.png" class="gmf-left">

[[Category:OWL]]
[[Category:Semantic Web]]