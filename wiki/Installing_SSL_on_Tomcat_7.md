---
layout: page
title:  "Installing SSL on Tomcat 7"
author: jevon
date:   2013-02-05 19:43:53 +1300
tags:   [Java, Tomcat, J2EE]
---

[Tomcat](Tomcat.md)

This covers installing self-signed certificates on Tomcat 7 using APR against OpenSSL. Entirely based on http://code.google.com/p/jianwikis/wiki/TomcatSSLWithAPR.

In particular, define a file `ssl.cfg` defining the properties of your certificate:

```
[ req ]
default_bits           = 2048
default_keyfile        = key.pem 
distinguished_name     = req_distinguished_name
attributes             = req_attributes
req_extensions         = v3_req
prompt                 = no

[ req_distinguished_name ]
C                      = NZ
ST                     = Wellington
L                      = Wellington
O                      = Localhost
OU                     = Security
CN                     = example.com
emailAddress           = jevon@example.com

[ req_attributes ]
challengePassword      = <password>

[ v3_req ]
#Extensions to add to a certificate request

basicConstraints = CA:FALSE
keyUsage = nonRepudiation, digitalSignature, keyEncipherment

subjectAltName = @alt_names

[alt_names]
DNS.1                  = alias1.example.com
DNS.2                  = alias2.example.com
DNS.3                  = alias3.example.com
```

CN is particularly important as this will represent the host name check of the certificate. For example, if you are going to https://foo.com, CN should be foo.com.

Once this configuration file is created, execute the following OpenSSL commands:

### Generate the personal private key file (PEM) and certificate request (CSR)
```
>openssl req -new -out tomcat.csr -config ssl.cfg
Loading 'screen' into random state - done
Generating a 2048 bit RSA private key
.........................................................+++
.........................................+++
writing new private key to 'key.pem'
Enter PEM pass phrase:
Verifying - Enter PEM pass phrase:
-----
```

### Generate the server private key
```
>openssl rsa -in key.pem -out server.key
Enter pass phrase for key.pem:
writing RSA key
```

### Create the server SSL certificate and self-sign it with the server private key
```
>openssl x509 -in tomcat.csr -out server.crt -req -signkey server.key -days 3650
Loading 'screen' into random state - done
Signature ok
subject=/C=NZ/ST=Wellington/L=Wellington/O=Localhost/OU=Security/CN=<hostname>/emailAddress=jevon@example.com
Getting Private key
```

### Configure Tomcat `server.xml` to use the new key with APR
```
<Connector port="8443" maxHttpHeaderSize="8192"
              maxThreads="150" minSpareThreads="25" maxSpareThreads="75"
              enableLookups="false" disableUploadTimeout="true"
              acceptCount="100" scheme="https" secure="true"
              clientAuth="false"
              sslProtocol="TLS"
              SSLEngine="on"
              SSLEnabled="true"
              SSLPassword="<password>"
              SSLCertificateFile="<path>/server.crt"
              SSLCertificateKeyFile="<path>/key.pem" />
```

### keytool error: java.io.FileNotFoundException: keystore (Access is denied)
Make sure that you can write out your keystore file to the appropriate location. For example, running `keytool` using the Windows command prompt does not give you permissions to create files in `C:Program Files`.
