---
layout: page
title:  "Inferring properties based on types in OWL"
author: jevon
date:   2009-10-15 10:42:49 +1300
tags:   [Semantic Web, OWL, Code Snippets]
---

[OWL](owl.md), [Pellet](pellet.md), [Jena](jena.md)

Consider that your ontology is structured similar to the following:{% include gmf-css.md %}

<img src="/img/gmf/owl-chains1.png" class="gmf-left">

However, consider also that you only want to select EventTriggers which eventually NavigateWire to a Page. Through [OWL](owl.md) 1.1 this can be achieved through property chaining. We will eventually end up with a new object property called **eventToPage**:

<img src="/img/gmf/owl-chains2.png" class="gmf-left">

First, load up your initial ontology and create a new ontology for your extensions. This can be done in [Protege](protege.md): [OWL Validation with Jena](owl-validation-with-jena.md).

Inspired by this discussion, we are going to add a property **isPage** which can only exist (and will only exist) for instances of **Page**. Create a new object property "isPage", and to the definition of "Page", add a subclass "isPage some owl:Thing". Thanks to the [open world assumption](open-world-assumption.md), all instances of "Page" must therefore contain this property.

<img src="/img/gmf/owl-chains-protege1.png" class="gmf-left">

We then add a property "toPage" which is a "to" property that points to a "Page". This is where it gets a little hacky. In Protege, we specify the domain as WireEdge, the range as Page, and define the property chain as the following. The **o** is the actual letter "o", but do not enter in the "-> toPage" (this is added automatically).

`to o isPage o inv(isPage) -> toPage`

<img src="/img/gmf/owl-chains-protege2.png" class="gmf-left">

Finally, we define an "eventToPage" property, which is all "outEdges" that connect to a "toPage".

`outEdges o toPage -> eventToPage`

<img src="/img/gmf/owl-chains-protege3.png" class="gmf-left">

To check that instances of this is actually being created, you can <a href="http://lists.owldl.com/pipermail/pellet-users/2009-October/004027.html">query the Jena API</a> like so: (More code forthcoming.) {% include tag-todo.md comment="add actual Jena code in SVN somewhere" %}

```
OntModel schema = ModelFactory.createOntologyModel( PelletReasonerFactory.THE_SPEC );
schema.read(<source.owl>, null);
schema.read(<extension.owl>, null);

Reasoner reasoner = PelletReasonerFactory.theInstance().create().bindSchema(schema);
Model model = FileManager.get().loadModel("file:" + rdf);
InfModel inf = ModelFactory.createInfModel(reasoner, model);

Property index = inf.getProperty("http://openiaml.org/verification/2009/infiniteRedirect.owl#eventToPage");
Iterator<Statement> it = inf.listStatements(null, index, (RDFNode) null);
while (it.hasNext()) {
  Statement s = it.next();
  System.out.println(PrintUtil.print(s));
}
```

If you are not getting any results, make sure that [Protege](protege.md) has not mangled up your namespaces; edit the OWL file manually and check that all property references are <a href="http://lists.owldl.com/pipermail/pellet-users/2009-October/004029.html">pointing to the correct URIs</a>.
