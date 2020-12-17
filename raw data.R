#### Preamble ####
# Purpose: Prepare and clean the survey data downloaded from [https://www.census.gov/programs-surveys/acs]
# Author:  [CHANGE THIS TO YOUR NAME!!!!]
# Data: 22 October 2020
# Contact:  [_____]
# License: MIT
# Pre-requisites: 



#### Workspace setup ####
library(haven)
library(tidyverse)
setwd("D:\\Downloads")
# Read in the raw data (You might need to change this if you use a different dataset)
raw_data <- read_dta("D:\\Downloads\\ns20200625.dta");raw_data
# Add the labels
raw_data <- labelled::to_factor(raw_data)
# Just keep some variables
reduced_data <- 
  raw_data %>% 
  select(interest,
         registration,
         vote_2016,
         vote_intention,
         vote_2020,
         ideo5,
         employment,
         foreign_born,
         gender,
         census_region,
         hispanic,
         race_ethnicity,
         household_income,
         education,
         state,
         congress_district,
         age)

365492.37-90339.39
#### What else???? ####
# Maybe make some age-groups?
# Maybe check the values?
# Is vote a binary? If not, what are you going to do?

reduced_data<-
  reduced_data %>%
  mutate(vote_trump = 
           ifelse(vote_2020=="Donald Trump", 1, 0))

# Saving the survey/sample data as a csv file in my
# working directory
write_csv(reduced_data, "reduced_data.csv")


head(reduced_data)
