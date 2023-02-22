---
title: Automate with Makefiles
author: Jonathan Kula
date: 2023-02-13
---

# Using `make`

`make` is the standard generic build system on Unix systems.  It has a powerful
configuration format, called "Makefiles", which allows you to automate
repetitive sequences of tasks like compilation.  This format also supports
_incremental_ compilation, i.e., if you change one source file in a big
project, it'll only recompile what it actually needs to.

## Basic Usage

If you already have a `Makefile`, you can usually just run `make` and it'll
build everything!

```make
make
```

In general, you can ask it to build a _specific_ file by giving it the name of
the file:

```make
make output.exe
```

## Makefiles

Makefiles are an ancient format, and they're really annoying to read and write
as a result.

![xkcd 2510](../xkcd/modern_tools.jpg)

The most basic format is something like this:

```make
foo.o: foo.c
  cc -c foo.c -o foo.o
```

Which says "to build `foo.o` when I have a file called `foo.c`, I need to run
`cc -c foo.c -o foo.o`".

We can make this slightly more general like this:

```make
%.o: %.c
  cc -c $< -o $@
```

Which says "to build any file ending with `.o` when I have a file with the same
name but ending in `.c`, run `cc -c <input> -o <output>`".

## More Info

Check out [this Makefile tutorial website](https://makefiletutorial.com/) if
you want to learn more!
