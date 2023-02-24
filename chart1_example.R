library(dplyr)
library(plotly)
library(stringr)

library_data <- read.csv("~/Desktop/INFO201/2017-2023-10-Checkouts-SPL-Data.csv", stringsAsFactors = FALSE)

library_data$Title[str_detect(library_data$Title, 'Ends with Us')] <- 'It Ends with Us'
library_data$Title[str_detect(library_data$Title, 'Deathly Hallows')] <- 'Harry Potter'

most_popular_books <- library_data %>% filter(Title %in% c("It Ends with Us", "Harry Potter")) %>% group_by(CheckoutYear, Title) %>% summarize(total_checkouts = sum(Checkouts))
                                                                            


library(ggplot2)
ggplot(most_popular_books, aes(x = CheckoutYear, y = total_checkouts , color = Title)) +
  geom_line() +
  labs(title = "It Ends With Us (Hoover) vs Harry Potter Deathly Hallows (Rowling)", x = "Checkout Year", y = "Total Checkouts") 




