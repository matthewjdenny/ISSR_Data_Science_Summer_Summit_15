# Using C++ code in R

## Overview

As we have noted, R can be perfectly fast for some things but sometimes too slow for other things. In general, R is not the fastest or most memory efficient language out there -- but it is very easy to use, to share, and makes very pretty output. C++ is very fast, but not so easy to use, and was not designed with making pretty output in mind. However, when we put the two together in a smart way, we can both go fast and write code that is relatively easy to use. 

## Requirements for using C++ code with R

If you are using a Mac, you will need to start by making sure you have Xcode + developer tools installed or you will not be able to compile the C++ code that is used in the samplers for this package. You will need to go here: <https://developer.apple.com/xcode/downloads/> and then select the link to the additional downloads page which will prompt you to enter you apple ID. This will let you download the developer tools. This requirement is not unique to this package, but is necessary for all packages that use Rcpp.  
  
If you are using a Windows machine, you will need to make sure you have the latest release of R (3.2.0+) and will also need to install the `Rtools` library before you can use any packages with C++ code in them. It is also highly advised that you use [RStudio](http://www.rstudio.com/) to download and install the package as it seems to play nicer with Rcpp under Windows. You may also want to visit [this blog post](https://cdrv.wordpress.com/2013/01/12/getting-compilers-to-work-with-rcpp-rcpparmadillo/) which has more information on making C++ work with R under Windows. 
  
If you are using a Linux distro, make sure you have a C++ complier installed, but in general, you should not run into as many issues

## Rcpp, RcppArmadillo and RStudio

This is where `Rcpp` comes in. It is an R package that makes incorporating C++ code with R code pretty straightforward. The good folks over at RStudio have also baked in a lot of support for Rcpp right into RStudio, and have included a pretty useful debugger to boot. `RcppArmadillo` is an addon package that gives you access to tons of useful linear algebra functionality in C++. In particular it makes passing in and working with arrays, matricies and vectors pretty easy. Here are some resources to get you started:

* The official website for Rcpp is -- <http://www.rcpp.org/>
* Dirk Edelbuettel has a great site for all things R check out the code and blog sections. He is the creator of the Rcpp package among many others. Here is the link: <http://dirk.eddelbuettel.com/>
* Hadle Wickham's Advanced R book has a nice chapter on Rcpp available here: <http://adv-r.had.co.nz/Rcpp.html>
* You can check out the Armadillo docs here: <http://arma.sourceforge.net/docs.html>. This is where I go to look up functions to see how to use them or if they exist.

## Getting started

To get started writing C++ code using Rcpp, you will definitley want to check out the short tutorial at [this link](https://support.rstudio.com/hc/en-us/articles/200486088-Using-Rcpp-with-RStudio), which provides some nice examples of how to write a C++ function and debug it using RStudio. The basic idea can be illustrated in two screenshots. We start by creating a new file in RStudio by clicking on the **doc+** icon in the top left corner of the screen and select **C++ File** from the dropdown menu.  
  
![oops!](./images/Rcpp1.png)  
  
  
A sample *timesTwo** C++ program will pop up. You will now need to save that file somewhere. Once you have done so, you can click on the **Source** button and you will see that RStudio autmoatically calls `Rcpp::sourceCpp()` on the file.  
  

![oops!](./images/Rcpp2.png)  
  
This will compile the function and make it so we can access the C++ code from R -- super easy and handy! This is all we need to get started. You will inevitably encounter errors and probably want to distribute your code, but for now, you can simply have access to blazing fast C++ functions on your own computer.

## The Armadillo data structures + a template function

The Armadillo data structures provided by the `RcppArmadillo` package are really nice and easy to use, but they are also smart to use right off the bat. The base `Rcpp` package provides its own data structures that can be passed easily between R and C++, but so can the Armadillo data structures. Additionally, the Armadillo data structures are native C++ datastructures while the Rcpp datastructures are "shallow". What this means is that if you are doing tons of writing to really large Rcpp datastructures (say writing lots of big matricies to an `Rcpp::List` object of length 100,000) you can actually run into some serious and very difficult to diagnose segfaults and other bad errors. I ran into a number of very hard to debug problems with by Rcpp code failing after running for several hours while working on the first version of a big machine learnign algorithm a few years back, but after switching to Armadillo datastructures, these issue went away. Lets take a look at some of the datstructures you can pass in. What follows is essentially the template I use for pretty much all of my Rcpp functions. 

	#include <RcppArmadillo.h>
	//[[Rcpp::depends(RcppArmadillo)]]
	using namespace Rcpp;
	//[[Rcpp::export]]
	List My_Function(
		double my_double,
		int some_number,
		arma::vec a_vector,
		arma::mat example_matrix,
		NumericVector array,
		List some_vectors,
		){
		    IntegerVector dim = array.attr("dim"); 
		    arma::cube my_array(array.begin(),dim[0], dim[1], dim[2], false);
			//...
			List to_return(1);
			to_return[0] = some_data;
			return to_return;
		 }

Note that you no longer use the:

	#include <Rcpp.h>

statement as in the example code provided by RStudio, but replace it with:

	#include <RcppArmadillo.h>
	//[[Rcpp::depends(RcppArmadillo)]]
	
Some other things to note:

* This statement tells us that we can call any Rcpp constructs by thier given name without the `Rcpp::` prefix:  
  
  	using namespace Rcpp;
	
* We also put one of these statements before each function we want to make available to R:  
  
  	//[[Rcpp::export]]
  
  We can also define multiple C++ functions in the same file (not necessarily recommended unless osme of them will be used by the main funcction), so we can put one infront of each one we want to make visible.
  
Now lets take a look at the different objects we can pass in. For integers

## Some Examples

## Defining Sub-Functions

## The Boost Library

## Common Pitfalls

## Putting It All Together


