# Some helpful functions to tokenize text -- you will need to fill in.

rm(list = ls())
# load the necessar libararies
library(stringr)
library(scrapeR)

load("./Data/Bill_URLs.Rdata")

# Try visiting the webiste, you will see that these URL's are from a beta 
# version. The URLs will look like:
# http://beta.congress.gov/bill/112th-congress/senate-bill/886
# What we actually want is something of the form:
# https://www.congress.gov/bill/112th-congress/senate-bill/886/text?format=txt
# we will need to loop through the text and replace the beginning "http://beta."
# with "https://www." and then we will need to paste on "/text?format=txt" at 
# the end of each string. 


# adapted from example in intermediate workshop script file.
scrape_page <- function(url){
  
  # print out the input name
  cat(url, "\n")
  
  # make the input name all lowercase
  url <- tolower(url)
  
  # downloads the web page source code
  page <- getURL(url)
  
  # split on newlines
  page <- str_split(page,'\n')[[1]]
  
  # start of bill text 
  start <- grep("112th CONGRESS",page)
  
  # end of bill text
  end <- grep("&lt;all&gt;",page)
  
  page <- page[start:end]
  
  return(page)
}

test <- scrape_page( url = "https://www.congress.gov/bill/112th-congress/senate-bill/886/text?format=txt")







#TEST: string <- "inspections..#$^relocation..???!!!}{[]()"
Clean_String <- function(string){
  # lowercase
  temp <- tolower(string)
  # remove everything that is not a number letter ? or !
  temp <- stringr::str_replace_all(temp,"[^a-zA-Z\\s:\\?\\!]", " ")
  # shrink down to just one white space
  temp <- stringr::str_replace_all(temp,"[\\s]+", " ")
  # split it
  temp <- stringr::str_split(temp, " ")[[1]]
  #get rid of trailing "" if necessary
  indexes <- which(temp == "")
  if(length(indexes) > 0){
    temp <- temp[-indexes]
  }
  return(temp)
}

#fill this in.. 
Clean_Text_Block <- function(text){
  if(length(text) <= 1){
    #check to see if there is any text at all..
    
    #if there is , and only only one line of text then tokenize it 
    
  }else{
    # get rid of blank lines
    indexes <- which(text == "")
    if(length(indexes) > 0){
      text <- text[-indexes]
    }
    
    # loop through the lines in the text and use the append() function to 
    # add them to a vector 
    
  }
  
  # calculate the number of tokens and unique tokens and return them in a 
  # named list object with the tokens using something like 
  # to_return <- list(count = my_count, ...) and then return(to_return)
  
}
  






