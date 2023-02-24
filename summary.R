library(dplyr)
library(ggplot2)
library(stringr)

library_data <- read.csv("~/Desktop/INFO201/2017-2023-10-Checkouts-SPL-Data.csv", stringsAsFactors = FALSE) 
library_data$Subjects[str_detect(library_data$Subjects, "Politics")] <- "Politics"

mean_usage <- library_data %>% group_by(UsageClass) %>% summarize(mean_books = mean(Checkouts))

max_publication_2023 <- library_data %>% group_by(PublicationYear) %>% filter(PublicationYear == "2023") %>% summarize(max_checkouts = max(Checkouts, na.rm = TRUE))

max_popular_books <- library_data %>% filter(Title %in% c("It Ends with Us", "Harry Potter")) %>% group_by(CheckoutYear, Title) %>% summarize(max_checkouts = max(Checkouts)) %>% filter(CheckoutYear == "2022")

max_materialtype_year <- library_data %>% filter(MaterialType %in% c("AUDIOBOOK", "BOOK", "EBOOK")) %>% group_by(MaterialType) %>%  summarize(max_material = max(Checkouts))

mean_politics_checkouts <- library_data %>% filter(Subjects == "Politics") %>% group_by(CheckoutYear) %>% summarize(politics_checkouts = mean(Checkouts))


