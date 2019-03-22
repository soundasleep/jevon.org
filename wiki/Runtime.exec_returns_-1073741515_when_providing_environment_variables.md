---
layout: page
title:  Runtime.exec returns -1073741515 when providing environment variables
author: jevon
date:   2011-09-26 17:37:44 +13:00
tags:
  - Java
redirect_from:
  - "/wiki/runtime"
---

[Java](Java.md)

I was having a problem where using `Runtime.exec(String[])` would work fine, but using `Runtime.exec(String[], String[])` would return the value -1073741515.

After a bit of digging, it turns out that the <a href="http://social.msdn.microsoft.com/Forums/en-US/vcgeneral/thread/8cd14917-c330-40fe-916c-3619a11debac/">-1073741515 return value _may_ mean `STATUS_DLL_NOT_FOUND` within Windows</a>.

Using <a href="http://technet.microsoft.com/en-us/sysinternals/bb896645">Process Monitor</a>, I added a filter to check for the target `.exe` and found that it was failing to load `cygwin1.dll`:

{% include gmf-CSS.md %}<img src="/img/gmf/cygwin-dll.png" class="gmf-left" style="max-width: 100%;">

The problem is that `Runtime.exec(String[], String[])` does _not_ copy over any existing environment variables, whereas `Runtime.exec(String[])` does. You therefore have to copy existing environment variables yourself:

```
protected String[] getEnvironmentVariables() {
  List<String> envp = new ArrayList<String>();
  for (String key : System.getenv().keySet()) {
    envp.add(key + "=" + System.getenv(key));
  }

  // add your environment variable here
  envp.add("CYGWIN=nodosfilewarning");

  // return as a list of strings
  return envp.toArray(new String[]{});
}
```

(In this case, the `PATH` variable was not being provided, so it couldn't find the `cygwin1.dll` anywhere.)
