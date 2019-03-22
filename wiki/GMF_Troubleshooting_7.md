---
layout: page
title:  GMF Troubleshooting 7
author: jevon
date:   2011-04-28 12:30:10 +12:00
tags:
  - GMF
  - Technology
  - Code Snippets
redirect_from:
  - "/wiki/gmf_troubleshooting_7"
  - "/wiki/Gmf Troubleshooting 7"
  - "/wiki/gmf troubleshooting 7"
  - "/wiki/Gmf_Troubleshooting_7"
---

**My gmfgen is generating code that refers to an ItemProviderAdapterFactory that does not exist.**

The problem is that in your _edit_ plugin, the _plugin.xml_ is referring to a package that no longer exists. Edit or delete your _plugin.xml_ to resolve this.

You might also have a package that is empty (that is, contains no generate-able classes).
