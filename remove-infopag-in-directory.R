# Script to remove google info page from several PDF and extract the TXT file

library(pdftools)
library(tidyverse)

input_directory <- "data_input/"
output_directory <- "data_output/"

pdf_files <- list.files(input_directory, pattern = "\\.pdf$", full.names = TRUE)


for (file in pdf_files) {
  # Get the file name without the directory path
  file_name <- basename(file)
  
  # Create the output file path
  output_file <- file.path(output_directory, file_name)
  
  # Get the number of pages in the PDF
  info <- pdf_info(file)
  num_pages <- info$pages
  
  # Remove the first two pages and save the modified PDF
  pdf_subset(file, output_file, pages = 3:num_pages)
}

# to-do. Add extraction of txt as in remove-infopag.R