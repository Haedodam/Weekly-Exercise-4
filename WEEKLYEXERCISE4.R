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
gold_plot <- olympics %>%
  filter(country %in% c("United States", "France", "Germany", "Russia", "China")) %>%
  group_by(country, year) %>%
  summarise(total_gold = sum(gold, na.rm = TRUE)) %>%
  ggplot(aes(x = year, y = total_gold, color = country)) +
  geom_line(size = 1) +
  geom_point(size = 2) +
  labs(
    title = "The number of gold medals earned over time",
    x = "Years",
    y = "Number of gold medals"
  ) +
  theme_minimal()

gold_plot

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

