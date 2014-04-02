---
layout: page
title:  "Drupal"
author: jevon
date:   2014-04-02 14:54:46 +1300
---

[[Drupal]] is a [[PHP]]-based web application framework, similar to [[Symfony]] (but also wildly different and with much worse documentation).

# [[Basic non-trivial Drupal form validation example]]
# [[Creating a JSON callback page in Drupal]]

==Disabling Broken Drupal Modules==
Enabled modules are stored within the database (such as [[MySQL]]), so you will need to edit the database manually. To list all the currently enabled modules:

[code]select name,status from system where type='module';[/code]

To <a href="http://drupal.org/node/157632">disable a specific module</a>:

[code]update system set status=0 where name='alfresco_browser' and type='module';[/code]

==The CTools CSS cache directory, ctools/css could not be created due to a misconfigured files directory.==
This refers to the CSS cache directory in `sites/default/files/ctools` <a href="http://drupal.org/node/1236770#comment-4933542">(not `sites/all/modules/ctools`)</a>, and will also occur if the directory exists and a hidden file (such as `.svn`) already exists within it.

Also make sure that it is group writable and directory executable:

[code]
chmod -R a+X sites/default/files
chmod -R g+rwX sites/default/files
[/code]

==The destination directory is not configured correctly==
The Drupal notice _File temporary://xxx could not be copied, because the destination directory public://avatars is not configured correctly._ means that the folder `sites/default/files/avatars` (based on your location for `public://`) does not exist or cannot be written by Drupal.

[[Category:Drupal]]
[[Category:PHP]]