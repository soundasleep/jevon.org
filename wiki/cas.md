---
layout: page
title:  "CAS"
author: jevon
date:   2012-01-30 09:18:07 +1300
---

[[CAS]] is a [[Java]]/[[Tomcat]]-based single sign on ([[SSO]]) project that can integrate with [[Drupal]], [[Liferay]], [[LDAP]] and lots more, but unfortunately requires [[Maven]] to configure and build.

==Could not resolve dependencies for project XXX: Could not find artifact :cas-server-support-ldap:jar==
If you just copy the `pom.xml` as in <a href="https://wiki.jasig.org/display/CASUM/Best+Practice+-+Setting+Up+CAS+Locally+using+the+Maven2+WAR+Overlay+Method">the instructions to create a WAR Overlay</a> for [[LDAP]] authentication:

[code]<dependency>
  <groupId>${project.groupId}</groupId>
  <artifactId>cas-server-support-ldap</artifactId>
  <version>${project.version}</version>
</dependency>
[/code]

This defines two variables, `${project.groupId}` and `${project.version}` -- however these refer to ''your'' project, not the CAS project. You should instead change this to:

[code]<dependency>
  <groupId>org.jasig.cas</groupId>
  <artifactId>cas-server-support-ldap</artifactId>
  <version>${cas.version}</version>
</dependency>[/code]

==LDAP: error code 49 - cannot bind the principalDn.==
In this case the problem was that I had set up my principalDn incorrectly:

[code]<bean id="contextSource" class="org.springframework.ldap.core.support.LdapContextSource">
  ...
  <property name="userDn" value="uid=system,ou=admin"/>[/code]

The value for `userDn` should have instead been `uid=admin,ou=system` (in my case). :$

==You should already have been redirected to the CAS server. Click here to continue.==
I was getting the following error message:

[code]CAS Authentication wanted!

You should already have been redirected to the CAS server. Click here to continue.
phpCAS 1.2.2 using server https://localhost:8443:8444/cas/ (CAS 2.0)[/code]

The key information is that there are two port numbers listed. The problem was that my [[Drupal]] configuration had the incorrect port number specified (8444 rather than 8443).

[[Category:CAS]]
[[Category:Java]]
[[Category:Tomcat]]
[[Category:J2EE]]
[[Category:Maven]]