---
layout: page
title:  CAS
author: jevon
date:   2012-01-30 09:18:07 +13:00
tags:
  - CAS
  - Java
  - Tomcat
  - J2EE
  - Maven
---

[CAS](cas.md) is a [Java](java.md)/[Tomcat](tomcat.md)-based single sign on ([SSO](sso.md)) project that can integrate with [Drupal](drupal.md), [Liferay](liferay.md), [LDAP](ldap.md) and lots more, but unfortunately requires [Maven](maven.md) to configure and build.

## Could not resolve dependencies for project XXX: Could not find artifact :cas-server-support-ldap:jar
If you just copy the `pom.xml` as in <a href="https://wiki.jasig.org/display/CASUM/Best+Practice+-+Setting+Up+CAS+Locally+using+the+Maven2+WAR+Overlay+Method">the instructions to create a WAR Overlay</a> for [LDAP](ldap.md) authentication:

```
<dependency>
  <groupId>${project.groupId}</groupId>
  <artifactId>cas-server-support-ldap</artifactId>
  <version>${project.version}</version>
</dependency>
```

This defines two variables, `${project.groupId}` and `${project.version}` -- however these refer to _your_ project, not the CAS project. You should instead change this to:

```
<dependency>
  <groupId>org.jasig.cas</groupId>
  <artifactId>cas-server-support-ldap</artifactId>
  <version>${cas.version}</version>
</dependency>
```

## LDAP: error code 49 - cannot bind the principalDn.
In this case the problem was that I had set up my principalDn incorrectly:

```
<bean id="contextSource" class="org.springframework.ldap.core.support.LdapContextSource">
  ...
  <property name="userDn" value="uid=system,ou=admin"/>
```

The value for `userDn` should have instead been `uid=admin,ou=system` (in my case). :$

## You should already have been redirected to the CAS server. Click here to continue.
I was getting the following error message:

```
CAS Authentication wanted!

You should already have been redirected to the CAS server. Click here to continue.
phpCAS 1.2.2 using server https://localhost:8443:8444/cas/ (CAS 2.0)
```

The key information is that there are two port numbers listed. The problem was that my [Drupal](drupal.md) configuration had the incorrect port number specified (8444 rather than 8443).
