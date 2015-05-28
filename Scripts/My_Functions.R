#This file contains the source code for two user defined functions.
#1. takes a matrix input and creates an output that is thresholded so that all values of the matrix above the given number are set to one and the rest are set to zero.
#2. returns a vector of row sums of a matrix
#3. adds 10 to a number


#1. Threshold Function

Threshold <- function(thresh = 1, matrix){
    for(i in 1:length(matrix[,1])){
        for(j in 1: length(matrix[1,])){
            if(matrix[i,j] > 0){
                matrix[i,j] <- 1
            }else{
                matrix[i,j] <- 0
            }
        }
    }
    return(matrix)
}

#2 RowSum Function

Row_Sums <- function(matrix){
    vector <- rep(0, length(matrix[,1]))
    for(i in 1: length(matrix[,1])){
        vector[i] <- sum(matrix[i,]) 
    }
    return(vector)
}

# Add ten to an entry
AddTen <- function(num){
    num <- num + 10
    return(num)
}