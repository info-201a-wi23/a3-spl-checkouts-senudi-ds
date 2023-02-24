library(dplyr)
library(plotly)
library(stringr)

library_data <- read.csv("~/Desktop/INFO201/2017-2023-10-Checkouts-SPL-Data.csv", stringsAsFactors = FALSE)

library_data$Creator[str_detect(library_data$Creator, "Colleen Hoover")] <- "Colleen Hoover"
library_data$Title[str_detect(library_data$Title, "It Ends With Us")] <- "It Ends With Us"
library_data$Title[str_detect(library_data$Title, "")] <- "It Ends With Us"

colleen_books <- library_data %>% filter(Creator == "Colleen Hoover") %>% group_by(PublicationYear) %>% summarize(most_published_book = max(Checkouts))


library(ggplot2)
ggplot(colleen_books) +
  geom_col(mapping = aes(x = PublicationYear, y = most_published_book , fill = PublicationYear)) +
  labs(title = "Most Popular Colleen Hoover Publication Year", x = "Publication Year", y = "Most Checkouts")
