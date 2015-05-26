# Making The Most of R 

## Overview

This tutorial will provide an overview of using R for complex data management and Data Science tasks and deal with a lot of the setup required to take on bigger projects. I will be making use of RStudio and Github in this tutorial as they provide a lot of useful features and will generally save you time. The overall aporach I have found to work best for large scale, complex, Data Science projects is to use R as the command center, or the glue that holds all the pieces together. R is a good choice for the user facing side of the project because:

* R provides lots of helpful functions and libraries for data management.
* A number of other languages can be easily controlled from, and integrated into R programs (e.g. Bash, C++, Python)
* It is relatively easy to redistribute and extend the code you write for one project by bundling it into a package.
* R provides a nice set of tools for further data analysis and visualization when you have completed data management.
* R projects scale reasonably well -- they make sense on your laptop, but can also run on a cluster without too much trouble.

There will, however, be some applications where R is not the best choice:

* If your project requires a heavy use of natural language processing (NLP), Python offers the best libraries for doing this and may be simpler and easier to use.
* If you will be working with extremely large scale scientific simulations, you should be working directly with a more efficient language such as C, Fortran or C++ (although these can be integrated with R for most projects).
* If you need to do lots of in-memory manipulation of very large datasets (think 10-100+GB on disk), you may want to use a more memory efficient language for everythng.

These tend to be special cases of Data Science tasks, but if you think a project will require some of the above, you are either -- (a) A computer scientist who should not have trouble switching over to some other language, or (b) An ambitious social scientist who should probably go find a computer science collaborator so you do not waste your time on engineering that will not be useful to your career. I have been using the term **Data Science** in this tutorial, but so far I have not defined what I mean by the term, which is what I will do next!

### What is Data Science?

Data Science is a term that gets thrown around a lot in the media these days, it is certainly a hot field even if nobody really knows exactly what it is. To me, **Data Science is more about manipulating your data to get it ready for analysis, and generating useful output, than it is about statistical analysis**. You may be doing some super fancy stats with your data, but the core of what a Data Scientist does is agnostic of what kind of analysis you will be doing. Here are some examples of problems that may require a Data Science approach:

* **Question:** You want to know about patterns of language use by politicians. -- To answer this question you will need to:
0. Determine the population of interest.
1. Collect lots of text data, probably in an unstructured format off of lots of different databased and websites.
2. Organize and process the data into a common format.
3. Extract useful bits of text out of the data and generate a bunch of aggregate level datasets.
4. Analyze your dataset.
* **Question:** You want to be able to rank celebrities by their "influence" on social media.
0. Come up with a list of celebrities.
1. Collect lots of data about celebrities, what they say, and who follows them on a bunch of social media sites. Collect a bunch of data about how they are talked about in the news. 
2. Organize data into a multiplex, text-valued network dataset. 
3. Produce a bunch of different metrics for this dataset that are suitable for further analysis.
4. Analyze your dataset.

I have found that projects like these require you to spend about 95% of your time collecting and preparing your data for analysis, and 5% actually doing the analysis. I have also found that even with very different datasets, I will still end up using the same basic approaches repeatedly. 

## RStudio

RStudio (available for free for non-comercial applications here: <http://www.rstudio.com/>) is an integrated development environment (IDE) for R that makes lots of things easier

## Github

## Files

## Remote Access

## Tricks

## Putting It All Together


