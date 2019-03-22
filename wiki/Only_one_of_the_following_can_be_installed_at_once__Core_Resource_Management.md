---
layout: page
title:  'Only one of the following can be installed at once: Core Resource Management'
author: jevon
date:   2011-09-26 16:18:37 +13:00
tags:
  - Eclipse
redirect_from:
  - "/wiki/only_one_of_the_following_can_be_installed_at_once__core_resource_management"
  - "/wiki/Only One Of The Following Can Be Installed At Once  Core Resource Management"
  - "/wiki/only one of the following can be installed at once  core resource management"
  - "/wiki/Only_One_Of_The_Following_Can_Be_Installed_At_Once__Core_Resource_Management"
---

[Eclipse](Eclipse.md)

{% include gmf-CSS.md %}<img src="/img/gmf/eclipse-crm.png" class="gmf" style="max-width: 40%;">When trying to <a href="http://code.google.com/p/iaml/wiki/Installation">install the IAML project</a>, I was getting the following error from the [Eclipse](Eclipse.md) update wizard:

```
Cannot complete the install because of a conflicting dependency.
  Only one of the following can be installed at once:
    Core Resource Management 3.5.0.v20090512
    Core Resource Management 3.5.2.R35x_v20091203-1235
    Core Resource Management 3.5.1.R35x_v20090826-0451
  Cannot satisfy dependency:
    From: Eclipse Platform 3.5.0.v20090611a
    To: org.eclipse.core.resources
  Cannot satisfy dependency:
    From: Eclipse Platform SDK 3.5.0.v20090423
    To: org.eclipse.platform.feature.group
  Cannot satisfy dependency:
    From: Eclipse SDK 3.5.0.I20090611
    To: org.eclipse.sdk.feature.group
  Cannot satisfy dependency:
    From: IAML Modelling Platform 0.6.0.201109262029
    To: org.eclipse.core.resources
```

I think the problem is that I was trying to install a plugin that requires 3.5.2 onto an [Eclipse](Eclipse.md) that is only at version 3.5.0. If you first update your Eclipse to 3.5.2 (Help > Check for Updates), you will be able to install the plugin without problems.
