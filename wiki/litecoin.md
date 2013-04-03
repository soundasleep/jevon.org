---
layout: page
title:  "Litecoin"
author: jevon
date:   2013-04-03 18:20:08 +1300
---

==Configuring Abe to work with Litecoin using [[MySQL]]==

<a href="https://github.com/jtobey/bitcoin-abe">Abe</a> is a cryptocurrency block explorer for [[Bitcoin]] and any other related chain.

# Install [[python]]
# Install <a href="https://www.dlitz.net/software/pycrypto/">pycrypto</a> to prevent `ImportError: No module named Crypto.Hash.SHA256`
# Install `python-mysqldb` (e.g. `<a href="http://stackoverflow.com/questions/454854/no-module-named-mysqldb">http://stackoverflow.com/questions/454854/no-module-named-mysqldb</a>`) to prevent `ImportError: No module named MySQLdb`
# Create a new MySQL database named `abe`.
# Configure `abe.conf`:
[code]
dbtype MySQLdb
connect-args {"user":"abe","db":"abe","passwd":"password"}
port 12345
host localhost
[/code]

# Add in the following to `abe.conf`, to prevent `Chain not found for magic number`:
[code]
datadir += [{
  "dirname" : "/path/to/.litecoin",
  "chain": "Litecoin",
  "code3": "LTC",
  "address_version": "u0030",
  "magic": "u00fbu00c0u00b6u00db"
}]
[/code]

# Build and install Abe: `python setup.py build`, `python setup.py install`
# Configure Abe to start by scanning: `python -m Abe.abe --config abe.conf --rescan`. You should get a whole lot of `block_tx xxx xxx` and `commit`s.
# You should now be able to connect to Abe via http://localhost:12345.

References: <a href="https://bitcointalk.org/index.php?topic=131781.0">Configuring Abe with Terracoin</a>, <a href="http://pastebin.com/tyf2xN9t">this magic file</a>

[[Category:Python]]
[[Category:Cryptocurrencies]]