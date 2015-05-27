# This assignment is pretty simple -- scrape the full text of 100 bills 
# inrtroduced in the Senate in the 112th congress and count the number of unique
# words.  Once you have done this, I encourage you to go further, look for key
# words and try to make some cool looking output. Style points are where it is 
# at!


# Follow the template below but copy and paste all of the code into a script 
# file that you push to your Github repo after completing each step.

rm(list = ls())
# load the necessary libararies
library(stringr)
library(scrapeR)

# Load in the bill urls -- you may need to set your working directory or alter 
# the path below
load("./Data/Bill_URLs.Rdata")

# Try visiting the webiste, you will see that these URL's are from a beta 
# version. The URLs will look like:
# http://beta.congress.gov/bill/112th-congress/senate-bill/886
# What we actually want is something of the form:
# https://www.congress.gov/bill/112th-congress/senate-bill/886/text?format=txt
# we will need to loop through the text and replace the beginning "http://beta."
# with "https://www." and then we will need to paste on "/text?format=txt" at 
# the end of each string. 




# You will want to use str_replace() and paste() functions to do this in a for()
# loop.




# Once you have the right URLs, you will want to scrape the web pages. Lets 
# start with a function adapted from the intermediate workshop:
scrape_page <- function(url){
  
  # Print out the input name
  cat(url, "\n")
  
  # Make the input name all lowercase
  url <- tolower(url)
  
  # Downloads the web page source code
  page <- getURL(url)
  
  # Split on newlines
  page <- str_split(page,'\n')[[1]]
  
  # Start of bill text 
  start <- grep("112th CONGRESS",page)
  
  # End of bill text
  end <- grep("&lt;all&gt;",page)
  
  # Get just the text
  bill_text <- page[start:end]
  
  # Save to a named list object
  to_return <- list(page = page, text = bill_text)
  
  # return the list
  return(to_return)
}

# test it out, take a look at the 
test <- scrape_page( url = "https://www.congress.gov/bill/112th-congress/senate-bill/886/text?format=txt")

# Now you will need to create a list object to store the data in, and loop over 
# URLS to store the data in the list. You will probably want to save your data
# as an .Rdata object using save() at this point. One important point is that 
# you NEED TO INCLUDE a Sys.sleep(5) in your scraping loop so you do not go too
# fast and overwhelm the congress.gov servers. Going too fast can land you in 
# BIG legal trouble (that is called a "denial of service attack") so jsut keep 
# things at a reasonable pace. 







# Now you will need to deal with the text... This function is being given to you
# as a way to clean up a single string.
#TEST: string <- "inspections..#$^relocation..???!!!}{[]()"
Clean_String <- function(string){
  # Lowercase
  temp <- tolower(string)
  # Remove everything that is not a number letter ? or !
  temp <- stringr::str_replace_all(temp,"[^a-zA-Z\\s:\\?\\!]", " ")
  # Shrink down to just one white space
  temp <- stringr::str_replace_all(temp,"[\\s]+", " ")
  # Split it
  temp <- stringr::str_split(temp, " ")[[1]]
  # Get rid of trailing "" if necessary
  indexes <- which(temp == "")
  if(length(indexes) > 0){
    temp <- temp[-indexes]
  }
  return(temp)
}

# The function above will clean one string but you have lots. You can deal with 
# them by filling in the function below:
Clean_Text_Block <- function(text){
  if(length(text) <= 1){
    
    # Check to see if there is any text at all with another conditional
    
    # If there is , and only only one line of text then tokenize it 
    
  }else{
    
    # Get rid of blank lines
    indexes <- which(text == "")
    if(length(indexes) > 0){
      text <- text[-indexes]
    }
    
    # Loop through the lines in the text and use the append() function to 
    # add them to a vector 
    
  }
  
  # Calculate the number of tokens and unique tokens and return them in a 
  # named list object with the tokens using something like 
  # to_return <- list(count = my_count, ...) and then return(to_return)
  
}
  

# Now that we have a function to do this, we will need to loop over the 100 
# bills and save the results into a new list object. 




# Once we have done that, it is time to add up the count variables and maybe 
# plot them 





####### Stretch goals #######
# So, you finished all of that, what next? Here are some other useful things you
# should try to do.

# 1. Write a function that counts the number of times a given word appears in 
# all 100 bills.
# 2. Take a look at the raw html for a bill and try to write a function that 
# that will extract some other pieces of metadata from it (such as the date
# it was introduced, the author, and whether it made it to the floor) and then
# save all of that data into another dataframe.
# 3. Generate a dataframe with two columns, the first has a word and the second
# has the number of times it appears.
# 4. Create an dotplot using ggplot2 showing differences in the use of some 
# word(s) across different bills by some descriptive feature (perhaps author 
# party?)




