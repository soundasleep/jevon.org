---
layout: page
title:  "Setting up Master/Slave Replication from an existing MySQL server"
author: jevon
date:   2014-09-29 22:06:44 +1300
tags:   [MySQL]
---

[MySQL](MySQL.md)

1. <a href="http://firelitdesign.blogspot.co.nz/2011/04/how-to-fix-mysql-replication-error-1236.html">Got fatal error 1236: 'Client requested master to start replication from impossible position'</a>

Currently https://cryptfolio.com is running off a single MySQL server. I want to switch this to a master/slave setup, which I intend will:

1. increase performance (0.10% of queries are blocked by updates), but not too much since the database is very write-heavy (59% of queries)
1. increase visible performance greatly (often graphs are blocked by pending writes especially to `summary_instances` and `balances` tables)
1. improve reliability (if the slave goes down, I can point web servers to master; if the master goes down, I can enable read-only site mode)
1. cost more money to run (since I'll be running two nodes rather than one) but still much cheaper (and more interesting) than going through S3
1. databases suitable for memcachedb/keystores are not yet used that heavily

I'll be using the <a href="http://dev.mysql.com/doc/refman/5.5/en/replication-howto.html">MySQL guide</a> to set up replication and cover my steps here.

## 1. Setup master
<a href="http://dev.mysql.com/doc/refman/5.5/en/replication-howto-masterbaseconfig.html">16.1.1.1 Setting the Replication Master Configuration</a>

1. Edit `my.cnf` and set:
```
[mysqld]
log-bin=mysql-bin            # enable binary logging
server-id=1                  # this ID cannot be used by any other server
```
1. Create a <a href="http://dev.mysql.com/doc/refman/5.5/en/replication-howto-repuser.html">new slave user</a>
```
CREATE USER 'repl'@'%.mydomain.com' IDENTIFIED BY 'slavepass';
GRANT REPLICATION SLAVE ON *.* TO 'repl'@'%.mydomain.com';
```
1. Restart server

## 2. Setup slave

1. Purchase new Linode.
1. Set up <a href="https://library.linode.com/databases/mysql/ubuntu-12.04-precise-pangolin">MySQL</a>, <a href="https://library.linode.com/securing-your-server">iptables and SSH</a> appropriately.
1. Tune mysql with `mysqltuner` and previous experience
1. Edit `my.cnf` and set:
```
[mysqld]
server-id=99                 # this ID cannot be used by any other server
```
1. Restart server

## 3. Locate master's position in binary log

Make sure you have an existing session open. Also have another command line ready to export the current master database snapshot with `mysqldump`.

1. Open up _a new MySQL session_ and execute `FLUSH TABLES WITH READ LOCK;` to lock all tables to prevent database inconsistency
1. In the other existing MySQL session, execute `SHOW MASTER STATUS;` to display the current binary log position
1. In another command line, execute `mysqldump --all-databases --master-data > dbdump.db` to <a href="http://dev.mysql.com/doc/refman/5.5/en/replication-howto-mysqldump.html">create a master database snapshot</a>
1. Close the new MySQL session to release the database lock once the dump is complete

## 4. Import the master snapshot and initialise the slave

1. Copy over the snapshot from master to slave: `scp user@hostname:/path/to/dbdump.db ~/dbdump.db`
1. Shut down slave MySQL. Edit `/etc/mysql/my.cnf` and set `skip-slave-start=true` (so that the slave doesn't start while we're importing data). Start up MySQL.
1. Import the database into slave: `mysql -u user -p < dbdump.db`
1. Log into slave MySQL.
1. Execute `SHOW SLAVE STATUS;` to make sure that `Slave_IO_Running=No` (master/slave binlog) and `Slave_SQL_Running=No` (importing SQL). Make sure that `Read_Master_Log_Pos` is the same value as reported with `SHOW MSATER STATUS` earlier.
1. <a href="http://dev.mysql.com/doc/refman/5.5/en/replication-howto-slaveinit.html">Configure the master connection data</a>: `CHANGE MASTER TO master_host='...',master_user='...',master_password='...';` (the log pos and file will have been set with `mysqldump --master-data`)
1. Start the slave: `START SLAVE;`

`SHOW SLAVE STATUS;` is your friend and primary means to understand what's going on. Interesting keys: 

* `Slave_IO_Running` - if _Yes_, then the slave is connected to master (should be Yes)
* `Slave_SQL_Running`- if _Yes_, then the slave is processing SQL queries from the binlog (should be Yes)
* `Last_Error` - if `Slave_SQL_Running` is _No_, this field will display the last SQL error that caused sync to fail (should be empty)
* `Seconds_Behind_Master` - a guess of how far slave is behind master. Should be 0.

Once you've got everything setup and running, edit `my.cnf` and disable `skip-slave-start`, and restart the MySQL server to make sure everything works OK.

## Lots of Duplicate entry errors

**Make sure that you aren't accidentally writing to your slave database!** Your slave database will have all the same users and permissions, so bad writes won't be noticed.

1. Check to see if the duplicate entries are of auto_increment fields and primary keys. Check to see if the data is already in the slave database. If so, you might be able to skip the failing query with `stop slave; set global sql_slave_skip_counter=2; start slave;`
1. If there are lots of duplicate primary keys, maybe the mysqldump failed. You can try temporarily setting (in `my.cnf`) `slave_skip_errors=1062` to get past the initial failing queries, and then turning it off while the slave catches up to master.
