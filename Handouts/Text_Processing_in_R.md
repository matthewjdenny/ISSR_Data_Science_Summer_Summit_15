# Text Processing in R

## Overview

This tutorial goes over some basic concepts in text processing in R. R is not the only way to process text, nor is it really the best way. Python is the defacto programming language for processing text, with a lot of [builtin functionality](http://gnosis.cx/TPiP/) that make it easy to use, and pretty fast, as well as a number of very mature and full featured packages such as [NLTK](http://www.nltk.org/book/) and [textblob](https://pypi.python.org/pypi/textblob). Basic shell scripting can also be many orders of magnitude faster for processing extremely large text corpora -- for a classic reference see [Unix for Poets](http://web.stanford.edu/class/cs124/kwc-unix-for-poets.pdf). Yet there are good reasons to want to use R for text processing, namely that we can do it, and that we can fit it in with the rest of our analyses. I primarily make use of the `stringr` package for the following tuorial, so you will want to install it:

	install.packages("stringr")
	library(stringr)

I have also had success linking a number of text processing libraries written in other languages up to R (although covering how to do this is beyond the scope of this tutorial). Here are links to my two favorite libraries:

* The [Stanford CoreNLP](http://nlp.stanford.edu/software/corenlp.shtml) libraries do a whole bunch of awesome things including tokenization and part-of-speech tagging. They are much faster than the implementation in the `OpenNLP` R package.
* [MALLET](https://github.com/mimno/Mallet) does a whole bunch of useful statistical analysis of text, including an extremely fast implementation of [LDA](http://en.wikipedia.org/wiki/Latent_Dirichlet_allocation). You can check out [examples here](http://mallet.cs.umass.edu/), but download it from the first link above. 

## Regular Expressions

[Regular expressions](http://en.wikipedia.org/wiki/Regular_expression) are a way of specifying rules that describe a class of strings (for example -- every word that starts with the letter "a") that are more succinct and general than simply specifying a dictionary and checking against every possible value that meets some rule. You can start by checking out this link to an [overview of regular expressions](http://www.regular-expressions.info/quickstart.html), and then take a look at this primer on [using regular expressions in R](http://www.regular-expressions.info/rlanguage.html). What is important to understand is that they can be far more powerful than simple string matching.

## Example Commands

Lets start with an example string. 

	my_string <- "Example STRING, with numbers (12, 15 and also 10.2)?!"

First we can lowercase the entire string -- often a good starting place:

	lower_string <- tolower(my_string)
	
We can also take a second string and paste it on the end of the first string:

	second_string <- "Wow, two sentences."
	my_string <- paste(my_string,second_string,sep = " ")
	
Now we might want to split out string up into a number of strings, we can do this by using the `str_split()` function, available as part of the [stringr R package](http://journal.r-project.org/archive/2010-2/RJournal_2010-2_Wickham.pdf). The following line will split the combined string from above on exclamation points:

	my_string_vector <- str_split(my_string, "!")[[1]]
	
Notice that the splitting character gets deleted, but we are now left with essentially two sentences, each as a string. Note that a list object is returned, so to access the actual vector containing the split strings, we need to use the list operator and get the first entry.  
  
Now, lets immagine we are interested in sentences that contain questions marks. We can search for the string in the resulting `my_string_vector` that contains a ? by using the grep() command.

	 grep("\\?",my_string_vector)
	 
One thing you may notice is that the above string does not have jsut a "?", but a "\\?". The reason for this is that the "?" is actually a special character in regular expressions, so we need to escape it with a "\". However, due to the way that strings get passed in to the underlying c function, we actually need a second "\" to ensure that one of them is present when the input is provided to c. You will get the hang of this with practice, but amy want to check out [this list of special characters](http://www.regular-expressions.info/characters.html) that need to be escaped to make them literal. We may also want to check if any individual string in `my_string_vector` contains a question mark. This can be very useful for conditional statements -- for example, if we are processing lines of a webpage, we may want to handle lines with header tags `<h1>` differently than those without header tags, so using a conditional statment with the logical grep, `grepl()`, may be very useful to us. Lets look at an example:

	 grepl("\\?",my_string_vector[1])

There are two other very useful functions that I use quite frequently. The first replaces all instances of some characters with another character. We can do this with the `str_replace_all()` function, which is detailed below: 	 
	 
	 str_replace_all(my_string, "e","___")
	 
Another thing I do all the time is extract all numbers from a string using the `str_extract_all()` function:

	 str_extract_all(my_string,"[0-9]+")
	 

note here that we used out first real regex -- `[0-9]+` which translates to "match any substring that is one or more contiguous numbers". 



