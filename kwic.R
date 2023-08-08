# A quick inspection of texts using quanteda::kwic
# The creation of word frequency tables are slower in this script than in wordlist.R

library(tidytext)
library(dplyr)
library(readtext)

text_data <- readtext("data_output/*.txt",
                      docvarsfrom = "filenames", 
                      docvarnames = c("year", "title"),
                      dvsep = "-")

library(quanteda)
library(quanteda.textstats)
library(tidyverse)
# Creates a quanteda corpus
corpus <- corpus(text_data)

# Creates a summary (sentences, tokens, etc)
summary <- summary(corpus)

# Creates a frequency list of tokens
features_corpus <- textstat_frequency(dfm(tokens(corpus), remove_punct = TRUE))
  view(features_corpus)

# Creates a kwic (keyword in context) for a given term
kwic <- kwic(tokens(corpus), pattern = "йebel")
  view(kwic)
  
    
