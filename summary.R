library(dplyr)
library(ggplot2)
library(stringr)

library_data <- read.csv("~/Desktop/INFO201/2017-2023-10-Checkouts-SPL-Data.csv", stringsAsFactors = FALSE) 
library_data$Title[str_detect(library_data$Title, "Politics")] <- "Politics"

mean_usage <- library_data %>% group_by(UsageClass) %>% summarize(mean_books = mean(Checkouts))

max_publication_2023 <- library_data %>% group_by(PublicationYear) %>% filter(PublicationYear == "2023") %>% summarize(max_checkouts = max(Checkouts, na.rm = TRUE))

max_checkouts_hoover <- library_data %>% group_by(Creator) %>% filter(Creator == 'Colleen Hoover') %>% summarize(max_checkouts = max(Checkouts, na.rm = TRUE))

max_checkouts_year <- library_data %>% group_by(CheckoutYear) %>% summarize(total_checkouts = sum(Checkouts)) %>% filter(total_checkouts == max(total_checkouts))

mean_politics_checkouts <- library_data %>% filter(Title == "Politics") %>% group_by(CheckoutYear) %>% summarize(politics_checkouts = mean(Checkouts))


