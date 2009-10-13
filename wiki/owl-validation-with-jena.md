---
layout: page
title:  "OWL Validation with Jena"
author: jevon
date:   2009-10-14 09:53:39 +1300
---

[[OWL]], [[Jena]], [[Protege]], [[Semantic Web]]{{gmf-css}}{{tag-todo|join the code together into one block}}

If we have an [[OWL]] model in '''source.owl''', we can use [[Protege]] to extend instances of classes in this model like so:

# extended:ExtendedClass &lt;-- source:Class

To achieve this in Protege 4.0:

<img src="/img/gmf/protege-import.png" class="gmf">

# Load '''source.owl''' in Protege 4.0.
# Create a new ontology file, and open it in the current window.
# Make sure this ontology file is saved ''in the same directory'' as '''source.owl''': Protege <a href="https://mailman.stanford.edu/pipermail/p4-feedback/2008-September/001241.html">expects it to be in the same folder</a>.
# Once loaded, go into ''Ontology Imports'' and select ''New'' for a ''Direct Import''
# Select "Import an ontology that has already been loaded/created".
# If the import is "Not Loaded", make sure it is saved in the same directory, or try reloading the ontologies.

We can now define an ''ExtendedClass'':

# Select the ''Classes'' tab
# Create a new Class called "ExtendedClass"
# In ''Equivalent Classes'', select "Class" from the source model

In order to import this into [[Jena]] and select instances of this extended model, you can use code similar to the following (this code is using the [[Pellet]] reasoner):

[code]IFile rdf = ...;
OntModelSpec ontModelSpec = PelletReasonerFactory.THE_SPEC; // or OntModelSpec.OWL_MEM
Reasoner reasoner = new PelletReasoner(); // or ReasonerRegistry.getOWLReasoner();[/code]

[code]PrintUtil.registerPrefix("source", "http://openiaml.org/source#"); // sets up source: prefix
OntModel schema = ModelFactory.createOntologyModel( ontModelSpec );
// load source.owl
schema.read(getSourceOWL(), null /* for resolving relative URIs */);[/code]

[code]// enable debug messages?
// reasoner.setParameter(ReasonerVocabulary.PROPtraceOn, true);

// load extension.owl
schema.read(getValidationOWL(), null /* for resolving relative URIs */);
reasoner = reasoner.bindSchema(schema);[/code]

[code]// load an RDF instance
Model model = FileManager.get().loadModel("file:" + rdf.getLocation().toString());

// and validate that it conforms to the OWL model
InfModel inf = ModelFactory.createInfModel(reasoner, model);
ValidityReport valid = inf.validate();

if (!valid.isValid()) {
  throw new RuntimeException("Model '" + rdf.getName() + "' was not valid to OWL schema");
}

String uri = "http://openiaml.org/validation/owl/Ontology1255477538318.owl#ExtendedClass";
Resource problem = inf.getResource(uri);
Iterator<Statement> it = inf.listStatements(null, RDF.type, problem);
while (it.hasNext()) {
  // will select all instances of ExtendedClass <-- Class
  throw new RuntimeException(PrintUtil.print(it.next()));
}[/code]

[[Category:Semantic Web]]
[[Category:Code Snippets]]
[[Category:Java]]
[[Category:OWL]]