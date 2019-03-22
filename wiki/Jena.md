---
layout: page
title:  Jena
author: jevon
date:   2011-03-10 14:05:17 +13:00
tags:
  - Java
  - Semantic Web
---

[Jena](Jena.md) is a [rule](rule.md) inference engine for [Java](Java.md), useful for the [Semantic Web](semantic-web.md). It handles [RDF](rdf.md) and [OWL](OWL.md). It can be integrated with [Pellet](Pellet.md).

1. [OWL Validation with Jena](OWL_Validation_with_Jena.md)
1. [Jena Pygments Lexer](Jena_Pygments_Lexer.md)

## Sample Jena validation code
From http://tech.groups.yahoo.com/group/jena-dev/message/17639.

```
OntModel model = MomUtil.leOnto("ruleTest.owl");

String validationRule = "[validationRule: (?v rb:validation on()) -> " +
  "[(?X rb:violation error('conflict', 'x86 with MacOs', ?X)) <- " +
  "(?X rdf:type laico:PersonalComputer) (?X laico:hasArchitecture ?Z) (?Z rdf:type laico:X86)" +
  "(?X laico:hasOS ?O) (?O rdf:type laico:MacOS)]]";

PrintUtil.registerPrefix("laico", "http://laico.cic.unb.br/laico#");

List rules = Rule.parseRules(validationRule);
System.out.println(rules);
Reasoner reasoner = new GenericRuleReasoner(rules);
InfModel inf = ModelFactory.createInfModel(reasoner, model);
ValidityReport validityReport = inf.validate();

if (!validityReport.isValid()) {
  System.out.println("Error!!!!");
  Iterator iterator = validityReport.getReports();
  while (iterator.hasNext()) {
  System.out.println(iterator.next());
  }
}
```

You can also see the code involved in <a href="http://code.google.com/p/iaml/source/browse/branches/2009-08-owl/org.openiaml.model.owl/src/org/openiaml/model/owl/tests/TransformEcoreToOwl.java?spec=svn1046&r=1042#98">integrating Jena validation rules into IAML</a>.

## Relative URIs are not permitted in RDF
If you get this error when trying to load a model like so:
`Model model = FileManager.get().loadModel("file:tests/invalid.simple");`

With the following model:
```
<?xml version="1.0" encoding="UTF-8"?>
<s:InternetApplication xmi:version="2.0" xmlns:xmi="http://www.omg.org/XMI" xmlns:s="http://openiaml.org/simple">
  <pages name="page 1"/>
  <pages name="page 1"/>
</s:InternetApplication>
```

This may be because your model does not have a root [XML](XML.md) namespace:
```
<?xml version="1.0" encoding="UTF-8"?>
<s:InternetApplication xmi:version="2.0" xmlns:xmi="http://www.omg.org/XMI" xmlns:s="http://openiaml.org/simple">
  <s:pages s:name="page 1"/>
  <s:pages s:name="page 1"/>
</s:InternetApplication>
```

You might also be able to get around it by adding a root [XML](XML.md) namespace through **xmlns="http://openiaml.org/simple"**.

## Enabling debug messages with Jena
```
Reasoner reasoner = ReasonerRegistry.getOWLReasoner();
reasoner.setParameter(ReasonerVocabulary.PROPtraceOn, true);
reasoner = reasoner.bindSchema(schema);
```

You will also need to set up [Log4J](Log4J.md).
