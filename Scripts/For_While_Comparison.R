#example comparing for and while loops
vector <- rep(0, 10000000)
random <- round(runif(1,1,10000000))
vector[random] <- 1

#now find the index of that number
forfind <- function(vector){
    for(i in 1:length(vector)){
        if(vector[i] == 1){
            index <- i
        }
    }
    return(index)
}

whilefind <- function(vector){
    found <- FALSE
    i <- 1
    while(!found){ 
        if(vector[i] == 1){
            index <- i
            found <- TRUE
        }
        i <- i + 1
    }
    return(index)
}

system.time(whilefind(vector))
system.time(forfind(vector))
system.time(which(vector == 1, arr.ind = T))

