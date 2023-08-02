# Extract texts from several OCR-PDFs in a folder

# Atention! Absolut paths in Windows. Use forward slash C:/.../.../ instead of backslash C:\...\...\ 

library(pdftools)
library(readr)

pdf_folder <- "data_input/"
text_folder <- "data_output/"

# Get a list of PDF files in the folder
pdf_files <- list.files(pdf_folder, pattern = "\\.pdf$", full.names = TRUE)

# Loop through each PDF file
for (pdf_file in pdf_files) {
  # Extract text from the PDF
  text <- pdf_text(pdf_file)
  
  file_name <- basename(pdf_file)
  # Create the corresponding text file path

  text_file <- file.path(text_folder, paste0(file_name, ".txt"))
  
  # Write the extracted text to the text file
  write_lines(text, text_file)
}
