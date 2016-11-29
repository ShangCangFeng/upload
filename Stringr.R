library(tidyverse)
library(stringr)

x <- c("a4pple", "bana5  na", "pea24r")
str_replace(x, "an", "GF")

#regex
str_replace_all(x, "[:digit:]", "k")
[:blank:]
[:alpha:]
[:graph:]

#Replace the Bu for all words
test_st<- c("BuBuBush", "BUBUBUSH")
str_replace(test_st, "[Bu|BU]*", "_")
