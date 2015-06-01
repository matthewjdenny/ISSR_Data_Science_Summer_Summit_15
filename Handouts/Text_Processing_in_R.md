# Text Processing in R

## Overview

This tutorial goes over some basic concepts in 


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
	
Notice that the splitting character gets deleted, but we are now left with essentially two sentences, each as a string. Now, lets immagine we are interested in sentences that contain questions marks. We can search for the string in the resulting `my_string_vector` that contains a ? by using the grep() command.

	 grep("?",my_string_vector)
	 
We may also want to check if any individual string in `my_string_vector`

	 grepl("?",my_string_vector[1])
	 





