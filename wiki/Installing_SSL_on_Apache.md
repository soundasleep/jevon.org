---
layout: page
title:  "Installing SSL on Apache"
author: jevon
date:   2013-11-26 19:49:51 +1300
tags:   [Apache, Web Development]
---

[Apache](Apache.md) / [SSL](ssl.md)

My basic steps for installing SSL:

1. <a href="http://wiki.cacert.org/SimpleApacheCert">Generate a .key</a> (private key) and .csr (certificate signing request) for your domain:
```
openssl genrsa -out <filename for your private key> 2048
openssl req -new -key <filename for your private key> -out <filename for the CSR>
```
1. Paste this CSR into the CSR form on your SSL provider.
1. Copy the generated certificate files into e.g. /etc/apache2/ssl: (AddTrustExternalCARoot.crt, PositiveSSLCA2.crt, my_domain.crt)
1. Create a new site e.g. /etc/apache2/sites-available/my-domain-ssl:
```
<VirtualHost *:443>
  ServerName domain.org
  ServerAlias www.domain.org
  // etc

  SSLEngine on
  SSLCertificateFile /etc/apache2/ssl/my_domain.crt
  SSLCertificateKeyFile /etc/apache2/ssl/my_domain.key
  SSLCertificateChainFile /etc/apache2/ssl/PositiveSSLCA2.crt
</VirtualHost>
```
1. Enable SSL module in Apache
```
sudo a2enmod ssl
sudo service apache2 restart
```
1. Enable the new site
```
sudo a2ensite my-domain-ssl
sudo service apache2 reload
```
