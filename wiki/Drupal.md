---
layout: page
title:  "Drupal"
author: jevon
date:   2014-05-07 17:27:26 +1200
tags:   [Drupal, PHP]
---

[Drupal](drupal.md) is a [PHP](php.md)-based web application framework, similar to [Symfony](symfony.md) (but also wildly different and with much worse documentation).

1. [Basic non-trivial Drupal form validation example](basic-non-trivial-drupal-form-validation-example.md)
1. [Creating a JSON callback page in a Drupal module](creating-a-json-callback-page-in-a-drupal-module.md)

## Disabling Broken Drupal Modules
Enabled modules are stored within the database (such as [MySQL](mysql.md)), so you will need to edit the database manually. To list all the currently enabled modules:

`select name,status from system where type='module';`

To <a href="http://drupal.org/node/157632">disable a specific module</a>:

`update system set status=0 where name='alfresco_browser' and type='module';`

## The CTools CSS cache directory, ctools/css could not be created due to a misconfigured files directory.
This refers to the CSS cache directory in `sites/default/files/ctools` <a href="http://drupal.org/node/1236770#comment-4933542">(not `sites/all/modules/ctools`)</a>, and will also occur if the directory exists and a hidden file (such as `.svn`) already exists within it.

Also make sure that it is group writable and directory executable:

```
chmod -R a+X sites/default/files
chmod -R g+rwX sites/default/files
```

## The destination directory is not configured correctly
The Drupal notice _File temporary://xxx could not be copied, because the destination directory public://avatars is not configured correctly._ means that the folder `sites/default/files/avatars` (based on your location for `public://`) does not exist or cannot be written by Drupal.

## Fatal error: Class 'CMISService' not found

If you are using the CMIS 2.x module, make sure that you have placed the CMIS library into `sites/all/libraries/cmis-phplib/cmis-lib.php`, and refresh your cache.
