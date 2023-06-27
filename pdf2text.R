# Extract text from a OCR-PDF

library(pdftools)
library(tidyverse)
library(tidytext)
library(xfun)

# Simple extraction----

text <- pdftools::pdf_text("data/Schriften_des_Deutschen_Vereins_Arm_1984.pdf") %>%
  # stringr::str_c(., collapse = "") %>%
  readr::write_lines(., "data/Schriften_des_Deutschen_Vereins_Arm_1984.txt")

# A bit of regex for cleaning----
# e.g. Ver- sammlung

probe <- "Ver-
sammlung 4 herzlichſt fiir"

clean_text <- probe %>%
  base::gsub("-\n", "", ., perl = T) %>%
  base::gsub("\\d", "", ., perl = T) %>%
  base::gsub("ſ", "s", ., perl = T) %>%
  base::gsub("\\bfiir\\b", "für", ., perl = T)
clean_text

clean_text <- text %>%
  base::gsub("-\n", "", ., perl = T) %>%
  readr::write_lines(., "data/Schriften_des_Deutschen_Vereins_Arm_1984_clean.txt")

# MFW. To see error patterns----

MFW_in_text <- tibble(text = text) %>%
  unnest_tokens(word, text) %>%  # word-tokens. It needs tibble.
  count(word, sort = T)

# Regex in file directory----  (xfun)
# HANDLE with care!
file_list <- list.files("data/")
# HANDLE with care! gsub_files(file_list, "\\d+", "", perl=TRUE)

# To-Do

# - Add loading multiple files
# - Extract from a certain page (remove info pages)
# - Add Tesseract ?