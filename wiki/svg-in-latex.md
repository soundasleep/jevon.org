---
layout: page
title:  "SVG in Latex"
author: jevon
date:   2010-05-24 13:45:12 +1200
---

[[Articles]] > [[Latex]]

It is possible to convert [[SVG]] images into Postscript (PS) images for use in [[Latex]] documents, using the command line.

# Download and install <a href="http://www.inkscape.org/">Inkscape</a>.
# Download the <a href="http://kaioa.com/node/63">`inkscapec.exe` command-line utility</a>, and copy this to your Inkscape directory.
# Add the location of Inkscape (e.g. `C:\program files\Inkscape`) to your PATH.

You can now convert SVG images to PS images (along with a <a href="http://inkscape.modevia.com/inkscape-man.html#synopsis">wide range of other formats</a>: [[PNG]], [[PS]], [[EPS]] or [[PDF]]) using the command line:

[code]inkscapec -P out.ps in.svg[/code]

I wrote a script ('''svg2ps''') in [[PHP]] that iterates over all SVG files in the current directory and converts them to PS files:

[code]<?php

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
}[/code]

(I am copying the files to the root directory, because this interface seems to struggle with Windows paths.)

==How Not to do SVG in Latex==
Other than the above approach, I also tried:

# Imagemagick `convert`: This renders the vector image into a raster image, losing the vector information.

[[Category:Latex]]
[[Category:Code Snippets]]