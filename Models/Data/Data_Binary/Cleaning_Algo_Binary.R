
#  - This document imports, cleans, and creates new excel data sets 
#    to be later recalled in single-line form in other code


# Read in Packages
library(readxl) # Import excel data frames
library(ggplot2) # Graphs
library(gridExtra) # Organize graphs
library(dplyr) # data_binary wrangling
library(tidyr) # data_binary wrangling
library(tinytex) #for RMarkdown
library(openxlsx) #Export data frame into Excel
library(rio) #Export data frame into Excel
library(writexl)


# Import and attach data_binary set 
data_binary <- read_excel("/Users/sawyerbenson/Documents/Master Thesis/Thesis_Github/Models/Data/Data_Binary/data_binary.xlsx")
attach(data_binary)

data_binary <- drop_na(data_binary) # Drop Na Values

# Removing Outliers

# log(sold_price)
x <- log(data_binary$sold_price)

Q1 <- quantile(x, probs=.25)
Q3 <- quantile(x, probs=.75)
iqr = Q3-Q1
upper_limit = Q3 + (iqr*1.5)
lower_limit = Q1 - (iqr*1.5)
data_binary <- subset(data_binary, (x <= upper_limit) & (x >= lower_limit))

# photo_count
x <- data_binary$photo_count

Q1 <- quantile(x, probs=.25)
Q3 <- quantile(x, probs=.75)
iqr = Q3-Q1
upper_limit = Q3 + (iqr*1.5)
lower_limit = Q1 - (iqr*1.5)
data_binary <- subset(data_binary, (x <= upper_limit) & (x >= lower_limit))

# living_area
x <- data_binary$living_area

Q1 <- quantile(x, probs=.25)
Q3 <- quantile(x, probs=.75)
iqr = Q3-Q1
upper_limit = Q3 + (iqr*1.5)
lower_limit = Q1 - (iqr*1.5)
data_binary <- subset(data_binary, (x <= upper_limit) & (x >= lower_limit))

# total_area
x <- data_binary$total_area

Q1 <- quantile(x, probs=.25)
Q3 <- quantile(x, probs=.75)
iqr = Q3-Q1
upper_limit = Q3 + (iqr*1.5)
lower_limit = Q1 - (iqr*1.5)
data_binary <- subset(data_binary, (x <= upper_limit) & (x >= lower_limit))

# land_acres
x <- data_binary$land_acres

Q1 <- quantile(x, probs=.25)
Q3 <- quantile(x, probs=.75)
iqr = Q3-Q1
upper_limit = Q3 + (iqr*1.5)
lower_limit = Q1 - (iqr*1.5)
data_binary <- subset(data_binary, (x <= upper_limit) & (x >= lower_limit))

# age
x <- data_binary$age

Q1 <- quantile(x, probs=.25)
Q3 <- quantile(x, probs=.75)
iqr = Q3-Q1
upper_limit = Q3 + (iqr*3.5)
lower_limit = Q1 - (iqr*3.5)
data_binary <- subset(data_binary, (x <= upper_limit) & (x >= lower_limit))

# days_on_market
x <- data_binary$days_on_market

Q1 <- quantile(x, probs=.25)
Q3 <- quantile(x, probs=.75)
iqr = Q3-Q1
upper_limit = Q3 + (iqr*1.5)
lower_limit = Q1 - (iqr*1.5)
data_binary <- subset(data_binary, (x <= upper_limit) & (x >= lower_limit))

# stories
x <- data_binary$stories

Q1 <- quantile(x, probs=.25)
Q3 <- quantile(x, probs=.75)
iqr = Q3-Q1
upper_limit = Q3 + (iqr*1.5)
lower_limit = Q1 - (iqr*1.5)
data_binary <- subset(data_binary, (x <= 14) & (x >= 0))

# beds_total
# - Adjusted in Excel

# bath_full
# - Adjusted in Excel

# bath_half
# - Adjusted in Excel

#Consistency Check after outlier removal
table(data_binary$post_corona_bi)

str(data_binary)
# Structure Change
data_binary$property_type <- as.factor(data_binary$property_type)
data_binary$air_conditioning <- as.factor(data_binary$air_conditioning)
data_binary$appartment_bi <- as.factor(data_binary$appartment_bi)
data_binary$patio_bi <- as.factor(data_binary$patio_bi)
data_binary$school_general <- as.factor(data_binary$school_general)
data_binary$pool_bi <- as.factor(data_binary$pool_bi)
data_binary$rear_yard_access_bi <- as.factor(data_binary$rear_yard_access_bi)
data_binary$roof_type <- as.factor(data_binary$roof_type)
data_binary$gas_type <- as.factor(data_binary$gas_type)
data_binary$out_building_livable_bi <- as.factor(data_binary$out_building_livable_bi)
data_binary$out_building_not_livable_bi <- as.factor(data_binary$out_building_not_livable_bi)
data_binary$appliances_included_bi <- as.factor(data_binary$appliances_included_bi)
data_binary$garage_bi <- as.factor(data_binary$garage_bi)
data_binary$condition <- as.factor(data_binary$condition)
data_binary$energy_efficient_bi <- as.factor(data_binary$energy_efficient_bi)
data_binary$exterior_type <- as.factor(data_binary$exterior_type)
data_binary$exterior_features <- as.factor(data_binary$exterior_features)
data_binary$fire_place_bi <- as.factor(data_binary$fire_place_bi)
data_binary$foundation_type <- as.factor(data_binary$foundation_type)
data_binary$beds_total <- as.factor(data_binary$beds_total)
data_binary$bath_full <- as.factor(data_binary$bath_full)
data_binary$bath_half <- as.factor(data_binary$bath_half)
data_binary$sewer_type <- as.factor(data_binary$sewer_type)
data_binary$spa_location <- as.factor(data_binary$spa_location)
data_binary$stories <- as.factor(data_binary$stories)
data_binary$property_style <- as.factor(data_binary$property_style)
data_binary$city_limit_bi <- as.factor(data_binary$city_limit_bi)
data_binary$subdivision_bi <- as.factor(data_binary$subdivision_bi)
data_binary$termite_contract2 <- as.factor(data_binary$termite_contract2)
data_binary$water_type <- as.factor(data_binary$water_type )
data_binary$waterfront_bi <- as.factor(data_binary$waterfront_bi)
str(data_binary)

# Splits
data_binary$post_corona_bi <- as.factor(data_binary$post_corona_bi)
data_binary$top25_living_area <- as.factor(data_binary$top25_living_area)
data_binary$top50_living_area <- as.factor(data_binary$top50_living_area)
data_binary$bottom25_living_area  <- as.factor(data_binary$bottom25_living_area )
data_binary$bottom50_living_area <- as.factor(data_binary$bottom50_living_area)
data_binary$top25_total_area <- as.factor(data_binary$top25_total_area)
data_binary$top50_total_area <- as.factor(data_binary$top50_total_area)
data_binary$bottom25_total_area <- as.factor(data_binary$bottom25_total_area)
data_binary$bottom50_total_area <- as.factor(data_binary$bottom50_total_area)
data_binary$top25_beds_total <- as.factor(data_binary$top25_beds_total)
data_binary$top50_beds_total <- as.factor(data_binary$top50_beds_total)
data_binary$bottom25_beds_total <- as.factor(data_binary$bottom25_beds_total)
data_binary$bottom50_beds_total <- as.factor(data_binary$bottom50_beds_total)
data_binary$top25_sold_price <- as.factor(data_binary$top25_sold_price)
data_binary$top50_sold_price <- as.factor(data_binary$top50_sold_price)
data_binary$bottom25_sold_price <- as.factor(data_binary$bottom25_sold_price)
data_binary$bottom50_sold_price <- as.factor(data_binary$bottom50_sold_price)
data_binary$top25_dom <- as.factor(data_binary$top25_dom)
data_binary$top50_dom <- as.factor(data_binary$top50_dom)
data_binary$bottom25_dom <- as.factor(data_binary$bottom25_dom)
data_binary$bottom50_dom <- as.factor(data_binary$bottom50_dom)
data_binary$top25_age <- as.factor(data_binary$top25_age)
data_binary$top50_age <- as.factor(data_binary$top50_age)
data_binary$bottom25_age <- as.factor(data_binary$bottom25_age)
data_binary$bottom50_age <- as.factor(data_binary$bottom50_age)
str(data_binary)



# Save cleaned binary data set
write_xlsx(x = data_binary, path = "data_binary_clean.xlsx", col_names = TRUE)

# Test Import and attach
data_binary_clean <- read_excel("/Users/sawyerbenson/Documents/Master Thesis/Github_Thesis_SMB/Models/Data/Data gbm/data_binary_clean.xlsx")
attach("data_binary_clean")
str(data_binary_clean)
View(data_binary_clean)



