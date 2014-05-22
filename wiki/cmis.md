---
layout: page
title:  "CMIS"
author: jevon
date:   2014-05-22 17:26:43 +1200
---

[[CMIS]] is an [[API]] for interacting mostly with [[Alfresco]]; there is a [[Drupal]] CMIS module which I have forked and extended: https://github.com/soundasleep/cmis

==Drupal CMIS: DOMDocument::loadXML(): Empty string supplied as input in CMISRepositoryWrapper::extractObjectFeed()==

Make sure that your CMIS query is valid. This is suggesting that it's trying to unserialize a broken query result. For example, these are invalid or will cause this error:

* `SELECT d.*, t.* FROM %s AS d JOIN cm:titled AS t ON d.cmis:objectId = t.cmis:objectid WHERE ...`
* `SELECT d.*, t.* FROM %s AS d JOIN cm:titled AS t ON d.cmis:objectId = t.cmis:objectId WHERE ...`
* `SELECT d.*, t.cmis:title FROM %s AS d JOIN cm:titled AS t ON d.cmis:objectId = t.cmis:objectId WHERE ...`

It needs to be:

* `SELECT d.*, t.cm:title FROM %s AS d JOIN cm:titled AS t ON d.cmis:objectId = t.cmis:objectId WHERE ...`

[[Category:CMIS]]