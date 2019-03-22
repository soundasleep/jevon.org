---
layout: page
title:  Pellet
author: jevon
date:   2009-10-15 10:57:24 +13:00
tags:
  - Java
  - Semantic Web
  - Reasoners
  - Logic
  - OWL
---

See also [OWL](owl.md), [Jena](jena.md).

1. <a href="http://clarkparsia.com/pellet/tutorial/">Pellet/OWL Tutorial</a>
1. <a href="http://clarkparsia.com/pellet/tutorial/iswc09">Pellet/OWL Tutorial (2)</a>

## No query handler found for rdf:type
I was getting the following warning messages in the console:

```
3281 [main] DEBUG com.hp.hpl.jena.reasoner.rulesys.FBRuleInfGraph  - Adding rule [ (?a rdf:type http://openiaml.org/model0.2#CompositeCondition) -> (?a rdf:type 'min(http://openiaml.org/model0.2#conditions '0'^^http://www.w3.org/2001/XMLSchema#int)'^^urn:x-hp-jena:Functor) ]
31/08/2009 22:09:56 org.mindswap.pellet.jena.graph.query.GraphQueryHandler findTriple
WARNING: No query handler found for http://www.w3.org/2000/01/rdf-schema#subClassOf http://www.w3.org/1999/02/22-rdf-syntax-ns#type http://www.w3.org/1999/02/22-rdf-syntax-ns#Property
31/08/2009 22:09:56 org.mindswap.pellet.jena.graph.query.GraphQueryHandler findTriple
WARNING: No query handler found for http://www.w3.org/2000/01/rdf-schema#subClassOf http://www.w3.org/1999/02/22-rdf-syntax-ns#type http://www.w3.org/1999/02/22-rdf-syntax-ns#Property
31/08/2009 22:09:56 org.mindswap.pellet.jena.graph.query.GraphQueryHandler findTriple
WARNING: No query handler found for http://www.w3.org/2002/07/owl#equivalentClass http://www.w3.org/1999/02/22-rdf-syntax-ns#type http://www.w3.org/1999/02/22-rdf-syntax-ns#Property
```

The code that I was using to execute my Pellet/[Jena](jena.md) reasoner was the following:

```
IFile f = project.getFile("input.owl");
OntModel model = ModelFactory.createOntologyModel( PelletReasonerFactory.THE_SPEC );
model.read(f.getContents(), "http://openiaml.org/test");

Reasoner reasoner = ReasonerRegistry.getOWLReasoner();
reasoner.setParameter(ReasonerVocabulary.PROPtraceOn, true);
reasoner = reasoner.bindSchema(schema); // would warn here
```

Following inspiration from <a href="http://lists.mindswap.org/pipermail/pellet-users/2004-December/000052.html">this mailing list post</a>, I changed it from the OWLReasoner to the PelletReasoner, which resolved this warning completely:

```
IFile f = project.getFile("input.owl");
OntModel model = ModelFactory.createOntologyModel( PelletReasonerFactory.THE_SPEC );
model.read(f.getContents(), "http://openiaml.org/test");

Reasoner reasoner = new PelletReasoner(); // no more problems
reasoner.setParameter(ReasonerVocabulary.PROPtraceOn, true);
reasoner = reasoner.bindSchema(schema);
```

Upon further investigation, it seems these errors were being caused by the **Reasoner.bindSchema()** method. Perhaps these errors indicate that the current model cannot support some of the predicates asserted - e.g. Jena can't support OWL 2, unless the following <a href="http://jena.sourceforge.net/inference/index.html#RULEsyntax">@include is used</a>:

`@include <OWL>.`
