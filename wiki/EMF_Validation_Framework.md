---
layout: page
title:  EMF Validation Framework
author: jevon
date:   2011-05-17 14:11:08 +12:00
tags:
  - EMF
redirect_from:
  - "/wiki/EMF Validation Framework"
---

[EMF](EMF.md)

## Children elements are not validated
In the generated EMF validator example adapter (EValidatorAdapter), there seems to be a weird bug where children elements are not validated correctly. One solution to this is to modify the generated `hasProcessed()` method, as I did <a href="http://code.google.com/p/iaml/source/detail?r=2930">in this revision</a>:

```
private boolean hasProcessed(EObject eObject, Map<Object, Object> context) {
    // for some reason, the default adapter was returning "true"
    // for children objects of a given object. as a hack, this method
    // now <em>always</em> returns false regardless.
    return false;
  }
```

## org.eclipse.ocl.SemanticException: Cannot find operation (eContainer()) for the type (BuiltinProperty)

See the <a href="http://wiki.eclipse.org/MDT/OCL/FAQ#How_do_I_invoke_methods_such_as_eContainer.28.29.2C_eContents.28.29.2C_eGet.28.29.3F">MDT/OCL FAQ</a>, in particular "How do I invoke methods such as eContainer(), eContents(), eGet()?":

```
ParsingOptions.setOption(ocl.getEnvironment(),
    ParsingOptions.implicitRootClass(ocl.getEnvironment()),
    EcorePackage.Literals.EOBJECT);
```

(This of course assumes you have a handle to the [OCL](OCL.md) environment, which may not be available if you are simply extending the default generated EMF OCL validator adapter.)

Related: <a href="https://bugs.eclipse.org/bugs/show_bug.cgi?id=152003">Bug 152003</a>
