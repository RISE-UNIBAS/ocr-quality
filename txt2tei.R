# Put txt files into basic TEI files, extracting the year from the file name 
# To be upload to Voyant-Tools using the xml feature for metadata: //bibl//date  //titleStmt//title (to keep the year also in title). 

# It helps to sort documents in the document panel, but not for the export of "trends" data. 

library(stringr)
library(readr)
library(xml2)

# Path to the folder containing the text files and the output xml files
folder_path <- "data_output"
output_folder <- "data_output_xml"

# Get the list of text files in the folder
file_list <- list.files(folder_path, pattern = "*.txt", full.names = TRUE)

# Loop through the text files and extract metadata from filenames
for (file_path in file_list) {
  # Extract the filename and remove the extension
  file_name <- basename(file_path)
  file_name <- str_remove(file_name, "\\.txt$")
  
  # Extract the year and title from the filename
  year <- str_extract(file_name, "\\d{4}")
  title <- file_name
  title_bibl <- str_replace(file_name, "\\d{4}-", "")  # removes numbers in title. 
  
  # Read the content of the text file
  text <- read_file(file_path)
  
  # Create the TEI document structure
  tei <- xml_new_root("TEI") # upload does not work in VT with the namespace 
  #tei <- xml_new_root("TEI", xmlns = "http://www.tei-c.org/ns/1.0")
  teiHeader <- xml_add_child(tei, "teiHeader")
  
  # Create the TEI metadata for the current file
  fileDesc <- xml_add_child(teiHeader, "fileDesc")
  titleStmt <- xml_add_child(fileDesc, "titleStmt")
  xml_add_child(titleStmt, "title", title)
  publication_stmt <- xml_add_child(fileDesc, "publicationStmt")
  xml_add_child(publication_stmt, "p", "Automatic transformation txt2xml")
  sourceDesc <- xml_add_child(fileDesc, "sourceDesc")
  bibl <- xml_add_child(sourceDesc, "bibl")
  xml_add_child(bibl, "title", title_bibl)
  xml_add_child(bibl, "date", year)

  # Create a TEI text element for the current file
  tei_text <- xml_add_child(tei, "text")
  body_node <- xml_add_child(tei_text, "body")
  div_node <- xml_add_child(body_node, "div")
  xml_add_child(div_node, "p", text)
  
  # Save the TEI document as an XML file
  output_file <- paste0(file_name, ".xml")
  output_path <- file.path(output_folder, output_file)
  write_xml(tei, output_path)
  
  # Print a message indicating the successful creation of the XML file
  cat("XML file", output_file, "created successfully.\n")
}
