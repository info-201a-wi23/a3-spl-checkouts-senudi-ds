
library(dplyr)
library(stringr)
library(ggplot2)


library_data <- read.csv("~/Desktop/INFO201/2017-2023-10-Checkouts-SPL-Data.csv", stringsAsFactors = FALSE)

library_data$Subjects[str_detect(library_data$Subjects, "Politics")] <- "Politics"

world_politics_books <- library_data %>% filter(Subjects %in% "Politics") %>% group_by(CheckoutYear, MaterialType, Subjects) %>% summarize(checkouts = sum(Checkouts))


ggplot(world_politics_books, aes(x = CheckoutYear, y = checkouts , color = MaterialType)) +
  geom_line() +
  labs(title = "Checkout Trends of Books Related to Politics", x = "Checkout Year", y = "Total Checkouts") 

