---
layout: page
title:  "CMIS"
author: jevon
date:   2014-05-22 17:45:28 +1200
tags:   [CMIS]
---

[CMIS](cmis.md) is an [API](api.md) for interacting mostly with [Alfresco](alfresco.md); there is a [Drupal](drupal.md) CMIS module which I have forked and extended: https://github.com/soundasleep/cmis

## Selector must be specified for child constraint (IN_TREE) and join

If you are using an `IN_TREE` child constraint along with a `JOIN`, you must define which view the `IN_TREE` constraint applies to:

* `SELECT d.*, t.* FROM cmis:document AS d JOIN cm:titled AS t ON d.cmis:objectId = t.cmis:objectId WHERE IN_TREE('folder')` is invalid.
* `SELECT d.*, t.* FROM cmis:document AS d JOIN cm:titled AS t ON d.cmis:objectId = t.cmis:objectId WHERE IN_TREE(d, 'folder')` is valid.
