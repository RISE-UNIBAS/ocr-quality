# A simple wordlist from a folder of txt files

library(tidytext)
library(dplyr)
library(readtext)

text_data <- readtext("data_output/*.txt") 

MFW_in_text <- text_data %>%
  unnest_tokens(word, text) %>%
  count(word, sort = TRUE)
