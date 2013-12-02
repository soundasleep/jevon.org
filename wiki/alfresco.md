---
layout: page
title:  "Alfresco"
author: jevon
date:   2013-12-02 20:54:35 +1300
---

[[Alfresco]] is a content management system for [[Tomcat]] and written in [[Java]].

==Adding Calendars, Wikis and Blogs to a Site==
You can't add calendars, wikis or blogs to an Alfresco site through the Explorer application; they can only be added (and used) with the Share application.

To add the content, go to the site in Share, select More > Customise Site, and then drag content from the ''Available Site Pages''.

==Liferay Integration into a Subfolder==
It's impossible to specify [[Liferay]] to use a subfolder of Alfresco for its site. For example:

[code]dl.store.cmis.system.root.dir=Root Folder/Folder 1/Folder 2/Liferay Home[/code]

This results in the error:

[code]Invalid property value:
   Constraint: 11200014 Value 'Root Folder/Folder 1/Folder 2/Liferay Home' is not valid as a file name. This property must be a valid file name.[/code]

==Disabling Javascript Minification in Alfresco==
<a href="https://forums.alfresco.com/en/viewtopic.php?f=48&t=23323">As discussed here</a>, to enable [[Javascript]] debugging (and to disable the minification of Alfresco Javascript), add this code to `webscript-framework-config-custom.xml` <a href="http://wiki.alfresco.com/wiki/Web_Scripts#Global_and_Scoped_Config">for Alfresco explorer</a>:

[code]<config>
  <flags>
    <client-debug>true</client-debug>
  </flags>
</config>[/code]

For [[Alfresco Share]], the <a href="https://forums.alfresco.com/en/viewtopic.php?f=48&t=23323&p=124149#p124149">relevant file is</a> `<tomcat>/shared/classes/alfresco/web-extension/share-config-custom.xml`.

==Call to undefined function `alfresco_repository_access()`==
You may get this error when trying to install the Alfresco 6.x module within [[Drupal]] 6.x.

This is caused by not having the `alfresco` module enabled; but even if you specifically enable it, it still may fail.

The root cause is that the [[SOAP]] extension may not be enabled; enable it in your `php.ini` and try enabling the Alfresco module again.

[code]extension=php_soap.dll[/code]

To disable [[Drupal]] modules that are enabled but cause your site to crash (so you can't disable them), see [[Drupal]].

==ReferenceError: "json" is not defined.==
If you get this error while trying to call a Remote Alfresco API script, such as the following:

[code]var clientRequest = json.toString();
var result = remote.connect("alfresco").post("/api/foo/" + encodeURIComponent(user.id) + "/profile/edit",
  clientRequest, "application/json");[/code]

The problem is that you need to <a href="http://forums.alfresco.com/en/viewtopic.php?t=15238#p50188">specify `application/json` as a content type</a> and re-encode the page arguments to JSON like so:

[code]var clientRequest = page.url.args;
var result = remote.connect("alfresco").post("/api/foo/" + encodeURIComponent(user.id) + "/profile/edit",
  jsonUtils.toJSONString(clientRequest), "application/json");[/code]

=="userhome" is not defined.==
`userhome` is only defined for webscripts within the Alfresco Explorer interface, and _not_ the Alfresco Share interface. I think the common way to solve this is to write an API interface (using JSON), i.e. your Alfresco Share-based app will call the Alfresco Explorer-based app to modify/create content within `userhome`.

==Redirecting==
To redirect from within an FTL script:

[code]// redirect
status.location = url.context + "/page/redirect";
status.code = 302;
status.redirect = true;[/code]

==The choice of Java constructor replace matching JavaScript argument types (function,string) is ambiguous; candidate constructors are: class java.lang.String replace(char,char), class java.lang.String replace(java.lang.CharSequence,java.lang.CharSequence)==
Instead of using this:
[code]	return s.replace(/[]/g, "")
		.replace(/["]/g, """);[/code]

First try casting it to a "Javascript" string, like so:
[code]	return (s + "").replace(/[]/g, "")
		.replace(/["]/g, """);[/code]

==Importing JQuery into an Alfresco Share page==
You need to add an import for the [[JQuery]] library in the `xxx.get.head.ftl` template, for example:

[code]<@script type="text/javascript" src="${page.url.context}/res/jquery/jquery-1.6.2.js"></@script>[/code]

==Correct Format for the Alfresco `d:date` Data Type==
The correct String format for an instance of the `d:date` data type is the full <a href="http://en.wikipedia.org/wiki/ISO_8601">ISO8601</a> date format <a href="https://forums.alfresco.com/en/viewtopic.php?p=5210#p5210">with milliseconds and timezone offset explicitly provided</a>, i.e. `2005-09-16T17:01:03.456+01:00`.

The following values will ''not'' work:

* `16 Sep 2005`
* `16 September 2005`
* `2005-09-16` (ISO8601)
* `2005-09-16 00:00:00`
* `2005-09-16T00:00` (ISO8601 'T')
* `2007-04-05T14:30Z` (ISO8601 'T' with UTC timezone indicator)
* `23 Feb 2012 11:39:39 GMT+1300 (NZDT)` (the format provided in its `dateFormat` `<#macro />` example)

==Failed to verify license - Invalid license on Alfresco Enterprise 4.0 Trial==
This error can occur if you try to start the alfresco.war web application against an empty alf_data filestore, but the MySQL database is not empty. In this case, simply resetting the database can help:

[code]drop database alfresco; create database alfresco;[/code]

==com.gargoylesoftware.htmlunit.ScriptException: TypeError: Cannot find default value for object. (http://localhost:8080/share/res/yui/event/event-debug.js#385)==
This error occurred when I was trying to test my Alfresco Share application using [[JWebUnit]]. One proposed solution was to <a href="https://github.com/jenkinsci/jenkins/commit/01c64271a104ae1cace42ca3b59ad6dd957be2c1">apply this patch</a> to prevent `null` objects from being used in a `toString()` method.

However I found that this patch wasn't enough. My solution was to patch `event-debug.js` itself, and replace the failing code with:

[code]    /**
     * @method toString
     */
    toString: function() {
         return "CustomEvent: " + "'" + (typeof this.type == 'undefined' ? 'undefined' : this.type)  + "', " +
             "context: " + (typeof this.scope == 'undefined' ? 'undefined' : "");

    }[/code]

==Translate NodeRef to Person object==
While not documented, `people.getPeople("filter")` returns a list of NodeRefs, not People. It is necessary to translate this into an object that can then be queried for properties.

From `alfresco/WEB-INF/classes/alfresco/templates/webscripts/org/alfresco/repository/site/membership/potentialmembers.get.js`:

[code]peopleFound = people.getPeople(filter, maxResults);
for (i = 0; i < peopleFound.length; i++) {
  username = search.findNode(peopleFound[i]).properties.userName;
  // ...
}[/code]

==jsonUtils.encodeJSONString(x) is instead a freemarker.template.TemplateBooleanModel==
[code]<#escape x as jsonUtils.encodeJSONString(x)>
   "success": ${success},
</#escape>[/code]

The problem, I think, is that `encodeJSONString()` expects a String, not a boolean. Therefore:

[code]<#escape x as jsonUtils.encodeJSONString(x)>
   "success": ${success?string("true","false")},
</#escape>[/code]

==GetChildren: exceeded maximum number filter/sort properties==
This occurred when I was trying to execute a `listSites` query on the `siteService`:

[code]var all_sites = siteService.listSites("*" + value, "*", 250 /* max results */);[/code]

The problem is the "*" parameter for the site type filter. The correct way to search for these sites is via:

[code]var all_sites = siteService.listSites(value, "", 250 /* max results */);[/code]

==Type Error: items is undefined==
If you receive this [[Javascript]] exception when running a Share client-side page, then the problem may be that you are trying to read an invalid [[JSON]] response. Check [[Firebug]] and  double check the syntax of the JSON the script is trying to process.

==Secure FTP connection fails: bad record MAC==
I was getting this error when trying to connect to an Alfresco Secure [[FTP]] server using [[FireFTP]] (using Auth TLS or Auth [[SSL]]). However using Filezilla (explicit secure FTP) worked fine. The error log that I was receiving:

[code]
220 FTP server ready
       AUTH SSL
234 Switching to SSL secure session
       PBSZ 0
502 Command not implemented
[/code]

==How to run a server-side Javascript in Alfresco Explorer==

# Upload the Javascript to `Company Home/Data Dictionary/Scripts`.
# View "More Details" on the Javascript.
# Select "Run Action"
# Select the action "Run a script"
# Select your uploaded script
# Click Finish to run the script

==Loading and deleting a node by reference in Javascript==

[code js]
var node = utils.getNodeFromString("workspace://SpacesStore/8cf7277f-a753-43dc-b498-f352c8ca815c");
node.remove();
[/code]

[[Category:Alfresco]]
[[Category:Java]]
[[Category:Hubnet]]
[[Category:Javascript]]
[[Category:Drupal]]
[[Category:Tomcat]]
[[Category:J2EE]]
[[Category:JSON]]