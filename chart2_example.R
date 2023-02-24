
library(dplyr)
library(plotly)

library_data <- read.csv("~/Desktop/INFO201/2017-2023-10-Checkouts-SPL-Data.csv", stringsAsFactors = FALSE)

physical_checkout <- library_data %>% group_by(UsageClass) %>% filter(CheckoutYear == "2023") %>% summarize(Usage = sum(Checkouts)) 

library(ggplot2)
ggplot(physical_checkout) +
  geom_col(aes(x = UsageClass, y = Usage, fill = Usage)) +
  labs(title = "Checkout Usages 2023", 
       x = "Usage", 
       y = "Total Checkouts") 

