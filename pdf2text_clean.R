# Extract texts from several OCR-PDFs in a folder and clean the extracted texts with regex

# Atention! Absolut paths in Windows. Use forward slash C:/.../.../ instead of backslash C:\...\...\ 

library(pdftools)
library(readr)

pdf_folder <- "data_input/"
text_folder <- "data_output_clean/"

# Get a list of PDF files in the folder
pdf_files <- list.files(pdf_folder, pattern = "\\.pdf$", full.names = TRUE)

# Loop through each PDF file
for (pdf_file in pdf_files) {
  # Extract text from the PDF
  text <- pdf_text(pdf_file)
  
  # Cleaning operations with regex
  clean_text <- gsub("-\n", "", text)   # Remove hyphens from words at the end of the line
  clean_text <- gsub("\\d+", "", clean_text)      # Remove digits
  clean_text <- gsub("ſ", "s", clean_text)        # Replace "long s" with "s"
  clean_text <- gsub("\\s+", " ", clean_text)     # Replace multiple whitespaces with a single space
  clean_text <- gsub("_+", " ", clean_text) # Replace multiple underscore with space
  
  # Create the corresponding text file path
  file_name <- basename(pdf_file)
  text_file <- file.path(text_folder, paste0(file_name, ".txt"))
  
  # Write the extracted text to the text file
  write_lines(clean_text, text_file)
}
