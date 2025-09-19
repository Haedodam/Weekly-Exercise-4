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


# c. For each year, how many total medals were given out?