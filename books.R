# install packages
install.packages("tidyverse")
library(tidyverse)
library(dplyr)
library(readr)
library(ggplot2)

install.packages('lemon')
library(lemon)

knit_print.data.frame <- lemon_print

# import data 
books <- read.csv("~/Downloads/books.csv", stringsAsFactors = FALSE)

# check data for nulls and types
is.null(books)
glimpse(books)

# question 1: Which authors have the highest average ratings?
top_n(books, n=3, ratings_count) %>% 
  ggplot(., mapping=aes(x=reorder(authors, -ratings_count), y=ratings_count)) + geom_bar(stat='identity', fill='plum3') +
  labs(title="Top 3 Authors with the Most Ratings", x="Top Authors", y="Number of Ratings") +
  theme(plot.title=element_text(face='bold', size=18), axis.title.x=element_text(face="bold"), axis.title.y=element_text(face="bold"))


# question 2: Which book on GoodReads has the highest rating and review count?
q2 <- books %>% 
  arrange(desc(ratings_count)) %>% 
  slice(1:10)
q2 <- q2 %>% 
  arrange(desc(average_rating))

q2_result <- select(q2,title, authors)
print(q2_result)


