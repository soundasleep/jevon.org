---
layout: page
title:  "PDT vs PHPEclipse vs PhpStorm"
author: jevon
date:   2013-12-05 20:24:08 +1300
---

I did a quick test of three leading [[PHP]] editors: [[PDT]], [[PHPEclipse]] (both based on [[Eclipse]], [[PhpStorm]] (based on IntelliJ). This isn't intended to be a complete review or test, I just wanted to see if I could find a better IDE than Textpad.

All of the editors had colour syntax highlighting. I didn't test debugging support. None seemed to support unit testing out of the box.

My most important requirements are displaying Javadoc on mouseover (because that's how you learn function contracts), displaying overlays on files (both errors and warnings), being quick and responsive, supporting automatic refactoring, and code completion.

==PDT==
PDT seems to be more Eclipsey and refined than PHPEclipse.
===Pros===
* Display Javadoc on mouseover
* Clever require() navigation on Ctrl-Click
* Overflay on files of warnings
* Includes PHP source just like JDT includes JRE source
* Theoretically has Eclipse extension points, and I know how to write Eclipse extensions
===Cons===
* No support for <a href="https://bugs.eclipse.org/bugs/show_bug.cgi?id=162771">detecting uninitialised variables</a>
* No automatic refactoring support
* No code completion
* No overlays on files of warnings
* No HTML autocompletion

==PHPEclipse==
PHPEclipse seems to be a less refined editor.
===Pros===
* Detecting uninitialised variables
===Cons===
* No overlays on files of warnings
* No require() navigation on ctrl-click, supported F3

==PhpStorm==
Seems to be very powerful, but also a bit messy. I don't like any of the default colour schemes.
===Pros===
* Automatic refactoring support: rename function, variable etc
* Code completion
* It even automatically calculates the return type of PHP functions
* Supports navigation to multiple function definitions with the same name
* Lots of settings
* HTML autocompletion
* Has a neat CSS editor that also displays warnings (e.g. "0px" should be "0")
* Has a better HTML editor than PDT
* Has database integration
===Cons===
* No display Javadoc on mouseover
* No overlays on files of warnings
* Complains that `htmlspecialchars` is incorrectly spelled in inline PHP

[[Category:PHP]]
[[Category:IDE]]
[[Category:Eclipse]]