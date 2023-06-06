# Evaluation of OCR output quality. Given a OCR output evaluate the quality comparing it with a ground truth.

library(readr)
library(stringdist)

# Define the reference and hypothesis strings. The reference is the ground truth and the hypothesis is the direct OCR output.

# Example: just one page (p. 715 in pdf), from Schriften_des_Deutschen_Vereins_Arm

reference <- read_file("data/text_controlled_level0_pag-715.txt")
hypothesis <- read_file("data/ocr_text_pag-715_google.txt")

# Compute the CER. Levenshtein distance == "lv"
cer <- stringdist(reference, hypothesis, method = "lv") / nchar(reference)

# Print the CER
print(cer)

# Print the CER in %. Uwaga! CER values can exceed 100% (between 0-1) if the OCR output is longer (many insertions)
print(cer*100)
