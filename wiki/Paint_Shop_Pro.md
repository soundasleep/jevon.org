---
layout: page
title:  Paint Shop Pro
author: jevon
date:   2007-09-19 11:02:42 +12:00
tags:
  - Software
  - Internet
redirect_from:
  - "/wiki/Paint Shop Pro"
---

[Paint Shop Pro](Paint_Shop_Pro.md) is a cheap, awesome graphic editor for [Windows](Windows.md) with its roots based in [Web Development](Web_Development.md).

## Creating Alpha PNG Images in Paint Shop Pro 7
1. Create an image
1. Create a mask (this is the [alpha](alpha.md) layer)
1. Save the mask to an alpha channel
1. **IMPORTANT:** Delete the current mask, and don't merge it into the current layer. If you don't do this, the resulting image will be double-alphad.
1. Save the image to a [PNG](png.md) file.
