---
layout: page
title:  "Symfony"
author: jevon
date:   2012-04-25 13:26:35 +1200
---

[[Symfony]] is a neat little application framework for [[PHP]]. More information: http://www.symfony-project.com/

# [[Symfony: csrf token: Required.]]

=Notice: Array to string conversion sfToolkit.class.php on line 329=

I got this problem when trying to implement a custom validator in the update.yml file. My solution was to split it up into a seperate named validator:

[code]names:
  name_field:
    required:       yes
    required_msg:   A name must be entered
    validators:     [valid_name, valid_name_hyphen]

valid_name:
  class:       sfRegexValidator
  param:
    match:       Yes
    match_error: The name has invalid characters or is too short/long.
    pattern:     /^[a-z0-9\-]{2,63}$/im

valid_name_hyphen:
  class:       sfRegexValidator
  param:
    match:       No
    match_error: The name cannot start or end with a hyphen.
    pattern:     /^(-.+|.+-)$/im[/code]

=Get the count of a column in Propel=
The simplest solution is to just use the methods provided in the Propel model:

[code]public function getArticles($criteria, $conn);
public function countArticles($criteria, $distinct, $conn);[/code]

Or, you can do it manually:

[code]public function countArticles(...} {
  $criteria = new Criteria();
  $criteria->add(ArticlePeer::USER_ID, $this->getId());
  return ArticlePeer::doCount($criteria);
}[/code]

=Global application variables=
I wanted to share certain variables across multiple Symfony applications. My solution:

'''apps/myapp/config/config.php'''
Add to the end of this file, and to every other config.php file in your applications:
[code]// load additional config
sfConfig::add(sfYaml::load(sfConfig::get('sf_config_dir').'/global.yml'));[/code]

'''config/global.yml'''
Create a new file here:
[code]# global application variables
app_password_salt:    1234
app_email_sender:     bot@jevon.org[/code]

You can now access these variables like normal, e.g.
[code]return sfConfig::get('app_password_salt');     // will return '1234'[/code]

However these variables will override other existing config variables. Things still left to do: Make it accept "normal" yaml structure; make it so that the config variables do not overwrite local settings.

OR: You can use settings.yml to create global settings with the sf_ prefix (read <a href="http://www.symfony-project.com/book/1_0/05-Configuring-Symfony#The%20sfConfig%20Class">the end of this article</a>).

=Enabling Validation .yml for both GET and POST=
Normally a myAction.yml file in the validate/ directory will only work on POST requests. You can change this to work on both GET and POST by adding this to your myAction.yml file:

[code]methods:
  - get
  - post

fields:
  ... and so on[/code]

="[propel-sql-exec] SQLSTATE[HY000]: General error: 1005 Can't create table"=
For more information on the error, you can log into [[MySQL]] as root and <a href="http://oldforum.symfony-project.org/index.php/m/88845/">execute the command `SHOW ENGINE INNODB STATUS`</a>:

[code]------------------------
LATEST FOREIGN KEY ERROR
------------------------
110816 15:53:44 Error in foreign key constraint of table ticketsfmini/ticket:

 FOREIGN KEY (`event_id`)
 REFERENCES `event` (`id`)
 ON DELETE SET NULL,
 INDEX `ticket_FI_2` (`user_id`),
 CONSTRAINT `ticket_FK_2`
 FOREIGN KEY (`user_id`)
 REFERENCES `user` (`id`)
 ON DELETE SET NULL
 )Type=InnoDB:
You have defined a SET NULL condition though some of the
columns are defined as NOT NULL.[/code]

Here, this error was occuring because I was trying to create a table with two foreign key references with `onDelete` set to `setnull`... but `null`s are not allowed, as defined by `required`:

[code]event_id: { type: integer, foreignTable: event, foreignReference: id, required: true, onDelete: setnull }[/code]

Remove the "`required: true`" declaration and this error message will not appear.

[[Category:Article]]
[[Category:Language]]
[[Category:Todo]]
[[Category:Programming]]
[[Category:Web]]