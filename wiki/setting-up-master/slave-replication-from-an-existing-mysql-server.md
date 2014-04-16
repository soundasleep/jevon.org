---
layout: page
title:  "Setting up Master/Slave Replication from an existing MySQL server"
author: jevon
date:   2014-04-16 21:27:34 +1200
---

[[MySQL]]

Currently https://cryptfolio.com is running off a single MySQL server. I want to switch this to a master/slave setup, which I intend will:

# increase performance (0.10% of queries are blocked by updates), but not too much since the database is very write-heavy (59% of queries)
# increase visible performance greatly (often graphs are blocked by pending writes especially to `summary_instances` and `balances` tables)
# improve reliability (if the slave goes down, I can point web servers to master; if the master goes down, I can enable read-only site mode)
# cost more money to run (since I'll be running two nodes rather than one) but still much cheaper (and more interesting) than going through S3
# databases suitable for memcachedb/keystores are not yet used that heavily

I'll be using the <a href="http://dev.mysql.com/doc/refman/5.5/en/replication-howto.html">MySQL guide</a> to set up replication and cover my steps here.

==1. Setup master==
<a href="http://dev.mysql.com/doc/refman/5.5/en/replication-howto-masterbaseconfig.html">16.1.1.1 Setting the Replication Master Configuration</a>

# Edit `my.cnf` and set:
[code]
[mysqld]
log-bin=mysql-bin            # enable binary logging
server-id=1                  # this ID cannot be used by any other server
[/code]
# Create a <a href="http://dev.mysql.com/doc/refman/5.5/en/replication-howto-repuser.html">new slave user</a>
[code]
CREATE USER 'repl'@'%.mydomain.com' IDENTIFIED BY 'slavepass';
GRANT REPLICATION SLAVE ON *.* TO 'repl'@'%.mydomain.com';
[/code]
# Restart server

==2. Setup slave==

# Purchase new Linode.
# Set up <a href="https://library.linode.com/databases/mysql/ubuntu-12.04-precise-pangolin">MySQL</a>, <a href="https://library.linode.com/securing-your-server">iptables and SSH</a> appropriately.
# Tune mysql with `mysqltuner` and previous experience
# Edit `my.cnf` and set:
[code]
[mysqld]
server-id=99                 # this ID cannot be used by any other server
[/code]
# Restart server

==3. Locate master's position in binary log==

Make sure you have an existing session open. Also have another command line ready to export the current master database snapshot with `mysqldump`.

# Open up _a new MySQL session_ and execute `FLUSH TABLES WITH READ LOCK;` to lock all tables to prevent database inconsistency
# In the other existing MySQL session, execute `SHOW MASTER STATUS;` to display the current binary log position
# In another command line, execute `mysqldump --all-databases --master-data > dbdump.db` to <a href="http://dev.mysql.com/doc/refman/5.5/en/replication-howto-mysqldump.html">create a master database snapshot</a>
# Close the new MySQL session to release the database lock once the dump is complete

==4. Import the master snapshot and initialise the slave==

# Copy over the snapshot: `scp user@hostname:/path/to/dbdump.db ~/dbdump.db`

[[Category:MySQL]]