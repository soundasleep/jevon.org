---
layout: page
title:  Installing SSL on Tomcat 7
author: jevon
date:   2013-02-05 19:43:53 +13:00
tags:
  - Java
  - Tomcat
  - J2EE
redirect_from:
  - "/wiki/Installing SSL on Tomcat 7"
---

--
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
