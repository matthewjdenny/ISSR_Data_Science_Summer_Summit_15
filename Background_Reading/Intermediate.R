###### ISSR Intro To R Workshop, 2/20/15, contact mdenny@polsci.umass.edu #####


###### Preliminaries -- Setting Up R To Do Work ######

# Clear your workspace -- This gets rid of all of the information that was there when you started to you have a clean slate.
rm(list = ls())

# Set your working directory -- This is where R goes to look for files and save stuff by default. You will need to do this for each computer you run your script file on. In RStudio, you can go to Session -> Set Working Directory -> Choose Directory and select a folder from a drop down menu. For me, this looks like:
setwd("~/Dropbox/RA_and_Consulting_Work/ISSR_Consulting_Work/Intermediate_R")


###### cat vs. print ######

# the cat function will print things without "" marks around them, which often looks nicer, but it also does not skip to a new line if you call it multiple times inside of a function (something we will get to soon) or a loop. Lets try out both:
print("Hello World")
cat("Hello World")

#now we can try them inside bracketts to see how cat does not break lines:
{
    cat("Hello")
    cat("World")
}

{
    print("Hello")
    print("World")
}

###### The paste function and making informative messages ######

#the paste function takes as many string, number or variable arguments as you want and sticks them all together using a user specified separator:

# lets define a variable to hold the number of fingers we have:
fingers <- 10
#now lets print out how many fingers we have:
print(paste("Hello,", "I have", fingers, "Fingers", sep = " "))
#now lets separate with dashes just for fun:
print(paste("Hello,", "I have", fingers, "Fingers", sep = "-----"))

#now lets try the same thing with cat
cat(paste("Hello,", "I have", fingers, "Fingers", sep = " "))
#however, with cat, I can just skip the paste part and it will print the stuff directly
cat("Hello,", "I have", fingers, "Fingers")

#if we want cat to break lines while it is printing, we can also include the "\n" symbol at the end (or anywhere for that matter)
cat("My Grocery List:\n", "1 dozen eggs\n","1 loaf of bread\n 1 bottle of orange juice\n", "1 pint mass mocha")

###### For Loops ######

#this is a way to automate performing tasks my telling R how many times you want to do something. Along with conditional statments and comparison operators, loops are more powerful than you can immagine. Pretty much everything on your computer can be boiled down to a combinations of these.

# for (           i in           1:10){
# for each number i in the range 1:10

# example of a for() loop -- first lets make a vector of data
my_vector <- c(20:30)
# take a look
cat(my_vector)

for(i in 1:length(my_vector)){
    my_vector[i] <- sqrt(my_vector[i])
}
#display the result
cat(my_vector)


###### If/Else Statements ######

# these give your computer a "brain", they let it see if somethng is the case, and dependent on that answer your compute can then take some desired action.

#if(some condition is met){
#     do something
#}

#lets try an example to check and see if our number is equal to 20
my_number <- 19
if(my_number < 20){
    cat("My number is less than 20")
}
my_number <- 22
if(my_number < 20){
    cat("My number is less than 20")
}


# example of an if statement
my_vector <- c(20:30)
for(i in 1:length(my_vector)){
    cat("Current Index:",i,"Value:",my_vector[i],"\n")
    if(my_vector[i] == 25){
        cat("The square root is 5! \n")
    }
}


# you can also add in an else statement to do something else if the condition is not met.
my_vector <- c(20:30)
for(i in 1:length(my_vector)){
    cat("Current Index:",i,"Value:",my_vector[i],"\n")
    if(my_vector[i] == 25){
        print("I am 25!")
    }else{
        print("I am not 25!")
    }
}


###### Functions ######

#user defined functions allow you to easily reuse a section of code

#define a function that will take the sum of a particular column of a matrix (where the column index is a number)
my_column_sum <- function(col_number,my_matrix ){ 
    #take the column sum of the matrix
    col_sum <- sum(my_matrix[,col_number])
    return(col_sum)
}

#lets try it out
my_mat <- matrix(1:100,nrow=10,ncol=10)
#look at out matrix
my_mat
#take its column sum
my_column_sum(1,my_mat)


# a more complicated example -- write a function to go get the number of results that pop up for a given name in google scholar. First we will need to load a few packages which will help us out along the way.
library(scrapeR)
library(stringr)

get_google_scholar_results <- function(string, return_source = FALSE){
    
    # print out the input name
    cat(string, "\n")
    
    # make the input name all lowercase
    string <- tolower(string)
    
    # split the string on spaces
    str <- str_split(string," ")[[1]]
    
    # combine the resulting parts of the string with + signs so "Matt Denny" will end up as "matt+denny" which is what Google Scholar wants as input
    str <- paste0(str,collapse = "+")
    
    # add the name (which is now in the correct format) to the search querry and we have our web address.
    str <- paste("https://scholar.google.com/scholar?hl=en&q=",str,sep = "")
    
    # downloads the web page source code
    page <- getURL(str)
    
    # search for the 'Scholar</a><div id="gs_ab_md">' string which occurs uniquely right before google Scholar tells you how many results your querry returned
    num_results <- str_split(page,'Scholar</a><div id=\\"gs_ab_md\\">')[[1]][2]
    
    # split the resulting string on the fist time you see a "(" as this will signify the end of the text string telling you how many results were returned. 
    num_results <- str_split(num_results,'\\(')[[1]][1]
    
    # Print out the number of results returned by Google Scholar
    cat("Querry returned", tolower(num_results), "\n")
    
    # Look to see if the "User profiles" string is present -- grepl will return true if the specified text ("User profiles") is contained in the web page source. 
    if(grepl("User profiles",page)){
        
        # split the web page source (which is all one string) on the "Cited by " string and then take the second chunk of the resulting vector of substrings (so we can get at the number right after the first mention of "Cited by ")
        num_cites <- str_split(page,"Cited by ")[[1]][2]
        
        # now we want the number before the < symbol in the resulting string  (which will be the number of cites)
        num_cites <- str_split(num_cites,"<")[[1]][1]
        
        # now let the user know how many we found
        cat("Number of Cites:",num_cites,"\n")
    }else{
        # If we could not find the "User profiles" string, then the person probably does not have a profile on Google Scholar and we should let the user know this is the case
        cat("This user may not have a Google Scholar profile \n")
    }
    
    # If we specified the option at the top that we wanted to return the HTML source, then return it, otherwise don't.
    if(return_source){
        return(page) 
    }
}

#now lets have some fun...
get_google_scholar_results("Joya Misra")

get_google_scholar_results("Laurel Smith-Doerr")

get_google_scholar_results("Brian Schaffner")

get_google_scholar_results("Gary Becker")




###### A Data Cleaning Example ######

# lets read in some data
load("Example_Data.Rdata")

# This is a dataset with metadata on all bills introduced in the United States Congress between 2011-2012. Among many variables, it contains indicators of the number of cosponsors, the month the bill was introduced, the chamber it was introduced in (House or Senate), the major topic code (see reference list below) and the party of the sponsor. 

# Lets say we wanted to look at a subset of all bills that were introduced in the House that were about any of the first ten topics and then take a the sum of the number of bills introduced in each month by each party that passed the house and divide by the total number of cosponsorships they recieved to get a weight for the effectiveness of each cosponsorship. Here are the topics: 

# Major topic numbers --- 
# 1. Macroeconomics  
# 2. Civil Rights, Minority Issues, and Civil Liberties  
# 3. Health  
# 4. Agriculture  
# 5. Labor and Employment  
# 6. Education  
# 7. Environment  
# 8. Energy  
# 9. Immigration  
# 10. Transportation 
# 12. Law, Crime, and Family Issues 
# 13. Social Welfare 
# 14. Community Development and Housing Issues 
# 15. Banking, Finance, and Domestic Commerce 
# 16. Defense 
# 17. Space, Science, Technology and Communications 
# 18. Foreign Trade 
# 19. International Affairs and Foreign Aid 
# 20. Government Operations

# lets start by subsetting our data -- we only want HR bills with a major topic less than 11 
reduced_data <- data[which(data$BillType == "HR" &  data$Major < 11),]

#define a matrix to hold our calcuated statistics
party_monthly_statistics <- matrix(0, nrow = 10, ncol = 2)

#now we loop over months
for(i in 1:10){
    
    #now for each month we loop over parties
    for(j in 1:2){
        # set teh variable we are going to lookup against for party ID
        if(j == 1){
            party <- 100
        }else{
            party <- 200
        }
        
        current_data <- reduced_data[which(reduced_data$Party == party & reduced_data$Major == i),]
        
        if(length(current_data[,1]) > 0){
            # Now subset to those that passed the house
            current_data <- current_data[which(current_data$PassH == 1),]
            
            #calculate the weight
            cosponsorship_weight <- length(current_data[,1])/sum(current_data$Cosponsr)
            
            #check to see if it is a valid weight, if not, set equal to zero
            if(is.nan(cosponsorship_weight) | cosponsorship_weight > 1 ){
                cosponsorship_weight <- 0
            }
            
            #take that weight and put it in our dataset
            party_monthly_statistics[i,j] <- cosponsorship_weight
        }

    }
}

# load the labels for bill major topics
load("Topic_Lookup.Rdata")
#replace a really long one with a shorter title for plotting
major_topic_lookup[2,1] <- "2. Civil Rights"

#specify the dimensions of our PDF output and the title
pdf(width = 5,height = 8, file = "My_Plot.pdf")

#we want a wider margin on the bottom and left sides so our text will fit. margins go (bottom, left, top, right)
par(mar = c(13,5,2,2))

# plot our data using matplot which lets us easily plot more than one series on the same axes
matplot(x= 1:10,  #this tells matplot what the x values should be
        y=cbind(party_monthly_statistics[,2],party_monthly_statistics[,1]), #this reverses democrat and republican so it is easier to see the democrat points and then specifies the y values
        pch = 19, #this sets the point type to be dots 
        xlab = "", #this say do not plot an x label as we will specify it later
        ylab = "Cosponsorships Per Passed Bill", #the y label
        xaxt = "n", #dont plot any x-axis ticks 
        col = c("red","blue"), #the colors for the dots, blue is democrat, red is republican
        ylim = c(-0.01,.2) #the y-limits of the plotting range
        )

#now we can add a custom x-axis with our text labels
axis(side = 1, at = 1:10, tick = FALSE, labels = major_topic_lookup[1:10,1], las = 3)

#we are done making our pdf so finalize it
dev.off()

