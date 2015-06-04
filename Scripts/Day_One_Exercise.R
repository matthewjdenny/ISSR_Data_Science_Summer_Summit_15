@@ -1,271 +1,33 @@
# This assignment is pretty simple -- scrape the full text of 100 bills 
# introduced in the Senate in the 112th congress and count the number of unique
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
  page <- getURL(url, .opts = list(ssl.verifypeer = FALSE))
  
  # Split on newlines
  page <- str_split(page,'\n')[[1]]
  
  # Start of bill text 
  start <- grep("112th CONGRESS",page)[1]
  
  # End of bill text
  end <- grep("&lt;all&gt;",page)
  
  if(length(end) > 0 & length(start) > 0){
    # Get just the text
    print(start)
    print(end)
    if(!is.na(start) & !is.na(end)){
      if(start < end & start > 0 & end > 0){
        bill_text <- page[start:end]
      }else{
        bill_text <- ""
      }
    }else{
      bill_text <- ""
    }
  }else{
    bill_text <- ""
  }
  
  
  # Save to a named list object
  to_return <- list(page = page, text = bill_text)
  
  # return the list
  return(to_return)
#for loop
for(i in 1:10){
  print(i)
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
my_vec <- rep(0,100)
my_vec[60] <- 1








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
    
havent_found_the_one <- TRUE
counter <- 1
while(havent_found_the_one == TRUE){
  print(counter)
  if(my_vec[counter] > 0){
    cat("The one is in entry:",counter)
    havent_found_the_one <- FALSE
  }
  
  # Calculate the number of tokens and unique tokens and return them in a 
  # named list object with the tokens using something like 
  # to_return <- list(count = my_count, ...) and then return(to_return)
  
  counter <- counter +1
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



################################################################################
#' Answer Code Below -- Spoiler ALERT!
################################################################################














#' fix bill URLs
bill_urls_fixed <- rep("",100)
for(i in 1:100){
  bill_urls_fixed[i] <- str_replace(Bill_URLs[i],"http://beta","https://www")
  bill_urls_fixed[i] <- paste(bill_urls_fixed[i],"/text?format=txt",sep = "" )
}

#' scrape the data
bill_data <- vector(mode = "list",length = 100)
for(i in 1:100){
  print(i)
  bill_data[[i]] <- scrape_page( url = bill_urls_fixed[i])
}

#' save everything
save(bill_data, file = "./Data/Day_One_Exercise_Bill_Data.Rdata")

#' function to clean text
Clean_Text_Block <- function(text){
  if(length(text) <= 1){
    # Check to see if there is any text at all with another conditional
    if(length(text) == 0){
      cat("There was no text in this bill! \n")
      to_return <- list(num_tokens = 0, unique_tokens = 0, text = "")
    }else{
      # If there is , and only only one line of text then tokenize it
      clean_text <- Clean_String(text)
      num_tok <- length(clean_text)
      num_uniq <- length(unique(clean_text))
      to_return <- list(num_tokens = num_tok, unique_tokens = num_uniq, text = clean_text)
    }
  }else{
    # Get rid of blank lines
    indexes <- which(text == "")
    if(length(indexes) > 0){
      text <- text[-indexes]
    }
    # Loop through the lines in the text and use the append() function to 
    clean_text <- Clean_String(text[1])
    for(i in 2:length(text)){
      # add them to a vector 
      clean_text <- append(clean_text,Clean_String(text[i]))
    }
    num_tok <- length(clean_text)
    num_uniq <- length(unique(clean_text))
    to_return <- list(num_tokens = num_tok, unique_tokens = num_uniq, text = clean_text)
  }
  # Calculate the number of tokens and unique tokens and return them in a 
  # named list object.
  return(to_return)
}

#' run on all bills
clean_bill_text <- vector(mode = "list",length = 100)
for(i in 1:100){
  print(i)
  clean_bill_text[[i]] <- Clean_Text_Block(bill_data[[i]]$text)
}
#' calculate: total_token_count, total_unique_words

total_token_count <- 0
all_tokens <- NULL
for(i in 1:100){
  print(i)
  #keep appending the tokens to a giant vector
  all_tokens <- append(all_tokens,clean_bill_text[[i]]$text)
  total_token_count <- total_token_count + clean_bill_text[[i]]$num_tokens
}
# get unique words
unique_words <- unique(all_tokens)
total_unique_words <- length(unique_words)
cat("There were a total of",total_token_count,"tokens used in all documents and the number of unique words is:",total_unique_words," \n" )

