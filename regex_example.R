# Using regex for cleaning a text.
# e.g. Ver- sammlung

probe <- "Ver-
sammlung 4 herzlichſt fiir aber_erwerbsloser"

clean_text <- probe %>%
  base::gsub("-\n", "", ., perl = T) %>%
  base::gsub("\\d", "", ., perl = T) %>%
  base::gsub("ſ", "s", ., perl = T) %>%
  base::gsub("_+", " ", ., perl = T) %>%
  base::gsub("\\bfiir\\b", "für", ., perl = T)


# See the results
clean_text

# Some explanations

## The double backslash \\ is used because \ is an escape character in R. In other environments, like a text editor (sublime, vscode) it would not be necessary: \d, for digits; \b for word boundaries)

## perl = T this argument it's not strictly necessary since the pattern is straightforward and doesn't use any advanced regex features.

## base:: is a namespace. It is not necessary here, it indicates to wich package the function gsub() belongs