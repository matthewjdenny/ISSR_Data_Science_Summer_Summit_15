subtract <- function(arg1, arg2){
  result <- arg1 - arg2 
  return(result)
}
  
add <- function(arg1, arg2){
  result <- arg1 + arg2 
  res_list <- list(result, arg1, arg2)
  return(res_list)
}

source("./Scripts/My_Functions.R")

AddTen(24)


Row_Sums(matrix(1:100,10,10))


Vector_Sum <- function(vector){
  sum <- 0
  for(i in 1:length(vector)){
    sum <- sum + vector[i]
  }
  return(sum)
}

Matrix_Sum <- function(matrix){
  sum <- 0
  for(i in 1: length(matrix[,1])){
    for(j in 1:length(matrix[1,])){
      cat("Row:",i,"Column:",j,"\n")
      sum <- sum + matrix[i,j]
    } 
  }
  return(sum)
}

for(i in 1:10){
  print(i)
}






my_mat <- matrix(1:400,20,20)


Bad_Sums <- function(matrix){
  vector <- rep(NULL, length(matrix[,1]))
  for(i in c(1,3,5)){
    vector[i] <- sum(matrix[i,]) 
  }
  return(vector)
}


apply(my_mat,1,sum)
Row_Sums(my_mat)

apply(my_mat,2,sum)

my_vec <- 1:1000


is.even <- function(x) x %% 2 == 0

create_dummy <- function(x){
  if(is.even(x)){
    return(1)
  }else{
    return(0)
  }
}
  
my_vec <- sapply(my_vec,create_dummy)

my_list <- list(1,2,3,4,5)
lapply(my_list, create_dummy)

vec1 <- round(runif(100000000,0,1))
vec2 <- round(runif(100000000,0,1))
system.time(cat(vec1%*%vec2,"\n"))

