# Using C++ code in R

## Overview

As we have noted, R can be perfectly fast for some things but sometimes too slow for other things. In general, R is not the fastest or most memory efficient language out there -- but it is very easy to use, to share, and makes very pretty output. C++ is very fast, but not so easy to use, and was not designed with making pretty output in mind. However, when we put the two together in a smart way, we can both go fast and write code that is relatively easy to use. 

## Rcpp, RcppArmadillo and RStudio

This is where `Rcpp` comes in. It is an R package that makes incorporating C++ code with R code pretty straightforward. The good folks over at RStudio have also baked in a lot of support for Rcpp right into RStudio, and have included a pretty useful debugger to boot. `RcppArmadillo` is an addon package that gives you access to tons of useful linear algebra functionality in C++. In particular it makes passing in and working with arrays, matricies and vectors pretty easy. Here are some resources to get you started:

* The official website for Rcpp is -- <http://www.rcpp.org/>
* Dirk Edelbuettel has a great site for all things R check out the code and blog sections. He is the creator of the Rcpp package among many others. Here is the link: <http://dirk.eddelbuettel.com/>
* Hadle Wickham's Advanced R book has a nice chapter on Rcpp available here: <http://adv-r.had.co.nz/Rcpp.html>
* You can check out the Armadillo docs here: <http://arma.sourceforge.net/docs.html>. This is where I go to look up functions to see how to use them or if they exist.

## Getting Started

To get started writing C++ code using 

## Using The Armadillo Data Structures

## Some Examples

## Defining Sub-Functions

## The Boost Library

## Common Pitfalls

## Putting It All Together


