# Script to remove google info page from PDF and extract the TXT file

library(pdftools)
library(tidyverse)

# First Option. Manually naming the output files----

input_file <- "data_input//Schriften_des_Deutschen_Vereins_Arm_1984.pdf"
output_file <- "data_output/Schriften_des_Deutschen_Vereins_Arm_1984_sampled.pdf"

## Get infos about the pdfs, to get e.g. the number of pages
info <- pdf_info(input_file)

## From the 3th page until the end (check the number of pages, sometimes in just one, sometimes more)
pdf_subset(input_file, output_file, pages = 3:info$pages) %>%
pdftools::pdf_text() %>%
  readr::write_lines(., "data_output/Schriften_des_Deutschen_Vereins_Arm_sampled.txt")

# Second option. name the output file automatically from the pdf metadata----

input_file <- "data_input/Schriften_des_Deutschen_Vereins_Arm_1984.pdf"

## Get infos about the pdfs, to get e.g. the number of pages
info <- pdf_info(input_file)

## gets the title into a variable (shortened if longer than 20 characters). To use it in the namefile
pdf_title <- str_replace_all(info$keys$Title, " ", "_") %>%
ifelse(nchar(.) > 20, substr(.,1,20), .)

## Output files naming
output_file_pdf <- paste0("data_output/", pdf_title,"_sampled", ".pdf")
output_file_txt <- paste0("data_output/", pdf_title,"_sampled", ".txt")

## From the 3th page until the end (check the number of pages, sometimes in just one, sometimes more)
pdf_subset(input_file, output_file_pdf, pages = 3:info$pages) %>%
  pdftools::pdf_text() %>%
  readr::write_lines(., output_file_txt)
