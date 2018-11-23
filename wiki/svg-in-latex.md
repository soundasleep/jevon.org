---
layout: page
title:  "SVG in Latex"
author: jevon
date:   2010-05-24 13:45:12 +1200
tags:   [Latex, Code Snippets]
---

[Articles](articles.md) > [Latex](latex.md)

It is possible to convert [SVG](svg.md) images into Postscript (PS) images for use in [Latex](latex.md) documents, using the command line.

1. Download and install <a href="http://www.inkscape.org/">Inkscape</a>.
1. Download the <a href="http://kaioa.com/node/63">`inkscapec.exe` command-line utility</a>, and copy this to your Inkscape directory.
1. Add the location of Inkscape (e.g. `C:\program files\Inkscape`) to your PATH.

You can now convert SVG images to PS images (along with a <a href="http://inkscape.modevia.com/inkscape-man.html#synopsis">wide range of other formats</a>: [PNG](png.md), [PS](ps.md), [EPS](eps.md) or [PDF](pdf.md)) using the command line:

`inkscapec -P out.ps in.svg`

I wrote a script (**svg2ps**) in [PHP](php.md) that iterates over all SVG files in the current directory and converts them to PS files:

```
<?php

$dir = ".";

// Open a known directory, and proceed to read its contents
if (is_dir($dir)) {
  if ($dh = opendir($dir)) {
    while (($file = readdir($dh)) !== false) {
      if (strtolower(substr($file, -4)) == ".svg") {
        $file_ps = str_replace(".svg", ".ps", $file);
        echo "$file => $file_ps\n";
        // add the full working directory
        $target_file = getcwd() . "\\" . $file_ps;
        $source_file = getcwd() . "\\" . $file;
        passthru("copy \"$source_file\" c:\\1.svg");
        passthru("inkscapec -P c:\\1.ps c:\\1.svg");
        passthru("copy c:\\1.ps \"$target_file\"");
        unlink("c:\\1.svg");
        unlink("c:\\1.ps");
      }
    }
    closedir($dh);
  }
}
```

(I am copying the files to the root directory, because this interface seems to struggle with Windows paths.)

## How Not to do SVG in Latex
Other than the above approach, I also tried:

1. Imagemagick `convert`: This renders the vector image into a raster image, losing the vector information.
