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

RStudio (available for free for non-comercial applications here: <http://www.rstudio.com/>) is an integrated development environment (IDE) for R that makes lots of things easier. I will be outlining a number of things you can do to customize and maximize your use of RStudio below.

RStudio provides a number of extensions and upgrades to the base R user experience, some of which are menu driven. I will go over a few of these below:

1. One of the things you will do most often is set you working directory. This is a way to tell your computer where you want to look for data by default, and where you have stored or want to store output. It is just a folder on your computer and can be set to your My Documents folder, although I suggest you create a separate folder for each project and keep all of the files, data and scripts for the project in that one folder. RStudio provides an easy menu driven way to do this. Note that you have several choices: you can choose to search for the folder if you select **Choose Directory**, or set your working directory to the folder that contains the R script file you are working on (only works if the script has already been saved and is in a folder where you have your data/want your output to go) if you select **To Source File Location**. This will also print the R command to your console pane, and then you can copy it into your script file so that you do not have to keep searching for the folder every time you open R but instead can just enter the one line R command that sets your working directory.  


 ![There was a problem!](./images/img1.png)

2. Under the code tab, R also has a handy functionality to comment or un-comment a block of code. This will come in handy if you discover that some of your code is incorrect or you just want to save it but make sure you do not run it by accident and do not want to comment the lines by hand.  
  
 ![There was a problem!](./images/img2.png)

3. Perhaps the most important menu item in RStudio is the button that takes you to the **Global Options** for RStudio. From this menu, you will be able to change the overall appearance and functionality of R and RStudio.  

 ![There was a problem!](./images/img3.png)

4. One of the most relevant things you may want to do is change the window layout in RStudio. As you may notice in the workshop, I have my windows set up a different way from the default. You can change the layout on your computer by clicking to **Pane Layout** tab and checking the boxes as they are in the picture below:  
  
  ![There was a problem!](./images/img4.png)

5. There are another couple of options I highly suggest you change from their default values by clicking through to the **Code Editing** tab in the options window. I strongly suggest you check the box to **soft-wrap R source files** as this will make very long lines of R code wrap around to the next line so you do not have to keep side scrolling (extremely useful). I would also enable **Show line numbers** and **Show indent guides** as they will be helpful when you start writing longer programs. The line numbers are particularly helpful when you are trying to get help from somebody else.    
  
 ![There was a problem!](./images/img5.png)

6. Another useful feature of RStudio not found in the Options window is its integrated help window. On my setup, this can be found by clicking on the **Help** tab in the bottom right pane. In the top right of the help window there is a search bow where you can type in a function name and RStudio will display a bunch of useful information including a description of the function, its usage and arguments which you will need to actually use it in you own code, and all the way at the bottom there will be working examples which are often really helpful!  
  
  ![There was a problem!](./images/img9.png)

7. One other really useful feature of RStudio is the Run button, which much like its Stata counterpart, allows you to run a selected line or lines of code from your script file without having to copy the code into the console. You can also do this by using **Control + Enter** with text in the script file highlighted (Windows/ Linux) or **Command + Enter** (Mac). These are huge time savers.   
  
  ![There was a problem!](./images/img10.png)

8. Before you go off coding your brains out, you will need to be able to create a new R script file, which you can do from  the top left corner of the **Source** pane and then by selecting **R Script**. You will then want to immediately save this file which can be done by going to the file menu or by clicking on the floppy disk icon right next to the new file icon (which will only become active and light up when you have unsaved changes to the current script).   
  
  ![There was a problem!](./images/img11.png)

9. The environment pane is probably the single most useful feature of RStudio. It lets you see a visual representation of all of the variables and objects you have currently stored in memory. For the objects in the **Data**  and **Values** tabs with a little blue arrow next to them, you can click on them and they will appear in spreadsheet form over in your **Source** pane so you can actually see the values. You can also see the variable type  (character, integer, numeric, etc.) of a variable, vector, matrix, etc. which can be very useful in diagnosing problems with your data (for example numbers being read in as characters -- which the regression functions in R do not like!).   
  
  ![There was a problem!](./images/img12.png)

10. One other very important thing you will need to do in RStudio is set the location where it should search for packages before you download them. In the **Options** window, go to the **Packages** tab, click change under the **CRAN mirror** heading and select either **USA(MD)** or **USA(MI)}** (I find these work best for the east coast). Then click **OK** and then **Apply**. This will make sure that R knows where to look for packages when you ask it to download them.
      
 ![There was a problem!](./images/img13.png)





## Github

**Git** is a form of version control, which allows you to track changes you make to your R code (or any files for that matter), for free, and it makes collaborating waaayyy easiier because it helps you resolve conflicts if you and a coauthor try to edit the same thing at the same time. For more on why you should use Git, check out [this page](http://www.git-tower.com/learn/git/ebook/mac/basics/why-use-version-control).   
  
You should start by going to <https://github.com/> and creating an account. You will want to include an up-to-date email address, a link to your academic website (if you have one), and generally keep your profile nice and clean -- after all, this is a public site you are putting forward.  
  
Once you have a GitHub account set up, you will want to start by installing Git on the computer you are using. This can be done pretty easily by Googling "install git on [my OS]", but I will give some pointers here just for good measure. You should definitely spend the 15 minutes necessary to read [this tutorial](https://guides.github.com/activities/hello-world/) by the folks at gihub first though. If you have a Mac or Windo ws machine, there are perfectly good GUIs available -- [here for mac](https://mac.github.com/), and [here for windows](https://windows.github.com/) and you should just use one of those. I will provide some notes on using the Mac github client (which I use most often) and then a tutorial on the commandline version for Linux. As far as I know, the windows version of the Github client should work just as well as teh Mac version does.

### Mac

The Github client is a really well designed program. Once you have downloaded and installed it, try opening the application up.


### Linux (Or Mac via Command Line)
Once you have an account set up on Github, you will need to install Git on your machine. You can google the directions for your distro but here is the command you should type into the terminal on an Ubuntu machine:

    sudo apt-get install git-core
	
And here are the commands for installing on a CentOS machine (if you already have `yum` installed -- which you should):

    sudo yum install git

Once Git is installed on your Linux machine, open up a terminal and `cd` to your home directory. Then type in:

	git config --global user.name "your-name"
	git config --global user.email "your-email"

Now set up git to use SSH by generating a public key:

	ssh-keygen -t rsa -b 2048 -N ""
	cat ~/.ssh/id-rsa.pub.
	
Go to Github to your user settings, click on the SSH tab and add your key. Now `clone` the repo you want to use (assuming you have already created it on Github, which is advisable the first time around) by `cd`ing to the place where you want to clone the directory to and then:

	git clone git@github.com:YOUR_USERNAME/YOUR_PROJECT.git

You will also need to change the way you `push` to use `ssh` instead of `https`. To do this you will need to alter the `.git/config` file in the directory where your project is located by changing the url line in a manner analogous to the example below and then saving the file:

	cd /pathToYourLocalProjectFolder
	gedit .git/config

now change the line that looks like this:

	url=https://github.com/matthewjdenny/example.git 

to make it look like this:

	url=ssh://git@github.com/matthewjdenny/example.git 

Once you have done that, here are the commands you need to `pull`, `commit` and `push`:

	# pull
	cd /pathToYourLocalProjectFolder
	git pull origin master  
	  
	# commit
	git add .
	git commit -m "type your commit message here"  
	  
	#push -- note you should pull first to prevent any errors
	git pull origin master
	git push origin master

## Files

## Remote Access

## Tricks

## Putting It All Together


