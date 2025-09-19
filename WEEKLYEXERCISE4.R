library(usethis)
git_default_branch()
# default branch == main

library(readr)
library(tidyverse)
library(ggplot2)

olympics <- read_csv("Olympics.csv")

# a. Which countries had the largest delegation of athletes in 1992? 
# Create a tibble that contains only the variables country and athletes.
largest_1992 <- olympics %>%
  filter(year == 1992) %>%
  select(country, athletes) %>%
  slice_max(order_by = athletes, n = 1)

largest_1992

# For the following countries, plot the number of gold medals earned over time:
# United States, France, Germany, Russia, and China.