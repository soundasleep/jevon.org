---
layout: page
title:  "Disabling DTD validation for Ant xmlvalidate task within Eclipse"
author: jevon
date:   2012-03-09 10:22:52 +1300
tags:   [Ant, Eclipse, XML, Apache]
---

If you define an [XML](xml.md) validation task within an [Ant](ant.md) build script like so:

```
<xmlvalidate lenient="true">
   <fileset dir="${config.dir}" includes="**/*.xml" />
</xmlvalidate>
```

This will normally work fine, even if the XML file does not validate against the DTD or XSD.

However, this task will **fail if the DTD cannot be downloaded**, for example if you are behind a proxy, or the DTD is badly formed or missing.

This is a known bug: see https://issues.apache.org/bugzilla/show_bug.cgi?id=35657#c4

There are three solutions that I've played around with.

## Download the DTD locally
One solution is to download the [DTD](dtd.md) locally, and <a href="http://ant.apache.org/manual/Tasks/xmlvalidate.html">define it explicitly as a local DTD</a> within the `xmlvalidate` task:

```
<xmlvalidate ...>
   <dtd publicId="-//Apache Software Foundation//DTD Struts Configuration 1.0//EN"
         location="lib/dtd/my.dtd"/>
</xmlvalidate>
```

Of course this means that you will now have to maintain a repository of DTDs.

## Add the `-autoproxy` option for Ant
<a href="http://ant.apache.org/manual/proxy.html">As described by Ant documentation</a>, the `-autoproxy` option will allow Ant to use the system proxy settings, meaning that it should be able to download the DTD as necessary.

You can also add this to the <a href="http://ant.apache.org/manual/proxy.html">environment variable `ANT_ARGS`</a>, so that you don't need to define it for every `ant` build.

However, I couldn't work out how to add this environment variable to an instance of [Eclipse](eclipse.md) -- adding it to the [Windows](windows.md) environment variables would not pass the variable or option along to Ant, when executing Ant within Eclipse.

## Use the `setproxy` task
The final option that I've found is using the `setproxy` task of Ant to manually set the proxy itself.

This can be done as an optional extra to an existing script, like so:

```
<target name="set-proxy" if="PROXY_ENABLED"
      description="Optionally set the proxy for the xml-lint target">
   <fail unless="PROXY_HOST" message="PROXY_HOST property not set." />
   <fail unless="PROXY_PORT" message="PROXY_PORT property not set." />
   <setproxy proxyhost="${PROXY_HOST}" proxyport="${PROXY_PORT}" />
</target>

<target name="xml-lint"
      depends="set-proxy"
      ... />
```

You can now define, within Eclipse, the properties `PROXY_ENABLED`, `PROXY_HOST` and `PROXY_PORT`.
