---
layout: page
title:  Tomcat
author: jevon
date:   2012-01-25 09:56:52 +13:00
tags:
  - Technology
  - Web
redirect_from:
  - "/wiki/tomcat"
---

A web server for hosting [Java](java.md) or [servlet](servlet.md) applications.

1. [Installing SSL on Tomcat 7](installing-ssl-on-tomcat-7.md)

## I get the following exception when trying to start SSL on Tomcat5
```
SEVERE: Exception trying to load keystore /usr/share/tomcat5/.keystore
java.security.KeyStoreException: JKS
   at java.security.KeyStore.getInstance(libgcj.so.7rh)
...
SEVERE: Error starting endpoint
java.io.IOException: Exception trying to load keystore /usr/share/tomcat5/.keystore: JKS
...
SEVERE: Catalina.start: 
LifecycleException:  service.getName(): "Catalina";  Protocol handler start failed: java.io.IOException: Exception trying to load keystore /usr/share/tomcat5/.keystore: JKS
...
```

Solution:

1. Use **keytool** to generate a SSL certificate at /usr/share/tomcat5/.keystore. <a href="http://jakarta.apache-korea.org/tomcat/tomcat-5.0-doc/printer/ssl-howto.html">more information</a>
1. Switch JVMs from the GNU JVM to the real Sun JVM. <a href="http://www.mail-archive.com/users@tomcat.apache.org/msg33556.html">source</a>, <a href="http://wiki.centos.org/HowTos/JavaOnCentOS">how to</a>
1. Edit /etc/tomcat5/tomcat5.conf to point to the new JVM:

```
# you could also override JAVA_HOME here
# Where your java installation lives
# JAVA_HOME="/usr/lib/jvm/java"
JAVA_HOME="/usr/java/jdk1.6.0_06/jre/"
```

## Setting the Tomcat Proxy
If you have a web application that needs to go through a Proxy but hasn't been <a href="http://www.javaworld.com/javaworld/javatips/jw-javatip42.html">set manually in the code</a>, you can add it to Java's startup command line switches:

1. Open the Tomcat service manager in the toolbar, and select _Configure..._
1. Select the _Java_ tab
1. <a href="http://www.innovation.ch/java/HTTPClient/getting_started.html">Add the following lines</a> to your _Java Options_:

```
-Dhttp.proxyHost=yourproxy.com
-Dhttp.proxyPort=8080
```
