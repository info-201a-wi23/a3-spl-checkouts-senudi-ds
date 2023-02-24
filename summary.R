library(dplyr)
library(ggplot2)
library(stringr)

library_data <- read.csv("~/Desktop/INFO201/2017-2023-10-Checkouts-SPL-Data.csv", stringsAsFactors = FALSE) 
library_data$Subjects[str_detect(library_data$Subjects, "Politics")] <- "Politics"
library_data$Title[str_detect(library_data$Title, 'Ends with Us')] <- 'It Ends with Us'
library_data$Title[str_detect(library_data$Title, 'Deathly Hallows')] <- 'Harry Potter'

#What is the mean checkouts for digital books and physical books?
## This helps identify whether digital books or physical books are more popular.
mean_usage <- library_data %>% group_by(UsageClass) %>% summarize(mean_books = mean(Checkouts))

#What is the highest number of checkouts for books published in 2023?
## This helps see how many new books are getting checked out giving insight to popularity of books amongside technology
max_publication_2023 <- library_data %>% group_by(PublicationYear) %>% filter(PublicationYear == "2023") %>% summarize(max_checkouts = max(Checkouts, na.rm = TRUE))

#Are Colleen Hoover books or JK Rowling books more popular as of last year?
## Helps us see checkouts for the most popular books by both authors as of 2022 to see which one is more popular and can help us determine why that is
max_popular_books <- library_data %>% filter(Title %in% c("It Ends with Us", "Harry Potter")) %>% group_by(CheckoutYear, Title) %>% summarize(max_checkouts = max(Checkouts)) %>% filter(CheckoutYear == "2022")

#Which type of book had the most checkouts overall?
## Helps us see what the most popular method of accessing books is over the years, as technology has become more prevelant
max_materialtype_year <- library_data %>% filter(MaterialType %in% c("AUDIOBOOK", "BOOK", "EBOOK")) %>% group_by(MaterialType) %>%  summarize(max_material = max(Checkouts))

#What are the mean checkouts for books related to politics from 2017-2023?
##Helps us see the popularity of books related to politics and how that fluctuates by year
mean_politics_checkouts <- library_data %>% filter(Subjects == "Politics") %>% group_by(CheckoutYear) %>% summarize(politics_checkouts = mean(Checkouts))


