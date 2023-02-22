---
title: Search with Grep
author: Ayelet Drazen
date: 2023-01-18
---

# Using `grep`

`grep` is a very common command used to search files for a certain word or
phrase.  This is the de-facto tool to use whenever you want to search for
something in a text file; it's so common that many programmers even say
"grepping" instead of "searching", even when they're actually using a tool like
Visual Studio Code which has its own search system.

## Basic Usage

By default, `grep` prints out every line in its input that matches the
"pattern" provided to it as an argument.  For example, this searches a file for
every line containing the word "hello"

```sh
cat input.txt | grep "hello"
```

We can also provide the file as a second argument to `grep`, like this:
```sh
grep "hello" input.txt
```

## Regular Expressions

![xkcd 208](../xkcd/regular_expressions.jpg)

We often want to search for something more complicated than a fixed word or
phrase.  To do this, we can give `grep` a "regular expression", a set of
patterns to match against.  We won't go into the details of regular expressions
here, but here's an example:

```sh
grep -E "oo+" input.txt
```

searches for every line containing two or more o's in a row.
