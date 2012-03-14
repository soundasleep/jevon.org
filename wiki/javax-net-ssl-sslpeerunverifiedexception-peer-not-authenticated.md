---
layout: page
title:  "javax.net.ssl.SSLPeerUnverifiedException: peer not authenticated"
author: jevon
date:   2012-03-15 10:55:43 +1300
---

[[Java]] / [[SSL]]

I was getting this error when trying to write a test case using [[JWebUnit]], which uses [[HtmlUnit]].

<div class="quote">8097 [main] ERROR c.g.htmlunit.html.HtmlPage - Error loading JavaScript from [https://ajax.googleapis.com/ajax/libs/jquery/1.4.2/jquery.min.js]. 
javax.net.ssl.SSLPeerUnverifiedException: peer not authenticated
	at com.sun.net.ssl.internal.ssl.SSLSessionImpl.getPeerCertificates(SSLSessionImpl.java:352) ~[na:1.6]
	at org.apache.http.conn.ssl.AbstractVerifier.verify(AbstractVerifier.java:128) ~[httpclient-4.1.2.jar:4.1.2]
	at org.apache.http.conn.ssl.SSLSocketFactory.connectSocket(SSLSocketFactory.java:397) ~[httpclient-4.1.2.jar:4.1.2]
	at org.apache.http.impl.conn.DefaultClientConnectionOperator.openConnection(DefaultClientConnectionOperator.java:148) ~[httpclient-4.1.2.jar:4.1.2]
	at org.apache.http.impl.conn.AbstractPoolEntry.open(AbstractPoolEntry.java:149) ~[httpclient-4.1.2.jar:4.1.2]
	at org.apache.http.impl.conn.AbstractPooledConnAdapter.open(AbstractPooledConnAdapter.java:121) ~[httpclient-4.1.2.jar:4.1.2]
	at org.apache.http.impl.client.DefaultRequestDirector.tryConnect(DefaultRequestDirector.java:573) ~[httpclient-4.1.2.jar:4.1.2]</div>

This may occur for a number of reasons:

=Enable SSL debugging=
Set the <a href="http://javaskeleton.blogspot.com/2010/07/avoiding-peer-not-authenticated-with.html">`javax.net.debug=ssl` system property</a>.

For example, adding the following to `setenv.bat` for [[Tomcat]]:

[code]set JAVA_OPTS=%JAVA_OPTS% -Djavax.net.debug=ssl[/code]

=You are using a self-signed certificate=
You can import the self-signed certificate into an existing store by <a href="http://www.andrejkoelewijn.com/wp/2005/07/07/jwebunit-untrusted-certificates-https-and-proxies/">using the `keytool -import` tool</a>.

=You are not reusing the existing certificate authorities=
By default, creating a new keystore will not reuse the existing list of certificate authorities. You can copy the local `cacerts` list of authorities and add certificates directly to this keystore; the <a href="http://www.java-samples.com/showtutorial.php?tutorialid=210">default keystore password is `changeit`</a>.

=A different certificate is being provided=
<a href="http://stackoverflow.com/questions/8700042/download-ssl-certificate-in-unix">To export a copy of the SSL certificate</a> provided by a particular URL, use the command `openssl s_client -showcerts -connect google.de:443 </dev/null`. You can then copy the certificate directly from here into a new certificate file.

[[Category:Java]]