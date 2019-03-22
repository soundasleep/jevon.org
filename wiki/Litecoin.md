---
layout: page
title:  Litecoin
author: jevon
date:   2013-05-27 05:50:59 +12:00
tags:
  - Python
  - Cryptocurrencies
---

## Configuring Abe to work with Litecoin using [MySQL](MySQL.md)

<a href="https://github.com/jtobey/bitcoin-abe">Abe</a> is a cryptocurrency block explorer for [Bitcoin](Bitcoin.md) and any other related chain.

1. Install [python](Python.md)
1. Install <a href="https://www.dlitz.net/software/pycrypto/">pycrypto</a> to prevent `ImportError: No module named Crypto.Hash.SHA256`
1. Install `python-mysqldb` (e.g. `<a href="http://stackoverflow.com/questions/454854/no-module-named-mysqldb">http://stackoverflow.com/questions/454854/no-module-named-mysqldb</a>`) to prevent `ImportError: No module named MySQLdb`
1. Create a new MySQL database named `abe`.
1. Configure `abe.conf`:
```
dbtype MySQLdb
connect-args {"user":"abe","db":"abe","passwd":"password"}
port 12345
host localhost
```

1. Add in the following to `abe.conf`, to prevent `Chain not found for magic number`:
```
datadir += [{
  "dirname" : "/path/to/.litecoin",
  "chain": "Litecoin",
  "code3": "LTC",
  "address_version": "u0030",
  "magic": "u00fbu00c0u00b6u00db"
}]
```

1. Build and install Abe: `python setup.py build`, `python setup.py install`
1. Configure Abe to start by scanning: `python -m Abe.abe --config abe.conf --rescan`. You should get a whole lot of `block_tx xxx xxx` and `commit`s.
1. You should now be able to connect to Abe via http://localhost:12345.

References: <a href="https://bitcointalk.org/index.php?topic=131781.0">Configuring Abe with Terracoin</a>, <a href="http://pastebin.com/tyf2xN9t">this magic file</a>

## Setting up Litecoin mining on Ubuntu 12.04.2 LTS

* I followed <a href="http://www.reddit.com/r/litecoinmining/comments/1c4n7i/guide_getting_started_with_n_x_radeon_7950_on/">this guide mainly</a>, with some help from <a href="http://www.reddit.com/r/litecoinmining/comments/1c4n7i/guide_getting_started_with_n_x_radeon_7950_on/ca6t3hb">my comment</a> and <a href="http://www.cryptobadger.com/2013/04/build-a-litecoin-mining-rig-linux/">this guide</a> and <a href="https://docs.google.com/document/d/1Gw7YPYgMgNNU42skibULbJJUx_suP_CpjSEdSi8_z9U/preview?sle=true#">this guide</a>.
* I had to install the [Linux](Linux.md) beta drivers (13.3 Beta 3) from ATI to get things to work.
* If you installed the server package, you need to have an X server. The easiest way to set this up is to install a desktop manager (Gnome) along with <a href="https://help.ubuntu.com/community/ServerGUI#X11_Server_Installation">a minimal X</a>: `sudo apt-get install xorg gdm`
* After installing new drivers, execute `sudo aticonfig --adapter=all --initial -f` and restart.

The scripts that I am using (for two Radeon 7850s):

[mine.sh]
```
#!/bin/sh
export DISPLAY=:0
export GPU_MAX_ALLOC_PERCENT=100
export GPU_USE_SYNC_OBJECTS=1
cd /home/<username>/cgminer
./cgminer --scrypt -o my.stratum.server:17001 -u username -p password -w 256 --thread-concurrency 12404 -I 18 --lookup-gap 2 --auto-fan 2>/home/<username>/cgminer.log
```

[mine-launcher.sh]
```
#!/bin/bash
DEFAULT_DELAY=0
if [ "x$1" = "x" -o "x$1" = "xnone" ]; then
   DELAY=$DEFAULT_DELAY
else
   DELAY=$1
fi
sleep $DELAY
sudo su -c "screen -dmS cgm /home/<username>/mine.sh"
```

And these scripts are owned by root so they can be started as root in /etc/rc.local:

```
chown root:root mine.sh mine-launcher.sh
chmod a+x mine.sh mine-launcher.sh
```
