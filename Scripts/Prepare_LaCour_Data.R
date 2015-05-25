#store LaCour Data as an Rdata file

# read in and store (note I am not including the .csv in this repo as it is 19.7MB)
# data are no longer available for download. 
LaCour_Data <- read.csv("./Data/LaCour_data.csv", stringsAsFactors = F, header = T)
save(LaCour_Data, file = "./Data/LaCour_Data.Rdata")

# test
load("./Data/LaCour_Data.Rdata")









