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

To get started writing C++ code using Rcpp, you will definitley want to check out the short tutorial at [this link](https://support.rstudio.com/hc/en-us/articles/200486088-Using-Rcpp-with-RStudio), which provides some nice examples of how to write a C++ function and debug it using RStudio. The basic idea can be illustrated in two screenshots. We start by creating a new file in RStudio by clicking on the **doc+** icon in the top left corner of the screen and select **C++ File** from the dropdown menu.  
  
![oops!](./images/Rcpp1.png)  
  
  
A sample *timesTwo** C++ program will pop up. You will now need to save that file somewhere. Once you have done so, you can click on the **Source** button and you will see that RStudio autmoatically calls `Rcpp::sourceCpp()` on the file.  
  

![oops!](./images/Rcpp2.png)  
  
This will compile the function and make it so we can access the C++ code from R -- super easy and handy! This is all we need to get started. You will inevitably encounter errors and probably want to distribute your code, but for now, you can simply have access to blazing fast C++ functions on your own computer.

## Using The Armadillo Data Structures

The Armadillo data structures provided by the `RcppArmadillo` package are really nice and easy to use, but they are also smart to use right off the bat. The base `Rcpp` package provides its own data structures that can be passed easily between R and C++, but so can the Armadillo data structures. Additionally, the Armadillo data structures are native C++ datastructures while the Rcpp datastructures are "shallow". What this means is that


## Some Examples

## Defining Sub-Functions

## The Boost Library

## Common Pitfalls

## Putting It All Together


