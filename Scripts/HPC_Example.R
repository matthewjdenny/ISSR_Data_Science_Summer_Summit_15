# code to run full example of rare events logit form event histroy models for cross validation
rm(list = ls())
# make sure you have downloaded the biglm and snowfall packages

# EHA Regression Function that will run an individual regression

EHA_Reduced_Reg <- function(index){
    
    #need to change this to the folder where you are storing workshop materials
    setwd("~/Dropbox/RA_and_Consulting_Work/ICPSR_Summer_14/HPC_Workshop_Materials")
    
    #get the lookup from the EHA_congress_number_split_indexes.csv file
    Congress_Split_Lookup <- read.csv("EHA_lookup.csv", header = F, stringsAsFactors = FALSE)
    
    #which congress are we looking at
    congress_number <- Congress_Split_Lookup[index,1]
    #which cross validation split are we working with
    split <- Congress_Split_Lookup[index,2]
    #which independent varaible are we using (add five bcause first five are the same for all models)
    var <- Congress_Split_Lookup[index,3] + 5
    # add 92 to get the actual congress number
    congress_number <- 92+congress_number
    
    #load the data
    load(file = paste("EHA_Reduced_Data_",split,"_",congress_number,".Rdata", sep = ""))
    
    #load the weights for rare events logit weights
    load(file = paste("Weights_",split,"_",congress_number,".Rdata", sep = ""))
    
    #make sure that data is in a data.frame
    reduced_data <- as.data.frame(reduced_data)
    #Turn the bill number into a factor variable
    reduced_data$V4 <- as.factor(reduced_data$V4)
    #senator Specific Factors     
    reduced_data$V2 <- as.factor(reduced_data$V2)
    
    #add in weights to dataset 
    reduced_data$V3 <- weights
    #create the logit formula where: whether a Senator cosponsors in this time period as function of a senator dummy, a bill dummy, time and time squared effects and the number of influencers in the current network that had already cosponsored the bill.
    
    #full specification (will require lots of RAM and run much slower)
    #str <- paste("V1 ~ V2 + V4 + V5 + V5^2 + V",var,sep = "")
    
    #reduced specification for example
    str <- paste("V1 ~  V5 + V5^2 + V",var,sep = "")
    #run the model
    model<- bigglm(as.formula(str), data = reduced_data, family=binomial(),weights = ~V3, maxit = 30) 
    #get the log likelihood
    loglik<- (-.5*model$deviance) 
    return(loglik)
}



# Function to run batch EHA Regressions

Run_Batch_EHA_Regressions <- function(start = 5, end = 5,numedges = 10, splits = 10, numcpus = 6){
    
    #need to change this to the folder where you are storing workshop materials
    setwd("~/Dropbox/RA_and_Consulting_Work/ICPSR_Summer_14/HPC_Workshop_Materials")
    
    #have we already saveed out progress
    already <- FALSE
    
    #the indexes of session of the senate to run over -- we only have the 5 session in my dataset for this exercise but in the paper I go over 12 session
    vector <- c(start:end)
    #loop over each Congress
    for(i in vector){
        print(paste("Currently on Senate Number: ",i+92,sep = ""))
        
        #first index in the current senate 
        st <- numedges*(i-5)+1
        #last index in the current senate
        nd <- numedges*splits*(i-4)
        #these are all of the rows in the EHA_lookup.csv file that we will be looking at
        variable_indexes <- st:nd
        
        ############ now get ready for paralell computing
        #load our packages
        library(snowfall)
        library(biglm)
        #intitalizes snowfall session 
        sfInit(parallel=TRUE, cpus=numcpus )
        
        #check to see if we are running in parallel
        if(sfParallel())
            cat( "Running in parallel mode on", sfCpus(), "nodes.\n" )
        else
            cat( "Running in sequential mode.\n" )
        
        #export all packages and libraries currently loaded in workspace
        for (i in 1:length(.packages())){
            eval(call("sfLibrary", (.packages()[i]), character.only=TRUE))
        }
        
        # apply our problem across the cluster using hte indexes we have determined and load balancing
        cur_result <- sfClusterApplyLB(variable_indexes,EHA_Reduced_Reg)
        
        #stop the cluster when we are done -- this is very important and must be done manually every time
        sfStop()
        
        
        #if we have not already saved our data this time around, save it!
        if(!already){
            result <- cur_result
            save(result, file = "Results.Rdata")
            already <- TRUE
        }else{
            result <- rbind(result,cur_result)
            save(result, file = "Results.Rdata")
        }
        
    }
    #spit back our results
    return(result) 
}


# run cross validation using a cluster
system.time({
    results <- Run_Batch_EHA_Regressions(numcpus = 6)
})



#take a look!
colors <- rep(1,10)
for(i in 2:10){
    colors <- c(colors,rep(i,10))  
}
plot(unlist(results),col = colors, pch = 19,ylab = "likelihood", main = "Likelihood surfaces for 10 splits of data from 97th Senate")


