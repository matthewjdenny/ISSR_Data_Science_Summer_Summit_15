# ISSR Data Science Summer Summit 2015

## Overview

This Git repo contains all materials necessary for the ISSR Summer Summit Data Science Workshop. You can email me at <consultantmd@issr.umass.edu> or <matthewjdenny@gmail.com> with any questions. There are lots of materials available on my website at: <http://www.mjdenny.com/teaching.html>. To download the materials you see here, you will want to start by downloading a GUI client for Git. 

* For Windows: <https://windows.github.com/>
* For Mac: <https://mac.github.com/>
* For Linux, you may have to rely on the command line, although <https://git-scm.com/downloads/guis> has some options (depending on your distro).

You will then want to `clone` this repo onto your computer using either the 

    https://github.com/matthewjdenny/ISSR_Data_Science_Summer_Summit_15.git

link and your client or by clicking the "Clone in Desktop" button on the right hand side of the page. If you want to directly edit the files posted here and track your changes, you can copy individual files into another directory and create your own repo with the files in it.  We will go over using Github in detail on the first morning of the workshop, so there is no need to spend too much time trying to figure Github out.

## Schedule

This is a draft outline of the workshop schedule, it will likely change over the course of the workshop depending on how fast we end up going.

### Before the workshop

Please check out the following resources:

* This section of Quick R provides a basic overview of the R interface. You can navigate between pages by clicking on the links on the top left -- <http://www.statmethods.net/interface/index.html>
* Please look over the `Intro.R` script located in the `/Scripts` directory in this repo, try running all the commands and plan to come with any questions on the first day.

We will be going over basic R programming (although quickly) on the first day, but the more you have already absorbed the more we can cover!

### Monday

1. **9:00-11:00** We will go over high level materials including setting up RStudio, Github, and remote access, as well as the structure of the workshop. We will also spend some time on internet resources. [**[Tutorial Here]**](https://github.com/matthewjdenny/ISSR_Data_Science_Summer_Summit_15/blob/master/Handouts/R_Power_User_Tutorial.md)
2. **11:00-11:20** Break
3. **11:20-12:00** Work through a mini refresher on basic R programming [**[Script Here]**](https://github.com/matthewjdenny/ISSR_Data_Science_Summer_Summit_15/blob/master/Scripts/Intro.R)
4. **12:00-1:00** Lunch and question time!
5. **1:00-2:00** More R programming -- functions, conditionals and lots of looping. [**[Script Here]**](https://github.com/matthewjdenny/ISSR_Data_Science_Summer_Summit_15/blob/master/Scripts/Intermediate.R), [**[Materials Here]**](https://github.com/matthewjdenny/ISSR_Data_Science_Summer_Summit_15/blob/master/Handouts/Intermediate_R.pdf)
6. **2:00-2:15** Break.
7. **2:15-3:00** Mini unit on text processing using stringr and R's builtin functions. [**[Tutorial Here]**](https://github.com/matthewjdenny/ISSR_Data_Science_Summer_Summit_15/blob/master/Handouts/Text_Processing_in_R.md)
8. **3:00-4:00** Start working on first assignment. [**[Script Here]**](https://github.com/matthewjdenny/ISSR_Data_Science_Summer_Summit_15/blob/master/Scripts/Day_One_Exercise.R)

### Tuesday

1. **9:00-11:00** More advanced data management concepts -- working with multiple datasets, apply functions, more user defined functions.  [**[Materials Here]**](https://github.com/matthewjdenny/ISSR_Data_Science_Summer_Summit_15/blob/master/Handouts/Advanced_Data_Management.pdf), [**[For/While Script Here]**](https://github.com/matthewjdenny/ISSR_Data_Science_Summer_Summit_15/blob/master/Scripts/For_While_Comparison.R), [**[Function Definition Script Here]**](https://github.com/matthewjdenny/ISSR_Data_Science_Summer_Summit_15/blob/master/Scripts/My_Functions.R)
2. **11:00-11:10** Break.
3. **11:10-12:00** Start introduction to HPC and Big Data.  [**[Slides Here]**](https://github.com/matthewjdenny/ISSR_Data_Science_Summer_Summit_15/blob/master/Handouts/HPC_Intro.pdf)  
4. **12:00-1:00** lunch and question time!
5. **1:00-3:00** Continue intro to HPC and Big Data -- focus on examples with parallelization. [**[Slides Here]**](https://github.com/matthewjdenny/ISSR_Data_Science_Summer_Summit_15/blob/master/Handouts/HPC_Programming.pdf) 
6. **3:00-4:00** Start working on second assignment.  [**[Script Here]**](https://github.com/matthewjdenny/ISSR_Data_Science_Summer_Summit_15/blob/master/Scripts/Day_Two_Exercise.R)

### Wednesday

1. **9:00-11:00** More HPC example code and introduction to Rcpp and RcppArmadillo for performant R programming. [**[HPC Slides Here]**](https://github.com/matthewjdenny/ISSR_Data_Science_Summer_Summit_15/blob/master/Handouts/HPC_Programming.pdf), [**[Rcpp Tutorial Here]**](https://github.com/matthewjdenny/ISSR_Data_Science_Summer_Summit_15/blob/master/Handouts/Rcpp_Tutorial.md) 
2. **11:00-11:10** Break.
3. **11:10-12:00** Mini unit on incorporating functions from the boost libraries.
4. **12:00-1:00** Lunch and question time!
5. **1:00-3:00** Code portability and package development -- walk through tools available for distributing your code.
6. **3:00-4:00** Work on developing personal R package. 

## Resources

* Quick-R has a bunch of easy to read tutorials for doing all sorts of basic things -- <http://www.statmethods.net/>.
* Hadley Wickham wrote a book that covers a bunch of advanced functionality in R, titled **Advanced R** -- which is availabe online for free here -- <http://adv-r.had.co.nz/>.
* Hadley Wickham also wrote a book on R packages, aptly named **R Packages** -- which is also availabe online for free here -- <http://r-pkgs.had.co.nz/>.
* The official website for Rcpp is -- <http://www.rcpp.org/>
* Dirk Edelbuettel has a great site for all things R check out the code and blog sections. He is the creator of the Rcpp package among many others -- <http://dirk.eddelbuettel.com/>
* Tim Chuches has a nice tutorial on paralellization in R, [available here](https://github.com/timchurches/smaRts/blob/master/
parallel-package/R-parallel-package-example.md)

