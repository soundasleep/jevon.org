---
layout: page
title:  "Accessing the AST of a OAW checks file"
author: jevon
date:   2009-08-19 11:04:03 +1200
tags:   [Java]
---

[OpenArchitectureWare](openarchitectureware.md)

It's easy to parse and access the [AST](ast.md) of an OAW checks file using the infrastructure provided:

```
/**
 * Copied from 
 * {@link org.openarchitectureware.check.CheckFacade#checkAll(String, InputStream, Collection<?>, ExecutionContext, Issues, boolean)}
 */
public void test1() throws Exception {
  String checkFile = "src/metamodel/Checks.chk";
  InputStream in = new FileInputStream(checkFile);

  ExtensionFile file = ParseFacade.file(new InputStreamReader(in), checkFile);

  for (Check check : file.getChecks()) {
    System.out.println("Message: " + check.getMsg());
    System.out.println("Constraint: " + check.getConstraint()); // abstract class Expression
  }
}
```

This was implemented in <a href="http://code.google.com/p/iaml/source/detail?r=1007">revision 1007 of IAML</a>.
