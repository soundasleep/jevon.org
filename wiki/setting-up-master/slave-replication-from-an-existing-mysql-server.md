---
layout: page
title:  "Setting up Master/Slave Replication from an existing MySQL server"
author: jevon
date:   2014-04-16 20:10:12 +1200
---

[[MySQL]]

Currently https://cryptfolio.com is running off a single MySQL server. I want to switch this to a master/slave setup, which I intend will:

# increase performance (0.10% of queries are blocked by updates), but not too much since the database is very write-heavy (59% of queries)
# increase visible performance greatly (often graphs are blocked by pending writes especially to `summary_instances` and `balances` tables)
# improve reliability (if the slave goes down, I can point web servers to master; if the master goes down, I can enable read-only site mode)
# cost more money to run (since I'll be running two nodes rather than one) but still much cheaper (and more interesting) than going through S3
# databases suitable for memcachedb/keystores are not yet used that heavily

I'll be using the <a href="http://dev.mysql.com/doc/refman/5.5/en/replication-howto.html">MySQL guide</a> to set up replication and cover my steps here.

==todo==

[[Category:MySQL]]