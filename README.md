# OCR quality. Extract, examine, clean, evaluate.

A set of scripts for working with PDF files after OCR. They help to extract the plaintext data from the PDFs, to examine a frequency list of words/tokens, to clean the output with regex, to perform kwic, to evaluate CER.

For R scripts: use `ocr-quality.Rproj` to get already a working directory.

## pdf2text.r
Extract the plaintext from a set of already searchable PDFs

## pdf2text_clean.r

Clean the plaintext with regex

## regex_example.R

Simple code to use regex within R

## wordlist.R

A table of word frequencies from the extracted text

## kwic.r

Another exploration of tokens/words frequencies and kwic (keyword in context)

## cer.R and cer_jiwer.ipynb
Evaluate CER (Character Error Rate) using scripts in R and Python (Jupyter Notebook).

Usage: load the ground truth text (proofread, checked,...) as a "reference" variable and the text passed by OCR into the "hypothesis" variable.