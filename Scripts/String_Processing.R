#' Example string processing functions using R

my_string <- "Example STRING, with numbers (12, 15 and also 10.2)?!"

lower_string <- tolower(my_string)

second_string <- "Wow, two sentences."
my_string <- paste(my_string,second_string,sep = " ")

my_string_vector <- str_split(my_string, "!")[[1]]

grep("?",my_string_vector)

grepl("?",my_string_vector[1])
	 
str_replace_all()

str_extract_all()