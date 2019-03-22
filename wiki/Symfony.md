---
layout: page
title:  Symfony
author: jevon
date:   2013-02-17 20:44:47 +13:00
tags:
  - Article
  - Language
  - Programming
  - Web Development
redirect_from:
  - "/wiki/symfony"
---

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
columns are defined as NOT NULL.
```

Here, this error was occuring because I was trying to create a table with two foreign key references with `onDelete` set to `setnull`... but `null`s are not allowed, as defined by `required`:

```
event_id: { type: integer, foreignTable: event, foreignReference: id, required: true, onDelete: setnull }
```

Remove the "`required: true`" declaration and this error message will not appear.
