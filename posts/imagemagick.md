---
title: Convert Images with ImageMagick
author: Akshay Srivatsan
date: 2023-02-22
---

# Using `magick`

[ImageMagick](https://imagemagick.org/) is like [Pandoc](pandoc.html), but for
images. If you ever have a bunch of images you want to modify programmatically,
ImageMagick should be your tool of choice!

In fact, ImageMagick is almost everyone's tool of choice for this.  You've
almost definitely used it without knowing it before; lots of software and
services that work with images actually call out to ImageMagick under the hood.

![xkcd 2347](../xkcd/dependency.jpg)

# Installation

ImageMagick isn't installed by default (usually).  You can download it by
following the instructions from [its download
webpage](https://imagemagick.org/script/download.php).

## Basic Usage

We can ask ImageMagick to convert an input file format into an output file
format. It'll normally figure out what to do automatically.  Note that the
command you use is called `magick`, not `imagemagick`.  You can also call
`convert` directly (and on some older versions of ImageMagick, you have to; the
`magick` wrapper is relatively new).

```sh
magick convert input.png output.jpg
```

## Modifying Files

We can also do various modifications to the files themselves, by specifying
options between the input and output filenames.  For example, `-quality 50`
compresses the image to 50% quality, `-resize 640x480` resizes it to 640 pixels
wide by 480 pixels tall, `-modulate <brightness>,<saturation>,<hue>` lets you
mess with the colors, etc.

The [ImageMagick
website](https://imagemagick.org/script/command-line-options.php) has a full
list of modifications you can do.
