---
layout: page
title:  Java Servlet Pages
author: jevon
date:   2006-03-21 21:26:16 +12:00
tags:
  - Technology
redirect_from:
  - "/wiki/java_servlet_pages"
  - "/wiki/Java Servlet Pages"
  - "/wiki/java servlet pages"
---

## JSP Page Directive Reference
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
