---
layout: page
title:  libgdx
author: jevon
date:   2021-07-12 17:19:00 +13:00
tags:
  - Technology
  - Java
---

[libgdx](libgdx.md) is a [Java](Java.md) library for [lwjgl](lwjgl.md).

# Generated app-image using JPackage does not respect Windows high-DPI settings

Good luck, this is super hard to debug. I had the following `build.gradle`:

```gradle
tasks.jpackage {
	dependsOn("dist", "clearPackage")

    input  = "${buildDir}/libs"
    destination = "${buildDir}/package"
    mainJar = "desktop-0.1.jar" // TODO get version from main build.gradle
    mainClass = project.ext.mainClassName
    type = "app-image"  // remove to make an .exe that's an installer, there are other types...

    windows {
        winConsole = true // otherwise errors will just silently throw a "Failed to launch JVM" error
    }
}
```

Which created the following file structure in `build/package/DesktopLauncher`:

```
app/
  desktop-0.1.jar
  DesktopLauncher.cfg
  .jpackage.xml
runtime/
  [jre]
DesktopLauncher.exe
DesktopLauncher.ico
```

Does running the .jar solve the DPI scaling problem? i.e. `java -jar app/desktop-0.1.jar`? If so, it's likely a problem with JPackage (which I think is the ultimate problem).

## Solution

I found [tis interesting solution](https://stackoverflow.com/a/1424078/39531):

1. Install [he Windows SDK](https://developer.microsoft.com/en-us/windows/downloads/windows-sdk/)
2. Create a new manifest file that highlights your application is DPI-aware:

```xml
<?xml version="1.0" encoding="UTF-8" standalone="yes"?>
<assembly xmlns="urn:schemas-microsoft-com:asm.v1" manifestVersion="1.0" xmlns:asmv3="urn:schemas-microsoft-com:asm.v3">
  <asmv3:application>
    <asmv3:windowsSettings>
      <dpiAware xmlns="http://schemas.microsoft.com/SMI/2005/WindowsSettings">true</dpiAware>
      <dpiAwareness xmlns="http://schemas.microsoft.com/SMI/2016/WindowsSettings">PerMonitorV2</dpiAwareness>
    </asmv3:windowsSettings>
  </asmv3:application>
</assembly>
```

3. Add this assembly to the generated .exe:

```
"C:\Program Files (x86)\Windows Kits\10\bin\10.0.22000.0\x86\mt.exe" -manifest DesktopLauncher.exe.manifest -outputresource:"DesktopLauncher.exe;#1"
```
