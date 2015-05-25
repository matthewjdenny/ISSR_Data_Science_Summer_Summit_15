###### ISSR Intro To R Workshop, 10/20/14, contact mdenny@polsci.umass.edu #####


###### Preliminaries -- Setting Up R To Do Work ######

# Clear your workspace -- This gets rid of all of the information that was there when you started to you have a clean slate.
rm(list = ls())

# Set your working directory -- This is where R goes to look for files and save stuff by default. You will need to do this for each computer you run your script file on. In RStudio, you can go to Session -> Set Working Directory -> Choose Directory and select a folder from a drop down menu. For me, this looks like:
setwd("~/Dropbox/RA_and_Consulting_Work/ISSR_Consulting_Work/Intro_To_R")



###################################################
###### Basic Data Structures and Operations  ######
###################################################


###### Comparison Operators ######
5 < 6
5 > 6
5 == 5
5 != 6
5 <= 5

#R will do its best to make two quantities comparable
5345 == "5345" 

#However if we assign a value to a variable, then it will compare the value in the varaible 

#FALSE
i = 5
i == "i"

#TRUE
i = "i"
i == "i"


##### Creating Data in R #####

# assign a value to a variable (no spaces or symbols other than . or _ in your name)
my_value <- 24

# create a vector using the concatenation operator
my_vector <- c(1:10)

#take a look at what is stored in your variable
print(my_vector)

# get the length of the vector
length(my_vector)

# create a matrix (can only hold one kind of data -- usually numbers)
my_matrix <- matrix(c(1:25),nrow = 5,ncol=5 )

#Lets make some fake data!
student_id <- c(1:10)
grades <- c("A","B","C","A","C","F","D","B","B","A")
#the rep() function repeats some variable x for a specified number of times.
class <- c(rep(0,times = 5),rep(1,times = 5))
free_lunch <- rep(TRUE,times = 10)


#put them together to make a data frame, use the stringsAsFactors = FALSE argument so that we do not turn our letter grades into factor varaibles (a kind of categorical varialbe that R likes)
data <-data.frame(student_id,grades,class,free_lunch, stringsAsFactors = FALSE)

#set column names
colnames(data) <- c("Student ID", "Student Grade","Class","Free Lunch?")

#lets search through our data and take subsets 

#the which() function will let us identify observations that meet a certain criteria. This example also introduces the dollar sign operator which will let us access a variable in a data frame by name:
which(data$Grades == "A")

#now we can create a new dataset that only includes A or B students by saving the indexes of the A and B students and then using them to extract a subset of the total students:
A_students <- which(data$Grades == "A")
B_students <- which(data$Grades == "B")
students_for_reduced_dataset <- c(A_students,B_students)

#use the vector to index only the rows we want and extract them, saving them to a new object. Note that we index by [row,column] and if we leav one of these fields blank then we take the entire row (or column).
reduced_data <- data[students_for_reduced_dataset,]


# Create an empty list
my_list <- vector("list", length = 10)
# Create a list from objects
my_list <- list(10, "dog",c(1:10))
# Add a sublist to a list
my_list <- append(my_list, list(list(27,14,"cat")))

print(my_list)


##################################
######      Data I/O        ######
##################################

#in this section we are going to write our school children data to a csv file and then read the data back in to another R object. We are also going to learn how to save R objects. 

#make sure you do not write row names, this can really mess things up!
write.csv(x=data, file = "school_data.csv", row.names = FALSE)

#now we are going to read the data back in from a .csv. You should make sure that you specify the correct separator (the write.csv function defaults to using comma separation). I always specify stringsAsFactors = FALSE to preserve any genuine string variables I read in.
school_data <- read.csv(file = "school_data.csv", stringsAsFactors = FALSE,sep = ",")

## Excel Data ##
#we will need to load a package in order to read in excel data. This will extend the usefulness of R os that we can now read in .xlsx files.

#first we need to download the package, we can either do this manually or by using the package manager in base R. You need to make sure you select dependencies = TRUE so that you download the other packages that your package depends on, otherwise it will not work! Here is the manual way:
install.packages("xlsx", dependencies = TRUE)

#now we have to actually load the package so we can use it. We do this using the library() command
library(xlsx)

#write our school children data to an xlsx file:
write.xlsx(data, file = "school_data.xlsx", row.names=FALSE)

#now we can read in our data from the excel file:
excel_school_data <- read.xlsx(file = "school_data.xlsx", sheetIndex =1, stringsAsFactors = FALSE)

## Stata Data ##
#we need the foreign package to read in data from Stata:
install.packages("foreign", dependencies = TRUE)

#load the package
library(foreign)

#write data to a .dta file:
write.dta(data,file = "school_data.dta")

stata_school_data <- read.dta(file = "school_data.dta")


## Rdata files ##

#finally we may want to read and write our data to an Rdata file that can hold everything in our workspace or just a couple of things. This is a very good strategy for saving all of your files after a day of working so you can pick back up where you left off:

#save just a few objects:
save(list = c("data", "reduced_data"), file = "Two_objects.Rdata")

#or save your whole working directory
save(list= ls(), file = "MyData.Rdata")

#now lets test it out by clearing our whole workspace (note that if we do this we will need to reload any packages we were using manually as they do not get saved to the .Rdata file)
rm(list= ls())

#now we can load the data back in! It is good practice to set our working directory again first (remeber to change this to the folder location where you downloaded the workshop materials or saved this script file!):
setwd("~/Dropbox/RA_and_Consulting_Work/ISSR_Consulting_Work/Intro_To_R")

#load in the two objects
load(file = "Two_objects.Rdata")

#load in everything
load(file = "MyData.Rdata")



##################################
###### More Advanced Topics ######
##################################

# we will go over these if we have time. Otherwise you are free to play around with these examples yourself. They are some of the most powerful constructs in R!

###### For Loops ######

# example of a for() loop
my_vector <- c(20:30)
for(i in 1:length(my_vector)){
    my_vector[i] <- sqrt(my_vector[i])
}
#display the result
print(my_vector)


###### If/Else Statements ######

# example of an if statement
my_vector <- c(20:30)
for(i in 1:length(my_vector)){
    if(my_vector[i] == 25){
        print("The square root is 5!")
    }
}


# you can also add in an else statement to do something else if the condition is not met.
my_vector <- c(20:30)
for(i in 1:length(my_vector)){
    if(my_vector[i] == 25){
        print("I am 25!")
    }else{
        print("I am not 25!")
    }
}


###### Functions ######

#define a function that will take the sum of a particular column of a matrix
my_function <- function(col_number,my_matrix ){ 
    #take the column sum of the matrix
    col_sum <- sum(my_matrix[,col_number])
    return(col_sum)
}


