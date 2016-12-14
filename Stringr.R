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

nth <- paste0(1:12, sep = "_", c("st", "nd", "rd", rep("th", 9)))
nth

#14.2.5.1
nth <- paste0(1:12, sep = "_", c("st", "nd", "rd", rep("th", 9)))
nth

#14.2.5.2
str_c("Letter", letters, sep = ": ")
str_c(letters, collapse = ": ")
#sep mutiple strings collase one string

#14.2.5.3
str_length(letters)
str_length(NA)
str_length(factor("abc"))
str_length(c("i", "like", "programming", NA))

hw <- "Hadley Wickham"

str_sub(hw, 1, 6)
str_sub(hw, end = 6)
str_sub(hw, 8, 14)
str_sub(hw, 8)
str_sub(hw, c(1, 8), c(6, 14))
#Odd
str_sub("hahahahah", str_length("hahahahah")/2+1, -str_length("hahahahah")/2-1)
#Even

str<- "1234"
if(str_length(str)%%2 == 0){
  str_sub(str_sub(str, str_length(str)/2, str_length(str)/2+1)) #or -str 2
}else
  str_sub(str_sub(str, str_length(str)/2+1, -str_length(str)/2-1))

#Save this as a function to use
find_middle <- function(my_string){
  if(str_length(my_string)%%2 == 0){
    str_sub(str_sub(str, str_length(my_string)/2, str_length(my_string)/2+1)) #or -str 2
  }else{
    str_sub(str_sub(str, str_length(my_string)/2+1, -str_length(my_string)/2-1))
  }
}

#Use for loop not function
my_string<- c("dsada", "dasd", "12321", "2dsad")

for(sss in my_string){
  print(sss)
  if(str_length(sss) %% 2 == 0 ){
    print(str_sub(sss, str_length(sss)/2, str_length(sss)/2+1))
  }else{ 
    print(str_sub(sss, str_length(sss)/2+1, -str_length(sss)/2-1))
  }
}

#14.2.5.4
?str_wrap()
thanks_path <- file.path(R.home("doc"), "THANKS")
thanks <- str_c(readLines(thanks_path), collapse = "\n")
thanks <- word(thanks, 1, 3, fixed("\n\n"))

cat(str_wrap(thanks), "\n")
cat(str_wrap(thanks, width = 40), "\n")
cat(str_wrap(thanks, width = 60, indent = 2), "\n")
cat(str_wrap(thanks, width = 60, exdent = 2), "\n")
cat(str_wrap(thanks, width = 0, exdent = 2), "\n")

#14.2.5.5
?str_trim()
str_trim("  String with trailing and leading white space\t")
str_trim("\n\nString with trailing and leading white space\n\n")

#14.2.5.6
str_c(c("a", "b", "c"), collapse = ",")
str_length(my_string, )

#14.4.2.1.1
df <- tibble(
  word = words, 
  i = seq_along(word))
df %>% 
  filter(str_detect(words, "x$"))

df %>% 
  filter(str_detect(words, "^x"))
#14.4.2.1.2
df %>% 
  mutate(
    vowels = str_count(word, "[aeiou]"),
    consonants = str_count(word, "[^aeiou]")
  )%>%

#14.4.2.1.3
str_extract_all(words, "[aeiou]")  

#14.4.2.2
df %>% 
  mutate(
    vowels = str_count(word, "[aeiou]"),
    consonants = str_count(word, "[^aeiou]")
  )%>%
  arrange(desc(vowels))


#14.5.1.1
df%>%
  
#14.5.1.2
str_count(sentences)


####
#14.3.1.1
x <- "appds\nadasdle"
str_view(x, "\")"

#14.3.1.2

a <-  "abc"
      
#14.3.2.1.1
b<- "asd$^$dasd"
str_view(b, "\\$\\^\\$")

#14.3.2.1.2
str_subset(words, "^y")

str_view(words, "^.{7}", match = T)
