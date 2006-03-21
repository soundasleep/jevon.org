---
layout: page
title:  "Java Servlet Pages"
author: jevon
date:   2006-03-21 22:26:16 +1300
---

==JSP Page Directive Reference==
<%@ page
  [ language="java" ]
  [ extends="package.class" ]
  [ import="{package.class | package.*}, ..." ]
  [ session="true|false" ] 
  [ buffer="none|8kb|sizekb" ]
  [ autoFlush="true|false" ]
  [ isThreadSafe="true|false" ]
  [ info="text" ]
  [ errorPage="relativeURL" ]
  [ contentType="mimeType [ ; charset=characterSet ]" |
      "text/html ; charset=ISO-8859-1" ]
  [ isErrorPage="true|false" ]
  [ pageEncoding="characterSet | ISO-8859-1" ]
%>
From: http://java.sun.com/products/jsp/syntax/1.2/syntaxref1210.html

[[Category:Technology]]