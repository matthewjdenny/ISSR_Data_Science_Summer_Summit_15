# Speed comparisons and looping examples. 

# === preliminaries === #
#clear workspace
rm(list = ls())
#set your working directory
setwd("~/Dropbox/RA_and_Consulting_Work/ICPSR_Summer_14/HPC_Workshop_Materials")


# ============================================= #
# ============== Day 1 Examples =============== #
# ============================================= #

# sum over a vector of length 10,000,000 using a loop in R
system.time({
    vect <- c(1:10000000)
    total <- 0
    for(i in 1:length(as.numeric(vect))){
        total <- total + vect[i]
    }
    print(total)
})

# sum over the same vector using the built in su function in R whihc is coded in C
system.time({
    vect <- c(1:10000000)
    total <- sum(as.numeric(vect))
    print(total)
})


# generate a very sparse two column dataset 
#number of observations
numobs <- 100000000
#observations we want to check
vec <- rep(0,numobs)
#only select 100 to check
vec[sample(1:numobs,100)] <- 1
#combine data
data <- cbind(c(1:numobs),vec)

# sum only over the entries in the first column where the second column is equal to 1 using an R loop
system.time({
    total <- 0
    for(i in 1:numobs){
        if(data[i,2] == 1)
        total <- total + data[i,1]
    }
    print(total)
})

#sum over the subset of observations where the second column is equal to 1 using the subset function (coded in C)
system.time({
    dat <- subset(data, data[,2] ==1)
    total <- sum(dat[,1])
    print(total)
})

# ============================================= #
# ============== Day 2 Examples =============== #
# ============================================= #

# some preliminaries

# create a vector
my_vector <- c(1:10)
print(my_vector)

# get the length of the vector
length(my_vector)

# comparison operators 
5 < 6
5 > 6
5 == 5
5 != 6
5 <= 5

# example of a for() loop
my_vector <- c(20:30)
for(i in 1:length(my_vector)){
    my_vector[i] <- sqrt(my_vector[i])
}
#display the result
print(my_vector)


# example of a while() loop
my_vector <- c(20:30)
counter <- 1 #set the counter to 1
while(counter <= length(my_vector)){
    my_vector[counter] <- sqrt(my_vector[counter])
    counter <- counter + 1 #increment the counter
}
#display the result
print(my_vector)

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


#an example of a nested loop over all the entries of a matrix

#create a matrix
my_matrix <- matrix(1:100,ncol=10,nrow=10)

#loop over the columns inside the rows
for(i in 1:length(my_matrix[,1])){ #loop over rows
    for(j in 1:length(my_matrix[1,])){ #loop over columns
        if(my_matrix[i,j] %% 2 == 0){ #check to see if the entry is even
            my_matrix[i,j] <- 0
        }
    }
}
#display the result
print(my_matrix)


# create a lsit to store some R objects 

# Create an empty list
my_list <- vector("list", length = 10)
# Create a list from objects
my_list <- list(10, "dog",c(1:10))
# Add a sublist to a list
my_list <- append(my_list, list(list(27,14,"cat")))


# an example of paralellization using the foreach package in R

#create some toy data
data <- matrix(rnorm(10000000),nrow= 1000000,ncol = 100)

#define a function that we are going to run in parallel
my_function <- function(col_number){ 
    #take the column sum of the matrix
    col_sum <- sum(data[,col_number])
    return(col_sum)
}

# Packages:
require(doMC)
require(foreach)
# Register number of cores on your computer
nCores <- 8
registerDoMC(nCores)
# iterations
N <- 100

# Run analysis in serial
system.time({
serial_results <- rep(0,N)
for(i in 1:N){
    serial_results[i] <- my_function(i)
}
})

# Run analysis in parallel
system.time({
parallel_results <- foreach(i=1:N,.combine=rbind) %dopar% {
    cur_result <- my_function(i)
}
})



# example using snowfall parallelization in R

data <- matrix(rnorm(1000000),nrow= 100000,ncol = 100)

#define a function that we are going to run in parallel
my_function <- function(col_number){ 
    #take the column sum of the matrix
    col_sum <- sum(data[,col_number])
    return(col_sum)
}



# Package:
library(snowfall)
# Register cores
numcpus <- 2
sfInit(parallel=TRUE, cpus=numcpus )
# Check initialization
if(sfParallel()){
    cat( "Parallel on", sfCpus(), "nodes.\n" )
}else{
    cat( "Sequential mode.\n" )
}
￼

￼# Export all packages
for (i in 1:length(.packages())){
    eval(call("sfLibrary", (.packages()[i]),
              character.only=TRUE))
}

# Export a list of R data objects
sfExport("data")
# Apply a function across the cluster
indexes <- c(1:100)
result <- sfClusterApplyLB(indexes,my_function)
# Stop the cluster
sfStop()
sum(unlist(result))


# run jobs in parallel using mclapply (only works on a Mac or Linux Machine)

# Packages:
library(parallel)

num_cpus <- 4
data <- matrix(rnorm(10000000),nrow= 1000000,ncol = 100)
#additional argument
vect <- rep(c(1:4),25)


#define a function with two arguments that we are going to run in parallel
my_function <- function(col_number,multiply_by){ 
    #take the column sum of the matrix
    col_sum <- sum(data[,col_number])
    col_sum <- col_sum*multiply_by
    return(col_sum)
}

# Wrapper Function
run_on_cluster <- function(i){
    temp <- my_function(i, vect[i])
    return(temp)
}
# Run analysis
indexes <- 1:100
Result  <- mclapply(indexes, run_on_cluster, mc.cores = num_cpus)


# run analysis of a large dataset using biglm package

# load package:
library(biglm)
data <- matrix(rnorm(10000000),nrow= 1000000,ncol = 100)
data <- cbind(round(runif(1000000),0),data)
# Data must be of data.frame type
data <- as.data.frame(data)


# Use variable names in formula
str <- "V1 ~ V2 + V3 + V4 + V5 + V6"

# run model using bigglm function
model<- bigglm(as.formula(str),
               data = data, 
               family=binomial(), 
               maxit = 20) 

# run the same model using the standard glm package
model2<- glm(as.formula(str),
               data = data, 
               family=binomial(), 
               maxit = 20)







