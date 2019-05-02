---
layout: page
title:  Setting up an EMF/JET testing project with JUnit and Eclipse
author: jevon
date:   2008-10-17 08:29:17 +13:00
tags:
  - Article
  - Technology
  - GMF
  - EMF
redirect_from:
  - "/wiki/Setting up an EMF/JET testing project with JUnit and Eclipse"
  - "/wiki/Setting_up_an_EMF/JET_testing_project_with_JUnit_and_Eclipse"
  - "/wiki/Setting up an EMF JET testing project with JUnit and Eclipse"
---

[GMF Code Samples](GMF_Code_Samples.md) / [GMF](GMF.md) / [EMF](EMF.md)

So the idea of this article is to set up an environment where you can test a [JET](JET.md) plugin in terms of its ??? from an [EMF](EMF.md) model, using [JUnit](JUnit.md) so it is easy to test the output.

1. Get a [JET](JET.md) plugin working through Eclipse and making it possible to run it in a runtime application (_org.openiaml.test.uml3.generate.ejet_). {% include tag-todo.md comment="link to actual project" %}

{% include gmf-css.md %}<img src="/img/gmf/jet-testing.png" class="gmf">

### Create the project with dependencies:

1. Create a new project for your tests (_org.openiaml.test.uml3.tests_).
1. Right click the project and go PDE tools > Convert Projects to Plug-in Projects...
1. Open up the _build.properties_ file and select the _Dependencies_ tab - we will be adding some additional build requirements
1. Add _org.eclipse.jet_, _org.eclipse.core.runtime_, _org.eclipse.core.resources_, _org.openiaml.test.uml3.generate.ejet_ and _org.junit_ (3.x).

### Load the sample files:

1. Create a folder called 'sample' in the project directory, and place your sample models there.

### Create the runtime workspace:

1. Create a folder called _junit-workspace_ in the project directory.
1. We need to initialise this workspace so that our test cases may write to it.
1. Start a new [[Eclipse]] instance and use this as the root workspace.
1. Create a new empty project called _sample_.
1. Save and close that editor.

### Create the test case:

1. Create a new TestCase which calls the JET template editor.
1. An example is provided in http://iaml.svn.sourceforge.net/viewvc/iaml/trunk/examples/jet/TestJETTransform.java?view=markup

### Set up the test case runtime option in Eclipse:

1. Select the TestCase and go Run As > Open Run Dialog...
1. If it doesn't already exist, select JUnit Plug-in Test and create a New launch configuration
1. Select the _Main_ tab, and change the _Workspace Data Location_ to the _junit-workspace_ folder created before (click on the _Workspace..._ button)
1. Disable the _clear_ option, or at least tell it to not delete the workspace data (we need the workspace to remain initialised between runs)
1. Make sure that all your EMF and JET generation plugins are enabled on the _Plugins_ tab

You should now be able to run the JUnit test and it will generate the content into an _output_ folder in the _junit-workspace_ workspace folder, for example. Once you have generated this content, you could then use various JUnit tests to test the generated content, e.g. loading XML files and checking the content, etc.

## An easier way

There's an easier way to do most of this -- in particular, we can just get the [JUnit](JUnit.md) test to create the runtime workspace and associated files by itself! But this will only work if you are running your test cases as JUnit Plug-in Test in [Eclipse](Eclipse.md). (Reference: <a href="http://wiki.eclipse.org/FAQ_How_are_resources_created%3F">Creating Eclipse projects</a>)

In your setUp(), you can create a new project programatically:

```
protected IProject createProject() throws CoreException {
  // create a new project automatically
  IWorkspace workspace = ResourcesPlugin.getWorkspace();
  IWorkspaceRoot root = workspace.getRoot();
  IProject project = root.getProject(PROJECT_NAME);
  // delete any existing ones
  if (project.exists()) {
    project.delete(false, monitor);
  }

  // create it
  project.create(monitor);
  assertTrue(project.exists());
  project.open(monitor);

  return project;
}
```

You can now access files in this created project easily:

```
public void testSitemap() {
  doTransform("models/simple.iaml");
  IFile sitemap = project.getFile("output/sitemap.html");
  assertTrue("sitemap " + sitemap + " exists", sitemap.exists());
}
```

The source code for this easier-to-run JUnit test is <a href="http://code.google.com/p/iaml/source/browse/branches/2008-10-codegen-jet/org.openiaml.model.tests.codegen/src/org/openiaml/model/tests/codegen/SimpleTestCase.java?spec=svn184&r=184">available on SVN</a>.
