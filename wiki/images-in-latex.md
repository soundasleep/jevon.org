---
layout: page
title:  "Images in Latex"
author: jevon
date:   2010-05-24 13:32:46 +1200
---

[[Articles]] > [[Latex]]

# [[SVG in Latex]]

==Bitmaps in Latex==
For my reports and papers, I use ImageMagick on [[Linux]] (well, [[Cygwin]]) to convert all my bitmap images to EPS files:

[code]mogrify -format eps *.png[/code]

Make sure that none of the images have spaces in them! Tex doesn't seem to like it, though I'm sure a \ would fix that. And then I can include them in pretty much any compilation route like so:

[code]\begin{figure}[hbt]
\centering
\includegraphics[width=80mm]{images/web-ide.eps}
\caption{NetBeans Visual Web Pack 5.5.1}
\label{fig:netbeans-ide}
\end{figure}[/code]

==Visio Images in Latex==
It took me forever but I finally worked out how to get vectorized images from [[Visio]] into [[Latex]]. 

# First, you need to install a [[PDF]] printer such as [[CutePDF]].
# Remove transparency in your Visio file.
# Print out your image to the PDF printer. Make sure that it fits on one A4 page and is oriented correctly.
# Use '''pdf2ps''' to convert the PDF image to a [[PS]] file.
# You can then include this PS file directly into Latex.

I've noted that the on-screen quality of these PS images is fairly shocking, which is disappointing. It appears there is some uncontrollable magic happening in the PDF or PS processes; one solution is to increase the DPI.

# At 600 dpi (the default), fonts at 12pt remained as vectors, but 10pt was being rasterized.
# At 1200 dpi, fonts at 12pt and 10pt remained as vectors, but 10pt italic was being rasterized.
# At 4000 dpi (the highest setting), all fonts remained as vectors, except for some smaller or thinner fonts.
# If you have opacity in your images it appears they will always be rendered poorly by Visio.

(Another option may be adding the "-r2400" parameter to your '''pdf2ps''' command line.)

==Low Quality Images==
If you are using '''pdfopt''' or '''ps2pdf''', and you are getting low-quality images, try adding this parameter to your ps2pdf command line:

[code]ps2pdf -dPDFSETTINGS=/printer input.ps output.pdf[/code]

This will make the final PDF at 300 dpi for all images. More reference: http://www.ghostscript.com/doc/current/Ps2pdf.htm
(Though, in my setup, doing this didn't actually generate the PDF file in the end.)
