# A simple wordlist from a folder of TXT files

library(tidytext)
library(dplyr)
library(readtext)

# Read in text data from multiple files stored in the "data_output" directory, using the file names to create document level variables.

text_data <- readtext("data_output/*.txt",
                      docvarsfrom = "filenames", 
                      docvarnames = c("year", "title"),
                      dvsep = "-")

# The code processes the text column in text_data to count the occurrence of each word across all documents.

words_in_text <- text_data %>%
  unnest_tokens(word, text) %>%
  # group_by(doc_id) %>%  # it would group the data by "doc_id" before counting the words, so we can inspect the results by document. group_by(year) groups it by year.
  count(word, sort = TRUE)

view(words_in_text)


