
library(dplyr)
library(plotly)
library(stringr)


library_data <- read.csv("~/Desktop/INFO201/2017-2023-10-Checkouts-SPL-Data.csv", stringsAsFactors = FALSE)

library_data$Title[str_detect(library_data$Title, "Politics")] <- "Politics"

world_issues_books <- library_data %>% filter(Title == "Politics") %>% group_by(CheckoutYear) %>% summarize(politics_checkouts = max(Checkouts))

ggplot(world_issues_books) +
  geom_line(mapping = aes(x = CheckoutYear, y = politics_checkouts, color = "Accent")) +
  labs(title = "The Peak of Politics", x = "Year", y = "Max Checkouts of Books Related to Politics")

