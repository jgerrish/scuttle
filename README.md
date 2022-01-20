# scuttle card game engine #

This application is a game engine for card games.

It's written in OCaml and includes a DSL for defining card games.


The game engine is in progress.  Currently, only building a standard deck
and removing a suit from a deck with the parser is possible.

# Development #

To compile run make in the root directory:

$ make

You can then run the game engine interpreter like this:

$ src/scuttle

Right now, only building a basic standard deck works, try typing the following
at the prompt:

builddeck standard;;

or type the following:

builddeck standard remove hearts;;

It will lex the string, parse it, evaluate the parsed expression, build the
deck and write it as a string.


# Dune #

The project was initialized with:

$ dune init proj scuttle --inline-tests


After the first couple commits, the opam switch environment was setup
with:

$ opam switch create . ocaml-base-compiler
$ eval $(opam env)



# Testing #

You can run the unit tests from the command line with the following command.

$ dune build
$ dune runtest

If any tests fail, an exception will be thrown.  No report is
generated.  This is just provided as a basic unit test skeleton
framework for now.

The custom testing library is roughly based on the interface of the
OUnit library.  It is a much more complete and better designed
implementation of unit testing than what is included here.

# Developer Log #

A developer log is included in dev-log.org.  This includes
step-by-step instructions on how the project was built.  It also
includes issues I encountered and solutions I found.


# Useful Resources #

The following were especially helpful resources in building this:

  * The Programming Languages Zoo https://github.com/andrejbauer/plzoo.git
  * The OCaml Programming Guidelines https://www.ocaml.org/learn/tutorials/guidelines.html
  * The Jane Street Style Guide https://opensource.janestreet.com/standards/
  * Developing Applications with Objective Caml https://caml.inria.fr/pub/docs/oreilly-book/ocaml-ora-book.pdf
  * COS 326 Functional Programming
    https://www.cs.princeton.edu/~dpw/courses/cos326-12/info.php
  * CMSC 430 Introduction to Compilers
    http://www.cs.umd.edu/class/spring2015/cmsc430/
  * oUnit https://github.com/gildor478/ounit
