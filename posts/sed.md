---
title: Find-and-Replace with Sed
author: Ayelet Drazen
date: 2023-01-18
---

# Using `sed`

`sed` is one of the most powerful commands when it comes to data wrangling in
the shell.  It's called a "stream editor" because you can use it to make edits
to a "stream" of text, which could either be a file or the output of another
program.

## Find-and-Replace

The simplest way to use `sed` is for finding a word and replacing it with
another word:

```sh
cat input.txt | sed 's/hello/hi/g'
```

Let's look at this in detail:

* `sed` takes as its argument a "command string", which tells it what to do
* The first letter of the command string is the command itself.  In this case
we used `s`, the "substitute" command.  This is the general find-and-replace
command, and is likely the most common one you'll use.
* The next symbol in the string is a "divider"; in this case we used
a forward-slash `/`.  This divider is used to separate the different parts of
the command string.
* The second part of the command string is the "target", i.e., the string to be
replaced.  In this case we are replacing the word `hello`.
* The third part of the command string is the "replacement", i.e., the string
to insert.  In this case we are replacing `hello` with `hi`.
* The final part of the command string is a "flag".  We could leave this blank,
but in this case we used the `g` (global) flag.  This tells `sed` to replace
_every_ instance of `hello`, not just the first one on each line.

## Regular Expressions

![xkcd 1171](../xkcd/perl_problems.jpg)

We can also use `sed` with regular expressions, just like we did with `grep` in
our [previous post](grep.html).
