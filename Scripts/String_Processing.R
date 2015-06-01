#' Example string processing functions using R

# install.packages("stringr")
library(stringr)

#' Create a string
my_string <- "Example STRING, with numbers (12, 15 and also 10.2)?!"
cat(my_string, "\n")

#' lowercase it
lower_string <- tolower(my_string)
cat(lower_string, "\n")

#' lets paste two strings together
second_string <- "Wow, two sentences."
my_string <- paste(my_string,second_string,sep = " ")
cat(my_string, "\n")

#' lets split the string, note that a list is returned so to access the actual 
#' vector containing the split strings, we need to use the list operator and 
#' the first entry
my_string_vector <- str_split(my_string, "!")[[1]]
print(my_string_vector)

#' look for a queston mark
grep("\\?",my_string_vector)

#' use a logical grep statement
grepl("\\?",my_string_vector[1])
	 
#' replace every instance of "e" with "___"
str_replace_all(my_string, "e","___")

#' extract all numbers as a vector
str_extract_all(my_string,"[0-9]+")
