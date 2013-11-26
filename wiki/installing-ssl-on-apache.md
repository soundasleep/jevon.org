---
layout: page
title:  "Installing SSL on Apache"
author: jevon
date:   2013-11-26 19:49:51 +1300
---

[[Apache]] / [[SSL]]

My basic steps for installing SSL:

# <a href="http://wiki.cacert.org/SimpleApacheCert">Generate a .key</a> (private key) and .csr (certificate signing request) for your domain:
[code]
openssl genrsa -out <filename for your private key> 2048
openssl req -new -key <filename for your private key> -out <filename for the CSR>
[/code]
# Paste this CSR into the CSR form on your SSL provider.
# Copy the generated certificate files into e.g. /etc/apache2/ssl: (AddTrustExternalCARoot.crt, PositiveSSLCA2.crt, my_domain.crt)
# Create a new site e.g. /etc/apache2/sites-available/my-domain-ssl:
[code]
<VirtualHost *:443>
  ServerName domain.org
  ServerAlias www.domain.org
  // etc

  SSLEngine on
  SSLCertificateFile /etc/apache2/ssl/my_domain.crt
  SSLCertificateKeyFile /etc/apache2/ssl/my_domain.key
  SSLCertificateChainFile /etc/apache2/ssl/PositiveSSLCA2.crt
</VirtualHost>
[/code]
# Enable SSL module in Apache
[code]sudo a2enmod ssl
sudo service apache2 restart[/code]
# Enable the new site
[code]sudo a2ensite my-domain-ssl
sudo service apache2 reload[/code]

[[Category:Apache]]
[[Category:Web Development]]