library(usethis)
git_default_branch()
# default branch == main

library(readr)
library(tidyverse)
library(ggplot2)

olympics <- read_csv("Olympics.csv")

# a. Calculate a new variable, called ‘total.medals’, which is the sum of gold, 
# silver, and bronze, and add it to the Olympic dataset.
olympics$total.medals <- olympics$gold + olympics$silver + olympics$bronze

# b. For each country, how many gold medals has it won?
country_gold <- olympics %>%
  group_by(country) %>%
  summarise(total_gold = sum(gold))

# c. For each year, how many total medals were given out?
year_medals <- olympics %>%
  group_by(year) %>%
  summarise(total_medals = sum(total.medals))