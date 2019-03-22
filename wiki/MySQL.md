---
layout: page
title:  MySQL
author: jevon
date:   2016-06-02 16:25:08 +12:00
tags:
  - Technology
---

[MySQL](MySQL.md) is a free [SQL](sql.md) relational database for [Windows](Windows.md), [Linux](Linux.md) etc.

1. [Setting up Master/Slave Replication from an existing MySQL server](Setting_up_Master/Slave_Replication_from_an_existing_MySQL_server.md)

## Importing SQL into MySQL
On [Windows](Windows.md):
`mysqlbinmysql database_name < database_file.sql`

## dpkg: dependency problems prevent configuration of mysql-server-5.5

I was getting the following error when trying to `apt-get upgrade` my MySQL, leaving my database system in a terrible mess:

```
Setting up mysql-server-core-5.5 (5.5.49-0ubuntu0.12.04.1) ...
dpkg: dependency problems prevent configuration of mysql-server-5.5:
 mysql-server-5.5 depends on mysql-server-core-5.5 (= 5.5.43-0ubuntu0.12.04.1); however:
  Version of mysql-server-core-5.5 on system is 5.5.49-0ubuntu0.12.04.1.
dpkg: error processing mysql-server-5.5 (--configure):
 dependency problems - leaving unconfigured
dpkg: dependency problems prevent configuration of mysql-server:
 mysql-server depends on mysql-server-5.5; however:
  Package mysql-server-5.5 is not configured yet.
No apport report written because the error message indicates its a followup error from a previous failure.
                                                                                                          dpkg: error processing mysql-server (--configure):
 dependency problems - leaving unconfigured
No apport report written because the error message indicates its a followup error from a previous failure.
                                                                                                          Errors were encountered while processing:
 mysql-server-5.5
 mysql-server
E: Sub-process /usr/bin/dpkg returned an error code (1)
```

Running `apt-get install -f` to try and fix the packages failed too:

The underlying cause was that the disk had run out of space.

The solution was to remove *everything*, then install from scratch:

```
dpkg -r mysql-server-5.5
dpkg -r mysql-server-core-5.5
dpkg -r mysql-client
dpkg -r mysql-client-5.5
dpgk -r mysql-server
apt-get install -f
apt-get autoremove
apt-get autoclean
apt-get install -f
apt-get install mysql-server-5.5 mysql-client-5.5
```

This didn't delete the existing database and everything is back to normal. However, now I have to fix a broken binlog...
